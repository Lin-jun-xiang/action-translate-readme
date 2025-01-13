# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# Introduction
  
> [!NOTE]
> `v1` version translator is implemented through `Linux` third-party package; `v2` version is implemented through generative AI for translation


* We all know writing README documents is time-consuming, but now there's a solution to save you half the time. That's our `action-translate-readme`

* Translate different language versions of README through **generative AI**

* Automatically **commit and push** the translated files through **GitHub Actions (CI/CD)**

* For example: **Write** or **Modify** the English version of the README, automatically generate Traditional Chinese, Simplified Chinese, French... and other versions of the README


# How to use ?

> [!IMPORTANT]
> Since the result of the generative AI model's translation may have issues occasionally, it's recommended to perform operations on a branch and finally merge back to the main branch.

> [!WARNING]
> If you encounter this error: `Error: Input required and not supplied: token`, please ensure that `Token` is established as per step two below, or check if the `Token` has expired!

1. Click the :star: icon to add this item to your GitHub repository.

2. Set up your `GitHub Token` (**mandatory**):

    1. [Create a new **`GitHub Secret Token`**](https://github.com/settings/tokens/new)
        * Settings
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * Choose token's **lifetime** - it's recommended to use **permanently**
        * Scope selection: `repo` and `workflow`
        * **Keep** your secret token (don’t lose it, you’ll need to paste it later)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    2. Add the GitHub Token to **`repository secret`**
        * In your repository - `settings`
        * `Securities and variables`
        * `Actions`
        * `New repository secret`
        * Fill in the label and name it with `token` (e.g., `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

3. Choose GPT translation model (**optional**)
   
   * `g4f`: **Default** is to use **free** `g4f` for OpenAI calls to complete translation tasks.
   * `zhipuai`: If you need **free and stable translation**, you can register an account on the [Zhipuai AI Platform](https://open.bigmodel.cn/dev/howuse/introduction) and [apply for an API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys), which is a completely free GPT model without requiring a credit card.
     * To use this option, please follow the method of adding GitHub Token in **step 2-2**, and add **API KEY of Zhipuai AI to GitHub Repos' Secrets**.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai`: **Guarantee high quality and stable quality**, if you have an OPENAI API KEY, `gpt-4o` will be used as the translation model.
     * To use this option, please follow the method of adding GitHub Token in **step 2-2**, and add **API KEY of OpenAI to GitHub Repos' Secrets**.

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. Create your action example in `.github/workflows/your_action.yml`. You can directly copy the following:

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

    Pay attention to several parameters in the `.yml`:

    * `token`: GitHub Token for authorizing the operation (added as per step two).
    * `zhipuai`: Zhipuai API, added as per step three (optional)
    * `openai`: OpenAI API, added as per step three (optional)
    * `langs`: Specify the languages to be translated, be sure to separate different languages with `,` such as:
      * `"en"`: Translate English version only
      * `"en,zh-TW"`: Translate English, Traditional Chinese
      * `"French,Arabic"`: Translate French, Arabic

    > PS: If neither `zhipuai` nor `openai` is added to GitHub Secrets, `g4f` will be used for translation.

5. Now you can update `README.md`, and it will automatically generate a translated version!

---

# Demo

![](./img/auto-translation.gif)

---

<a href="#top">Back to top</a>