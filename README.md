# action-translate-readme

* [English](README.md)
* [Traditional Chinese README.md](README.zh-TW.md)
* [Simplified Chinese README.md](README.zh-CN.md)
* [French](README.French.md)
* [Arabic](README.Arabic.md)


# Introduction

* We all know that writing README documentation can be time-consuming, but now there is a solution that can save you half of your time. This is our `action-translate-readme`.

* Translate different language versions of README via `gpt3.5`.

* Automatically submit (commit, push) the translated files through **Github Actions (CI/CD)**.

* For example: When you **write** or **modify** the English version of the README, the translated versions, such as Traditional Chinese, Simplified Chinese, French, etc., are automatically generated.

Note: The translator of v1 version is implemented through third-party packages on `Linux`; v2 version is implemented through free openai api called [`g4f`](https://github.com/xtekky/gpt4free)


# How to use?

1. Click :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

* [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
  * Settings
  * Developer settings
  * Personal access tokens - `Tokens(classic)`
  * Generate a new token
  * Choose scopes: `repo` and `workflow`
  * **Keep** your secret token (do not lose it, you need to paste it later)

  <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

* Create a new **`repository secret`**
  * In your repository - `settings`
  * `Security and variables`
  * `Actions`
  * `New repository secret`
  * Fill in the tag with `token` and name it (e.g. `Action_Bot`)

  <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Create your action example in the directory `.github/workflows/your_action.yml`. You can just copy the following code:

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
                langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
```

There are three parameters to pay special attention to in `.yml`:

* `token`: The token created in the repo based on step 2.
* `g4f_provider`: The provider of gpt, please refer to the [link](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4) for more information.
* `langs`: The language versions to be generated. Be sure to separate different languages with `,`. For example:
  * `"en"`: Translate only the English version.
  * `"en,zh-TW"`: Translate English and Traditional Chinese.
  * `"French,Arabic"`: Translate French and Arabic.

4. Now you can update `README.md`, and it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* Check out the [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main).
* Use our tool to update the test document.

<a href="#top">Back to top</a>