# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁体中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# Introduction
 
> [!NOTE]
> `v1`版本的翻译器是通过 `Linux` 第三方套件实现；`v2`版本是通过生成式AI实现翻译


* 我们都知道写README文档很费时间,但是现在有一个解决方案可以让你节省一半的时间. 这就是我们的`action-translate-readme`

* 通过 **生成式AI** 翻译不同语言版本的 README

* 通过 **Github Actions(CI/CD) 自动提交(commit、push)** 翻译后的文件

* 例如: **撰写**或**修改**英文版README，自动生成繁体中文、简体中文、法文...等版本 README


# How to use ?

> [!IMPORTANT]
> 由于生成式 AI 模型每次翻译结果都有几率出现问题，建议使用分支执行，最后 Merge 回主支。

> [!WARNING]
> 如果你遇到如下错误: `Error: Input required and not supplied: token`，请根据下方步骤二确定已建立 `Token`，或者 `Token` 是否已经过期!

1. 单击 :star: 图标将此项目添加到您的 Github 存储库 .

2. 设置你的 `Github Token` (**必须**):

    1. [创建一个新的 **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * 设置
        * 开发者设置
        * 个人访问令牌 - `Tokens(classic)`
        * 生成新令牌
        * 选择令牌**生命周期** - 建议直接使用**无限期**
        * 选择范围:`repo` 和 `workflow`
        * **保留**你的secret token(不要丢了,以后需要贴上)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    2. 将 Github Token 添加至 **`repository secret`**
        * 在您的存储库中 - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * 按`token`填写标签并命名(eg: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. GPT 翻译模型选择 (**可选的**)
   
   * `g4f`: **默认**使用**免费** `g4f` 来进行 OpenAI 调用，并完成翻译任务。
   * `zhipuai`: 如果需要**免费且稳定翻译**，你可以在[Zhipuai AI平台](https://open.bigmodel.cn/dev/howuse/introduction)注册账号，并[申请 API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys)，这是一个完全免费、无须信用卡的 GPT 模型方案。
     * 如果要使用该方案，请仿照**步骤2-2**添加 Github Token 的方式，将 **Zhipuai AI的 API KEY 添加至 GitHub Repos 的 Secrets 中**。

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai`: **保证高质量且稳定的品质**，如果您有 OPENAI API KEY，则会使用 `gpt-4o` 作为模型翻译。
     * 如果要使用该方案，请仿照**步骤2-2**添加 Github Token 的方式，将 **OpenAI 的 API KEY 添加至 GitHub Repos 的 Secrets 中**。

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. 在目录 `.github/workflows/your_action.yml`. 中创建您的操作示例，你可以直接复制以下:

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

    在`.yml`中有几个参数要特别注意:

    * `token`: 用于授权操作的 GitHub Token (根据步骤二添加)。
    * `zhipuai`: Zhipuai API，根据步骤三添加 (可选)
    * `openai`: OpenAI API，根据步骤三添加 (可选)
    * `langs`: 指定要翻译的语言，务必用`,`分隔不同语言，例如:
      * `"en"`: 仅翻译英文版
      * `"en,zh-TW"`: 翻译英文、繁体中文
      * `"French,Arabic"`: 翻译法文、阿拉伯文

    > PS: `zhipuai`, `openai` 如果都未添加至 GitHub Secrets 中，则会使用 `g4f` 进行翻译。

5. 现在你可以更新 `README.md`,它会自动生成一个翻译版本！

---

# Demo

![](./img/auto-translation.gif)

---

<a href="#top">Back to top</a>