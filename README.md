# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [Traditional Chinese README.md](README.zh-TW.md)
* [Simplified Chinese](README.zh-CN.md)
* [French](README.French.md)
* [Arabic](README.Arabic.md)


# Introduction
 
> [!NOTE]
> The `v1` version of the translator is implemented through `Linux` third-party packages; the `v2` version is implemented through generative AI for translation.


* We all know that writing README documents is time-consuming, but now there is a solution that can save you half the time. This is our `action-translate-readme`

* Translate different language versions of README through **generative AI**

* Automatically submit (commit, push) translated files through **Github Actions (CI/CD)**

* For example: **write** or **modify** the English version README, automatically generate Traditional Chinese, Simplified Chinese, French, etc. versions of README


# How to use ?

> [!IMPORTANT]
> Since generative AI models may have issues with translation results each time, it is recommended to use branch testing and try several times.

> [!WARNING]
> If you encounter the following error: `Error: Input required and not supplied: token`, please follow step 2 below to ensure that a `Token` has been created, or check if the `Token` has expired!

1. Click the :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

    * [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Setup
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * Select token **lifecycle** - recommended to use **unlimited** directly
        * Select scope: `repo` and `workflow`
        * **Keep** your secret token (do not lose it, you will need to paste it later)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Create a new **`repository secret`**
        * In your repository - `settings`
        * `Securities and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the label with `token` and name it (e.g., `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. GPT Model Selection
   
   * `g4f`: **Default** uses `g4f` for OpenAI calls and completes translation tasks.
   * `zhipuai`: If you need stable translation, you can register an account on the [Zhipu AI Platform](https://open.bigmodel.cn/dev/howuse/introduction) and [apply for an API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys). This is a completely free, no-credit-card-required GPT model solution
     * If you want to use this solution, please follow the steps in step 2 to apply for a Github Token and add the Zhipu AI API KEY to the Repo as an environment variable.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

4. Create your action example in the directory `.github/workflows/your_action.yml`. You can directly copy the following:

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
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Based on step3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
    ```

    Pay special attention to three parameters in the `.yml`:

    * `token`: Based on step 2, the token established in repos
    * `zhipuai`: The provider of GPT, if provided, use the Zhipu AI platform model, otherwise default to `g4f`, needs to be established in repos
    * `langs`: The language versions you want to generate, make sure to separate different languages with `,`, for example:
      * `"en"`: Translate only the English version
      * `"en,zh-TW"`: Translate English and Traditional Chinese
      * `"French,Arabic"`: Translate French and Arabic

5. Now you can update `README.md`, it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* View [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Use our tool to update the test document

<a href="#top">Back to top</a>