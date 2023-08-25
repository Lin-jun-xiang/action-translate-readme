# action-translate-readme

[English version] (README.md) | [Chinese version README.md] (README.zh-TW.md)

# What's changed for action-translate-readme?

With the emergence of ChatGPT, the author thought that the translation task of this project could be handed over to GPT for implementation. Through the open source project `gpt4free`, we have achieved free GPT API, hoping to improve the translation ability of this project!

* Translation method for Version 1: Implemented through third-party Linux packages (`translation.sh`)
  * Translation effect: Poor, similar to Google translation effect
  * Translation speed: Slow
  * Stability: High, can ensure that each translation is correct

* Translation method for Version 2: Translation task implemented through GPT (`translation.py`)
  * Translation effect: Good
  * Translation speed: Sometimes slow, sometimes fast
  * Stability: Low
  
  Because `gpt4free` is implemented by reverse engineering to realize the free call of the API, abnormal problems may be encountered during the call process. When calling the API function, the author added a `retry` technique (if an abnormality occurs, it will be executed again) to avoid translation failure. Relatively speaking, the translation speed will increase with the number of retries.

> Please note that there are [different Providers](https://github.com/xtekky/gpt4free#models) in `gpt4free`, which provide sources for calling APIs. If you cannot use this project's automatic translation tool normally, the problem usually comes from the Provider currently in use is **Inactive**. Therefore, in your `translate-readme.yml` file, you can set the [parameter](.github\workflows\translate-readme.yml) yourself (default is `g4f.Provider.DeepAi`). In addition, since it is a technology of **generative AI**, it cannot guarantee that the translation is correct every time. If the translation effect is not good, you can repeat it several times.

# Introduction

* We all know that writing documentation is time-consuming, but now there is a solution that can save you half the time. This is our `action-translate-readme`

* With this tool, you can automatically translate the `README.md` file, which can not only translate, but also can translate various elements such as **inline code, emoji, code blocks, HTML tags, and links**

* Its operation principle is realized through `Github Actions`, and only needs to push the updated README file, and the translated README (zh or en) file can be updated automatically.

* Continuous Integration (CI)

* **Automatically translating the language of README through Github Action**

* Update `README.md` and push it. This action will automatically update `README.zh-TW.md` (updating `README.zh-TW.md` automatically updates `README.md`)

* Save half the time of writing documents.

# Features

* Untranslated:
    * Inline code (`inline_code`)
    * Used for emoji symbols
    * Code blocks
    * HTML tags
    * Links

# How to use ?

1. Click the :star: icon to add this project to your Github repository.

2. Set your `Github Token`:

     * Create a new **`Github Secret Token`**
         * Settings
         * Developer settings
         * Personal access tokens - `Tokens (classic)`
         * Generate new token
         * Select scope: `repo` and `workflow`
         * **Keep** your secret token (don’t throw it away, you will need to paste it later)
         <img src = "https: //github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width =" 60% " />

     * Create a new **`repository secret`**
         * In your repository - `settings`
         * `Securits and variables`
         * `Actions`
         * `New repository secret`
         * Fill in the tag according to `token` and name it (eg: `Action_Bot`)
         <img src = "https: //github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width =" 60% " />

4. Create README language you want: `README.md`, `READM.zh-TW.md`, ...

5. Create your operation example in the directory `.github/workflows/your_action.yml`:

     ```
     # .github/workflows/translate.yml
     name: Translate Readme

     on:
         push:
             branches: ['**']

     jobs:
         translate:
             runs-on: ubuntu-latest
             steps:
                 - name: Checkout
                   uses: actions/checkout@v3
                   with:
                     fetch-depth: 3

                 - name: Auto Translate
                   uses: Lin-jun-xiang/action-translate-readme@v1 # Based on the tag
                   with:
                     token: ${{ secrets.Action_Bot }} # Based on step2 name
     ```

6. Now you can update `README.md`, and it will automatically generate a translated version!

    ![](./img/auto-translation.gif)

---

# Results of Test Document

* View [Test Document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Update the test document using our tool

<a href="#top">Back to top</a>