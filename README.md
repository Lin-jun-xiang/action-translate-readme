# action-translate-readme

[English version](README.md) | [Chinese version README.md](README.zh-TW.md)

# What's changed for action-translate-readme?

With the advent of ChatGPT, the author came up with the idea of using GPT to implement the translation task of this project. Through the open-source project [`gpt4free`](https://github.com/xtekky/gpt4free), we can achieve a free GPT API to enhance the translation capability of this project!

* Version 1 translation method: implemented through Linux third-party packages (`translation.sh`)
  * Translation effect: poor, similar to Google Translate
  * Translation speed: slow
  * Stability: high, can ensure correct translation every time

* Version 2 translation method: translation task using GPT (`translation.py`)
  * Translation effect: good
  * Translation speed: sometimes fast, sometimes slow
  * Stability: low

Since `gpt4free` realizes the free calling API through reverse engineering, abnormal problems may be encountered during the calling process. The author added the `retry` technique (it will be executed again if an exception occurs) when calling the API function to avoid translation failure. As a result, the translation speed will increase as the number of retries increases.

> Please **note** that there are different Providers in `gpt4free` [Provider](https://github.com/xtekky/gpt4free#models), which provide the source for calling the API. If the automatic translation tool of this project cannot be used normally, the problem usually comes from the current used Provider is already **Inactive**.
>
> Therefore, in the `translate-readme.yml` file, you can set the [parameter](.github\workflows\translate-readme.yml) yourself (default is `g4f.Provider.DeepAi`).
>
> In addition, because it is a **Generative AI** technology, it cannot be guaranteed that the translation is correct every time. If the translation effect is not good, you can repeat it several times.

# Introduction

* We all know that writing documentation takes a lot of time, but now there is a solution that can save you half the time. This is our `action-translate-readme`.

* With this tool, you can automatically translate the `README.md` file, not only can you translate, but also translate various elements such as **inline code, emojis, code blocks, HTML tags, and links**

* Its operation principle is automated through `Github Actions`, and only needs to push the updated README file, and the translated README (zh or en) file will be automatically updated

* Continuous Integration (CI)

* **Automatically translate README language through Github Action**

* Update the `README.md` and push it, this action will automatically update `README.zh-TW.md`
    (Update `README.zh-TW.md` automatically update `README.md`)

* Save half the time when writing documentation.

# Features

* Untranslated:
    * Inline code (`inline_code`)

    * Used for emoji

    * Code block

    * HTML tags

    * Links

# How to use?

1. Click the :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

    * Create a new **`Github Secret Token`**
        * Setting
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate a new token
        * Select Scope: `repo` and `workflow`
        * **Keep** your secret token (don't throw it away, paste it later when needed)
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Create a new **`repository secret`**
        * In your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the tag according to`token` and name it (eg: `Action_Bot`)
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

4. Create the **README** language you want: `README.md`, `READM.zh-TW.md`, ...

5. Create your action example in directory `.github/workflows/your_action.yml`.

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
                  uses: Lin-jun-xiang/action-translate-readme@v2 # Based on the tag
                  with:
                    token: ${{ secrets.Action_Bot }} # Based on step2 name
                    g4f_provider: g4f.Provider.DeepAi # You can change this provider
    ```

6. Now you can update `README.md`, and an translated version will be automatically generated!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* View the [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Use our tool to update the test document

<a href="#top">Back to top</a>