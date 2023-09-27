import asyncio
import os
import re
import subprocess
from multiprocessing.dummy import Pool as ThreadPool

import g4f
from tenacity import retry, stop_after_attempt

LAGNS = os.environ.get('LANGS').split(',')

PROVIDER_MAPPING = {
    f'g4f.Provider.{provider}': getattr(g4f.Provider, provider)
    for provider in g4f.Provider.__all__
}
try:
    PROVIDER = PROVIDER_MAPPING[os.environ.get('PROVIDER')]
except:
    PROVIDER = PROVIDER_MAPPING['g4f.Provider.DeepAi']


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
async def chat_completion(query) -> str:
    response = await g4f.ChatCompletion.create_async(
        model=g4f.models.gpt_35_turbo,
        messages=[{"role": "user", "content": query}],
        provider=PROVIDER
    )
    return response


async def translate_content(content, output_lang):
    """Use GPT for translation"""
    translate_query = (
        f'翻譯以下 markdown 文本為{output_lang}語言，並且遵循以下規則:\n'
        '1. 保持文本原有格式、符號、空格數\n'
        '2. 只需要給我文本翻譯結果，不要有任何描述\n'
        '3. 確切翻譯文本所有內容，留下換行符號\n'
        '4. 以 markdown 程式碼輸出結果:\n'
        '--------------------------------\n'
        f'{content}'
        '--------------------------------\n'
    )
    response = await chat_completion(translate_query)

    check_query = (
        '原始問題與文本:\n'
        f'{translate_content}\n'
        '第一次翻譯結果:\n'
        f'{response}\n'
        '請繼續完成未翻譯的部分，如果已經完成請回答None'
    )
    check_response = await chat_completion(check_query)

    if check_response != 'None':
        response = '\n' + check_response

    return response


def extract_prefix(filename):
    """Extract file prefix path"""
    pattern = re.compile(r'(.*/).*')
    match = pattern.match(filename)
    prefix = match.group(1) if match else ''

    return prefix


async def main():
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
        print(f'{file} changed.')

        prefix_path = extract_prefix(file)

        with open(file, "r", encoding="utf-8") as f:
            content = f.read()

        async def run(output_lang: str):
            if output_lang in file:
                return
            translated_content = await translate_content(content, output_lang)
            output_file = f'{prefix_path}README.{output_lang}.md'
            output_file = output_file.replace('.en', '')

            with open(output_file, "w", encoding="utf-8") as f:
                f.write(translated_content)
            print(f"Translated content written to {output_file}")

        tasks = [run(output_lang) for output_lang in LAGNS]
        await asyncio.gather(*tasks)


if __name__ == "__main__":
    asyncio.run(main())
