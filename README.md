# action-translate-readme

[English version](README.md) | [Chinese version README.md](README.zh-TW.md)

# What's changed for action-translate-readme?

With the emergence of ChatGPT, the author thought that the translation task of this project could be handed over to GPT to achieve. Through the open-source project [`gpt4free`](https://github.com/xtekky/gpt4free), we can realize free GPT API and hope to improve the translation ability of this project!

* Version 1 translation method: implemented through Linux third-party packages (`translation.sh`)
  * Translation effect: poor, similar to Google Translation
  * Translation speed: slow
  * Stability: high, ensuring correct translation every time

* Version 2 translation method: use GPT for translation task (`translation.py`)
  * Translation effect: good
  * Translation speed: sometimes fast, sometimes slow
  * Stability: low

   Because `gpt4free` uses reverse engineering to realize free calling api, abnormal problems may be encountered during the calling process. The author adds `retry` technology (re-execution occurs when an exception occurs) when calling api functions to avoid translation failures. The translation speed will increase with the number of retries.

> Please ** note ** that there are [different Providers](https://github.com/xtekky/gpt4free#models) in `gpt4free`, which provide sources for calling api. If the automatic translation tool of this project cannot be used normally, the problem usually comes from the current provider being **Inactive**.
>
> Therefore, in your `translate-readme.yml` file, you can set this[parameter](.github\workflows\translate-readme.yml) (default is `g4f.Provider.DeepAi`).
>
> In addition, because it is a ** generative AI ** technology, it is not guaranteed that the translation is correct every time. If the translation effect is not good, you can repeat it several times.

# Introduction

* We all know that writing documentation is time-consuming, but now there is a solution that can save you half of the time. This is our `action-translate-readme`

* With this tool, you can automatically translate the `README.md` file, not only can it translate, but it can also translate ** various elements such as inline code, emoticons, code blocks, HTML tags, and links **

* Its operating principle is automated through `Github Actions`, and only needs to push the updated README file, and the translated README (zh or en) file will be automatically updated.

* Continuous Integration (CI)

* ** Automatically translate the language of README through Github Actions **

* Update `README.md` and push it. This action will automatically update `README.zh-TW.md`
(Update `README.zh-TW.md` and automatically update` README.md`)

* Save half of the time for writing documentation.

# Features

* Untranslated:
  * Inline Code (`inline_code`)

  * Emoticons

  * Code blocks

  * HTML tags

  * Links

# How to use?

1. Click on the : star: icon to add this project to your Github repository.

2. Set your `Github Token`:

   * [Create a new ** `Github Secret Token` **](https://github.com/settings/tokens/new)
     * Set
     * Developer Settings
     * Personal access tokens - `Tokens (classic)`
     * Generate new token
     * Select scope: `repo` and `workflow`
     * **Keep** your secret token (don't lose it, you need to paste it later)
     <img src ="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2"width =" 60%"/>

   * Create a new ** `repository secret` **
       * In your repository - `settings`
       * `Securits and variables`
       * `Actions`
       * `New repository secret`
       * Press `token` to fill in the tag and name (eg: `Action_Bot`)
       <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width =" 60%"/>

4. Create the README language you want: `README.md`,` READM.zh-TW.md`,...

5. Create your action example in the directory `.github/workflows/your_action.yml`.

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

6. Now you can update README.md, and it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* View the [Test Document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Use our tool to update the test document

<a href="#top">Back to top</a>