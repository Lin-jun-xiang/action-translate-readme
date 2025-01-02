import asyncio
import os
import re
import subprocess

import g4f
from tenacity import retry, stop_after_attempt
from zhipuai import ZhipuAI

g4f.debug.logging = True

LAGNS = os.environ.get('LANGS').split(',')
ZHIPUAI_API_KEY = os.environ.get('ZHIPUAI_API_KEY', '')

def run_shell_command(command: str) -> tuple:
    result = subprocess.run(
        command,
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    return result.returncode, result.stdout, result.stderr


@retry(stop=stop_after_attempt(15))
async def chat_completion(query: str) -> str:
    response = ''
    if not ZHIPUAI_API_KEY:
        print('Using g4f.')
        response = await g4f.ChatCompletion.create_async(
            model="gpt-4o",
            messages=[{"role": "user", "content": query}],
        )
    else:
        print('Using zhipuai.')
        response = await ZhipuAI(api_key=ZHIPUAI_API_KEY).chat.asyncCompletions.create(
            model="glm-4-plus",
            messages=[{"role": "user", "content": query}]
        )
    if response == '' or response is None:
        raise Exception
    return response


async def translate_content(content: str, output_lang: str) -> str:
    """Use GPT for translation"""
    if output_lang == 'en':
        output_lang = 'English version'
    elif output_lang == 'zh-TW':
        output_lang = '台灣繁體中文版(Traditional Chinese)'
    elif output_lang == 'zh-CN':
        output_lang = '简体中文(Simplified Chinese)'

    translate_query = (
        f'Translate the following markdown context to [{output_lang}], '
        'adhere to the following rules:\n'
        '1. Maintain the original format, symbols, and spacing of the text.\n'
        '2. Only provide me with the translated text result, without any descriptions.\n'
        '3. Translate all the content of the text accurately, preserving line breaks.\n'
        '4. Display all punctuation marks and parentheses in half-width characters.\n'
        '5. Avoid translate the text in code block or inline code.\n'
        '6. Avoid using the ```markdown ``` code block notation.\n'
        '--------------------------------\n'
        f'{content}'
        '--------------------------------\n'
        'Output the result in "markdown code" format:\n'
    )
    response = await chat_completion(translate_query)

    print(f'\033[36mResponse:\n{response}\033[0m')

    return response


def extract_prefix(filename: str) -> str:
    """Extract file prefix path"""
    pattern = re.compile(r'(.*/).*')
    match = pattern.match(filename)
    prefix = match.group(1) if match else ''

    return prefix


async def main():
    git_last_commit_message = "git show -s --format=%s"
    last_commit_message = run_shell_command(git_last_commit_message)[1].strip()
    if last_commit_message == "Auto-translate README":
        print('Auto translated, skip translate...')
        return

    git_diff_command = "git diff --name-only HEAD~1 HEAD"
    return_code, stdout, stderr = run_shell_command(git_diff_command)
    if return_code != 0:
        print('no file changed.')
        return

    modified_files = stdout.split("\n")
    for file in modified_files:
        if "README" not in file:
            continue
        print(f'{file} changed.')

        prefix_path = extract_prefix(file)

        if not os.path.exists(file):
            print(f'{file} was delete in this commit')
            continue

        with open(file, "r", encoding="utf-8") as f:
            content = f.read()

        async def run(output_lang: str):
            if output_lang in file:
                return
            if output_lang == 'en' and file == 'README.md':
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
