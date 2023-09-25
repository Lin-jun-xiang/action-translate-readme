import os
import random
import subprocess
from multiprocessing.dummy import Pool as ThreadPool

import g4f
from tenacity import retry, stop_after_attempt

LAGNS = os.environ.get('LANGS').split(',')


class AvailableProviders:
    providers = [getattr(g4f.Provider, provider) for provider in g4f.Provider.__all__]

    @classmethod
    def _test_provider(cls, provider: g4f.Provider) -> str:
        try:
            g4f.ChatCompletion.create(
                model='gpt-3.5-turbo',
                messages=[{"role": "user", "content": 'Hello world'}],
                provider=provider
            )
            return provider
        except:
            return

    @classmethod
    def show(cls, threads_num: int = 4) -> list:
        """Test all the providers then find out which are available"""
        with ThreadPool(threads_num) as pool:
            available_providers = pool.map(
                cls._test_provider, cls.providers
            )
        return [
            available_provider for available_provider in available_providers
            if available_provider is not None
        ]


def run_shell_command(command):
    result = subprocess.run(
        command,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    return result.returncode, result.stdout, result.stderr


@retry(stop=stop_after_attempt(15))
def chat_completion(query, available_providers: list) -> str:
    return g4f.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": query}],
        provider=random.choice(available_providers)
    )


def translate_content(content, output_lang):
    """Use GPT for translation"""
    available_providers = AvailableProviders.show()

    translate_query = (
        f'翻譯以下 markdown 文本為{output_lang}語言，並且遵循以下規則:\n'
        '1. 保持文本原有格式、符號、空格數\n'
        '2. 只需要給我文本翻譯結果，不要有任何描述\n'
        '3. 確切翻譯文本所有內容，留下換行符號\n'
        '4. 以 markdown 程式碼輸出結果:\n'
        '--------------------------------\n'
        f'{content}'
    )
    response = chat_completion(translate_query, available_providers)

    check_query = (
        '原始問題與文本:\n'
        f'{translate_content}\n'
        '第一次翻譯結果:\n'
        f'{response}\n'
        '請繼續完成未翻譯的部分，如果已經完成請回答None'
    )
    check_response = chat_completion(check_query, available_providers)

    if check_response != 'None':
        response = '\n' + check_response

    return response


def main():
    git_diff_command = "git diff --name-only HEAD~1 HEAD"
    return_code, stdout, stderr = run_shell_command(git_diff_command)

    if return_code != 0:
        print('no file changed.')
        return

    modified_files = stdout.split("\n")
    for file in modified_files:
        if "README" not in file:
            print('no README changed.')
            return

        with open(file, "r", encoding="utf-8") as f:
            content = f.read()

        for output_lang in LAGNS:
            if output_lang in file:
                continue
            translated_content = translate_content(content, output_lang)
            output_file = f'README.{output_lang}.md'
            output_file = output_file.replace('.en', '')

            with open(output_file, "w", encoding="utf-8") as f:
                f.write(translated_content)
            print(f"Translated content written to {output_file}")


if __name__ == "__main__":
    main()
