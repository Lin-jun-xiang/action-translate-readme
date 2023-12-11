```markdown
# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# 介绍

> [!NOTE]
> 翻译器的 `v1` 版本是通过 `Linux` 第三方包实现的；`v2` 版本是通过 [`g4f`](https://github.com/xtekky/gpt4free) 免费调用 openai api 实现翻译


* 我们都知道写 README 文档很费时间，但是现在有一个解决方案可以让你节省一半的时间。这就是我们的 `action-translate-readme`。

* 通过 `gpt3.5` 翻译不同语言版本的 README。

* 通过 **Github Actions(CI/CD) 自动提交(commit、push)** 翻译后的文件。

* 例如：**撰写**或**修改**英文版 README，自动生成繁体中文、简体中文、法文等版本 README。


# 如何使用？

> [!IMPORTANT]
> 由于 `gpt3.5` 属于生成式 AI 模型，因此每次翻译结果都有机率出现问题，建议使用分支测试，并多尝试几次。

> [!WARNING]
> 如果你遇到如下错误：`Error: Input required and not supplied: token`，请根据步骤二确定已建立 `Token`，或者 `Token` 是否已经过期！

1. 点击 :star: 图标将此项目添加到您的 Github 存储库。

2. 设置你的 `Github Token`：

    * [创建一个新的 **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * 设置
        * 开发者设置
        * 个人访问令牌 - `Tokens(classic)`
        * 生成新令牌
        * 选择令牌**生命周期** - 建议直接使用**无限期**
        * 选择范围：`repo` 和 `workflow`
        * **保留**你的 secret token（不要丢了，以后需要贴上）

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    * 创建一个新的 **`repository secret`**
        * 在您的存储库中 - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * 按`token`填写标签并命名（例如：`Action_Bot`）

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

3. 在目录 `.github/workflows/your_action.yml` 中创建您的操作示例，你可以直接复制以下：

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
                    g4f_provider: g4f.Provider.DeepAi # You can change this provider
                    langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
                  # openai_api_key: ${{ secrets.OPENAI_API_KEY }} # If you pass the openai api key, it'll use openai gpt instead of gpt4free
    ```

> [!NOTE]
> 在`.yml`中有几个参数要特别注意：
> * `token` **(必须)**：根据步骤2，在 repos 中建立的 token
> * `g4f_provider` **(可选)**：gpt 的提供者，更多请参考[链接](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)
> * `langs` **(必须)**：想要生成的语言版本，务必用`,`分隔不同语言，例如：
>   * `"en"`: 仅翻译英文版
>   * `"en,zh-TW"`: 翻译英文、繁体中文
>   * `"French,Arabic"`: 翻译法文、阿拉伯文
> * `openai_api_key` **(可选)**：如果你想使用 openai api 的 gpt，您可以依照步骤2建立token一样，建立一个 openai api key，**切记不要直接把 key 放在 yml 文件中，造成数据外泄！**

4. 现在你可以更新 `README.md`，它会自动生成一个翻译版本！

---

# 演示

![](./img/auto-translation.gif)

---

# 测试文档结果

* 查看[测试文档](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 使用我们的工具更新测试文档

<a href="#top">Back to top</a>
```