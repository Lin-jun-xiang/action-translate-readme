# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# Introduction
 
**GitHub Action to translate Readme to any language**

這是一個GitHub Action，可以自動將您repo中的readme翻譯成指定的語言。

> [!NOTE]
> `v1` 版本的翻譯器是透過 `Linux` 第三方套件實現；`v2` 版本則是透過生成式AI進行翻譯


* 我們都知道撰寫README文件非常耗時，但現在有一個解決方案可以為您節省一半的時間。那就是我們的 `action-translate-readme`

* 透過**生成式AI**翻譯不同語言版本的README

* 透過**GitHub Actions (CI/CD)**自動**提交並推送**翻譯後的文件

* 例如：**撰寫**或**修改**英文版本的README，自動生成繁體中文、簡體中文、法文...等其他版本的README


# How to use ?

> [!IMPORTANT]
> 由於生成式AI模型的翻譯結果偶爾可能存在問題，建議在分支上進行操作，最後再合併回主分支。

> [!WARNING]
> 如果您遇到這個錯誤：`Error: Input required and not supplied: token`，請確保按照下方第二步建立`Token`，或檢查`Token`是否過期！

1. 點擊 :star: 圖標將此項目添加到您的GitHub repository。

2. 設置您的`GitHub Token`（**必填**）：

    1. [創建新的**`GitHub Secret Token`**](https://github.com/settings/tokens/new)
        * Settings
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * 選擇token的**有效期** - 建議使用**永久**
        * 權限選擇：`repo` 和 `workflow`
        * **保存**您的密钥token（不要丟失，稍後需要粘貼）
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    2. 將GitHub Token添加到**`repository secret`**
        * 在您的repository中 - `settings`
        * `Securities and variables`
        * `Actions`
        * `New repository secret`
        * 填寫標籤並命名為`token`（例如，`Action_Bot`）

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

3. 選擇GPT翻譯模型（**可選**）
   
   * `g4f`：**默認**使用**免費**的`g4f`進行OpenAI調用以完成翻譯任務。
   * `zhipuai`：如果您需要**免費且穩定的翻譯**，可以註冊[智谱AI平台](https://open.bigmodel.cn/dev/howuse/introduction)並[申請API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys)，這是一個完全免費的GPT模型，不需要信用卡。
     * 使用此選項，請按照**步驟2-2**中添加GitHub Token的方法，將**智谱AI的API KEY添加到GitHub Repos' Secrets**。

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai`：**保證高質量且穩定的品質**，如果您有OPENAI API KEY，將使用`gpt-4o`作為翻譯模型。
     * 使用此選項，請按照**步驟2-2**中添加GitHub Token的方法，將**OpenAI的API KEY添加到GitHub Repos' Secrets**。

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. 在`.github/workflows/your_action.yml`中創建您的action示例。您可以直接複製以下內容：

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
                    langs: "en,zh-TW,zh-CN,French,Arabic" # 您可以定義任何語言
    ```

    注意`.yml`中的幾個參數：

    * `token`：用於授權操作的GitHub Token（按照第二步添加）。
    * `zhipuai`：智谱API，按照第三步添加（可選）
    * `openai`：OpenAI API，按照第三步添加（可選）
    * `langs`：指定要翻譯的語言，不同語言之間用`,`分隔，例如：
      * `"en"`：僅翻譯英文版本
      * `"en,zh-TW"`：翻譯英文、繁體中文
      * `"French,Arabic"`：翻譯法文、阿拉伯文

    > PS：如果GitHub Secrets中未添加`zhipuai`或`openai`，則將使用`g4f`進行翻譯。

5. 現在您可以更新`README.md`，它將自動生成翻譯版本！

---

# Demo

![](./img/auto-translation.gif)

# Results of Test Document

* 查看[測試文件](https://github.com/Lin-jun-xiang/ChatGPT-line-bot)，該文件使用了我們的工具來更新文件。

<a href="#top">Back to top</a>