# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# 簡介
  
> [!NOTE]
> `v1` 版本的翻譯器是透過 `Linux` 第三方套件實現；`v2` 版本則是透過生成式 AI 進行翻譯


* 我們都知道撰寫 README 文件非常耗時，但現在有一個解決方案可以為你節省一半的時間。那就是我們的 `action-translate-readme`

* 透過 **生成式 AI** 翻譯不同語言版本的 README

* 透過 **GitHub Actions (CI/CD)** 自動 **提交並推送** 翻譯後的文件

* 例如：**撰寫** 或 **修改** README 的英文版本，自動生成繁體中文、簡體中文、法文...等版本的 README


# 如何使用？

> [!IMPORTANT]
> 由於生成式 AI 模型的翻譯結果偶爾可能存在問題，建議在分支上進行操作，最後再合併回主分支。

> [!WARNING]
> 如果你遇到這個錯誤：`Error: Input required and not supplied: token`，請確保按照下方第二步建立 `Token`，或檢查 `Token` 是否過期！

1. 點擊 :star: 圖標將此項目添加到你的 GitHub 儲存庫。

2. 設置你的 `GitHub Token` (**必填**)：

    1. [創建新的 **`GitHub Secret Token`**](https://github.com/settings/tokens/new)
        * 設定
        * 開發者設定
        * 個人訪問令牌 - `Tokens(classic)`
        * 生成新令牌
        * 選擇令牌的 **有效期** - 建議使用 **永久**
        * 范圍選擇：`repo` 和 `workflow`
        * **保存** 你的私密令牌（不要丟失，你稍後需要粘貼它）
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    2. 將 GitHub Token 添加到 **`repository secret`**
        * 在你的儲存庫 - `settings`
        * `安全和變量`
        * `Actions`
        * `New repository secret`
        * 填寫標籤並命名為 `token`（例如，`Action_Bot`）

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

3. 選擇 GPT 翻譯模型 (**可選**)
   
   * `g4f`：**默認** 使用 **免費** 的 `g4f` 進行 OpenAI 調用以完成翻譯任務。
   * `zhipuai`：如果你需要 **免費且穩定的翻譯**，你可以在 [Zhipuai AI 平台](https://open.bigmodel.cn/dev/howuse/introduction) 註冊帳戶並 [申請 API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys)，這是一個完全免費的 GPT 模型，不需要信用卡。
     * 要使用此選項，請按照 **步驟 2-2** 中添加 GitHub Token 的方法，並將 **Zhipuai AI 的 API KEY 添加到 GitHub Repos' Secrets**。

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai`：**保證高質量且穩定的品質**，如果你有 OPENAI API KEY，將使用 `gpt-4o` 作為翻譯模型。
     * 要使用此選項，請按照 **步驟 2-2** 中添加 GitHub Token 的方法，並將 **OpenAI 的 API KEY 添加到 GitHub Repos' Secrets**。

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. 在 `.github/workflows/your_action.yml` 中創建你的動作示例。你可以直接複製以下內容：

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
                  uses: Lin-jun-xiang/action-translate-readme@v2 # 根據標籤
                  with:
                    token: ${{ secrets.Action_Bot }} # 根據步驟2的名稱
                    zhipuai: ${{ secrets.zhipuai_api_key }} # 可選：根據步驟3
                    openai: ${{ secrets.openai_api_key }}  # 可選：根據步驟3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # 你可以定義任何語言
    ```

    注意 `.yml` 中的幾個參數：

    * `token`：用於授權操作的 GitHub Token（按照第二步添加）。
    * `zhipuai`：Zhipuai API，按照第三步添加（可選）
    * `openai`：OpenAI API，按照第三步添加（可選）
    * `langs`：指定要翻譯的語言，務必用 `,` 分隔不同的語言，例如：
      * `"en"`：僅翻譯英文版本
      * `"en,zh-TW"`：翻譯英文、繁體中文
      * `"French,Arabic"`：翻譯法文、阿拉伯文

    > PS：如果 GitHub Secrets 中未添加 `zhipuai` 或 `openai`，則將使用 `g4f` 進行翻譯。

5. 現在你可以更新 `README.md`，它將自動生成翻譯版本！

---

# Demo

![](./img/auto-translation.gif)

# 測試文件結果

* 查看 [測試文件](https://github.com/Lin-jun-xiang/ChatGPT-line-bot)，該文件使用了我們的工具來更新文件。

<a href="#top">Back to top</a>