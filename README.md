# action-translate-readme

[English Version](README.md) | [Chinese Version README.md](README.zh-TW.md)

# What's changed for action-translate-readme?

With the emergence of ChatGPT, the author thought that the translation task of this project could be handed over to GPT for implementation. Through the open source project [`gpt4free`](https://github.com/xtekky/gpt4free), we can achieve free GPT API, hoping to improve the translation capability of this project!

* Version 1 translation method: Implemented through third-party Linux packages (`translation.sh`)
  * Translation effect: Poor, similar to Google translation
  * Translation speed: Slow
  * Stability: High, can ensure that every translation is correct

* Version 2 translation method: Translation task is performed through GPT (`translation.py`)
  * Translation effect: Good
  * Translation speed: Sometimes fast, sometimes slow
  * Stability: Low

  Since `gpt4free` is realized by reverse engineering to implement free API calling, anomalies may occur during the calling process. The author added `retry` technology when calling the api function to avoid translation failure. As a result, the translation speed would slow down with the increase of retry times.

> Please note that `gpt4free` has different [Providers](https://github.com/xtekky/gpt4free#models) which provide the source of api calling. If you cannot use the automatic translation tool of this project normally. The problem usually comes from the fact that the Provider currently in use has become **Inactive**.
>
> Therefore, in your `translate-readme.yml` file, you can set this [parameter](.github\workflows\translate-readme.yml) yourself (default is `g4f.Provider.DeepAi`).
>
> In addition, as it is a **generative AI** technology, it cannot ensure that each translation is correct. If the translation effect is not good, you can perform the translation several times.

# Introduction

* We all know that writing documentation is time-consuming, but now there is a solution that can save you half the time. This is our `action-translate-readme`

* With this tool, you can automatically translate the `README.md` document, not only can translate, but also translate **inline code, emoticons, code blocks, HTML tags, links and other elements.**

* Its operation principle is automated through `Github Actions`, only need to push the updated README file, the translated README(zh or en) file can be updated automatically

* Continuous integration (CI)

* **Automatically translate the language of the README file through Github Action**

* Updating `README.md` and pushing it will automatically update `README.zh-TW.md`
    (updating `README.zh-TW.md` will automatically update`README.md`)

* Save half the time writing documentation.

# Features

* Untranslated:
    * In-line code (`inline_code`)

    * For emoticons

    * Code block

    * HTML tag

    * Link

# How to use?

1. Click the :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

    * Create a new **`Github Secret Token`**
        * Setting
        * Developer settings
        * Personal access token - `Tokens(classic)`
        * Generate new token
        * Choose scope: `repo` and `workflow`
        * **Keep** your secret token (don't lose it, you will need to paste it later)
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Create a new **`repository secret`**
        * In your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Tag with `token` and name it (eg:`Action_Bot`)
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

4. Create the **README** language you want: `README.md`,`READM.zh-TW.md`, ...

5. Create your action example in the directory`.github/workflows/your_action.yml`.

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

* See [Test Document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Update the test document with our tool

<a href="#top">Back to top</a>