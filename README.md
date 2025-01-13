# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [Traditional Chinese README.md](README.zh-TW.md)
* [Simplified Chinese](README.zh-CN.md)
* [French](README.French.md)

# Introduction
 
> [!NOTE]
> The `v1` version of the translator is implemented through `Linux` third-party packages; the `v2` version is implemented through generative AI for translation.


* We all know that writing README documents is time-consuming, but now there is a solution that can save you half the time. This is our `action-translate-readme`

* Translate different language versions of README through **generative AI**

* Automatically submit (commit, push) the translated files through **Github Actions (CI/CD)**

* For example: **Writing** or **modifying** the English version README, automatically generate Traditional Chinese, Simplified Chinese, French, etc. versions of README


# How to use ?

> [!IMPORTANT]
> Since generative AI models may have issues with translation results each time, it is recommended to execute using branches and finally merge back to the main branch.

> [!WARNING]
> If you encounter the following error: `Error: Input required and not supplied: token`, please follow the steps below to ensure that a `Token` has been created, or check if the `Token` has expired!

1. Click the :star: icon to add this project to your Github repository.

2. Set up your `Github Token` (**required**):

    1. [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Settings
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * Select token **lifecycle** - recommended to use **unlimited**
        * Select scope: `repo` and `workflow`
        * **Keep** your secret token (do not lose it, you will need to paste it later)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    2. Add Github Token to **`repository secret`**
        * In your repository - `settings`
        * `Securities and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the label with `token` and name it (e.g., `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. GPT Translation Model Selection (**optional**)
   
   * `g4f`: **Default** uses **free** `g4f` for OpenAI calls and completes translation tasks.
   * `zhipuai`: If you need **free and stable translation**, you can register an account on the [Zhipuai AI platform](https://open.bigmodel.cn/dev/howuse/introduction) and [apply for an API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys). This is a completely free, no credit card required GPT model solution.
     * To use this solution, please follow the method in **step 2-2** to add the Github Token, and add the **Zhipuai AI API KEY to the GitHub Repos Secrets**.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai`: **Guaranteed high quality and stable quality**, if you have an OPENAI API KEY, `gpt-4o` will be used as the translation model.
     * To use this solution, please follow the method in **step 2-2** to add the Github Token, and add the **OpenAI API KEY to the GitHub Repos Secrets**.

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. Create your action example in the directory `.github/workflows/your_action.yml`. You can directly copy the following:

    ```yaml
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
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Optional: Based on step3
                    openai: ${{ secrets.openai_api_key }}  # Optional: Based on step3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
    ```

    There are a few parameters in the `.yml` to pay special attention to:

    * `token`: GitHub Token used for authorization (added according to step 2).
    * `zhipuai`: Zhipuai API, added according to step 3 (optional)
    * `openai`: OpenAI API, added according to step 3 (optional)
    * `langs`: Specify the languages to translate, make sure to separate different languages with `,`, for example:
      * `"en"`: Translate only the English version
      * `"en,zh-TW"`: Translate English and Traditional Chinese
      * `"French,Arabic"`: Translate French and Arabic

    > PS: If neither `zhipuai` nor `openai` is added to GitHub Secrets, `g4f` will be used for translation.

5. Now you can update `README.md`, it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

<a href="#top">Back to top</a>