# action-translate-readme

[English Version](README.md) | [Chinese Version README.md](README.zh-TW.md)

# What's changed for action-translate-readme?

With the emergence of ChatGPT, the author thought that the translation task of this project could be handed over to GPT for implementation. Through the open source project [`gpt4free`](https://github.com/xtekky/gpt4free), we can realize the free GPT API and hope to enhance the translation ability of this project!

* Version 1 translation method: implemented through third-party Linux packages (`translation.sh`)
  * Translation effect: poor, similar to Google Translate
  * Translation speed: slow
  * Stability: high, can ensure correct translation every time

* Version 2 translation method: using GPT for translation task (`translation.py`)
  * Translation effect: good
  * Translation speed: fast or slow
  * Stability: low

  Since `gpt4free` uses reverse engineering to realize free API calls, the calling process may encounter abnormal problems. The author added `retry` technology (they will be executed again when abnormal events occur) when calling the API function to avoid translation failure. As a result, the translation speed will increase with the number of retries.

> Please **note** that there are [different providers](https://github.com/xtekky/gpt4free#models) in `gpt4free`, which are the sources that provide API calls. If you cannot use the automatic translation tool of this project normally, the problem usually comes from the provider currently used and is **inactive**. Therefore, you can set the [parameter](.github\workflows\translate-readme.yml) yourself in your `translate-readme.yml` file (default is `g4f.Provider.DeepAi`).
>
> In addition, since it is a **generative AI** technology, it cannot guarantee that each translation is correct. If the translation effect is not good, you can repeat it several times.


# Introduction

* We all know that writing documents takes a lot of time, but now there is a solution that can save you half of the time. This is our `action-translate-readme`.

* With this tool, you can automatically translate the `README.md` file, not only can translate, but also translates various elements such as **inline code, emojis, code blocks, HTML tags and links.**

* Its operating principle is to achieve automation through `Github Actions`. Just push the updated README file, and the translated README (zh or en) file can be automatically updated.

* Continuous integration (CI)

* **Automatically translate the language of README through Github Action**

* Update `README.md` and push it. This action will automatically update `README.zh-TW.md`
  (Updating `README.zh-TW.md` will automatically update `README.md`)

* Half of the time spent on writing documents is saved.

# Features

* Untranslated:
  * Inline code (`inline_code`)
  * Used for emoji
  * Code block
  * HTML tags
  * Link

# How to use?

1. Click on the :star: icon to add this item to your Github repository.

2. Set your `Github Token`:
    * [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Set
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * Choose scope: `repo` and `workflow`
        * **Keep** your secret token (do not throw it away, it needs to be pasted later)
     
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />
        
    * Create a new **`repository secret`**
        * In your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the tag and name it (eg: `Action_Bot`) in `token`

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />
            
3. Create the README language you want: `README.md`, `READM.zh-TW.md`,...

4. Create your action example in directory `.github/workflows/your_action.yml`.

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

5. Now you can update the `README.md`, and a translated version will be generated automatically!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* View [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Update the test document using our tool

<a href="#top">Back to top</a>