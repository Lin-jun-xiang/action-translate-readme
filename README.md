# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [Traditional Chinese Version README.md](README.zh-TW.md)
* [Simplified Chinese](README.zh-CN.md)
* [French](README.French.md)
* [Arabic](README.Arabic.md)


# Introduction

> [!NOTE]
> The translator of version `v1` is implemented through a third-party package on `Linux`; version `v2` is implemented by calling the OpenAI API for free through [`g4f`](https://github.com/xtekky/gpt4free).


* We all know that writing README documentation takes a lot of time, but now there is a solution that can save you half the time. This is our `action-translate-readme`.

* Translate different language versions of README using `gpt3.5`.

* Automatically commit (commit, push) the translated files through **Github Actions (CI/CD)**.

* For example: **Write** or **modify** the English version of README, and automatically generate versions of README in Traditional Chinese, Simplified Chinese, French, etc.


# How to use?


> [!IMPORTANT]
> Since `gpt3.5` is a generative AI model, there is a chance of problems with the translation results each time. It is recommended to use branch testing and try several times.

> [!WARNING]
> If you encounter the following error: `Error: Input required and not supplied: token`, please follow step two to ensure that the `Token` has been created or whether the `Token` has expired!

1. Click on the :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

    * [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Setting
        * Developer settings
        * Personal access tokens - `Tokens (classic)`
        * Generate new token
        * Choose token **lifespan** - it is recommended to use **unlimited**
        * Choose scopes: `repo` and `workflow`
        * **Keep** your secret token (do not lose it, you will need to paste it later)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Create a new **`repository secret`**
        * In your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the label with `token` and name it (eg: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Create an example of your action in the directory `.github/workflows/your_action.yml`. You can directly copy the following:

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

    There are three parameters in `.yml` that need special attention:

    * `token`: The token created in the repos based on step 2.
    * `g4f_provider`: The provider of gpt, for more information, please refer to the [link](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)
    * `langs`: The language versions you want to generate, be sure to separate different languages with `,`, for example:
      * `"en"`: Translate only the English version
      * `"en,zh-TW"`: Translate English and Traditional Chinese
      * `"French,Arabic"`: Translate French and Arabic

4. Now you can update `README.md`, and it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* View the [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Use our tool to update the test document

<a href="#top">Back to top</a>