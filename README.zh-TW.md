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
> `v1`版本的翻譯器是透過 `Linux` 第三方套件實現；`v2`版本是透過生成式AI實現翻譯


* 我們都知道寫README文檔很費時間,但是現在有一個解決方案可以讓你節省一半的時間. 這就是我們的`action-translate-readme`

* 通過 **生成式AI** 翻譯不同語言版本的 README

* 透過 **Github Actions(CI/CD) 自動提交(commit、push)** 翻譯後的檔案

* 例如: **撰寫**或**修改**英文版README，自動生成繁體中文、簡體中文、法文...等版本 README


# How to use ?

> [!IMPORTANT]
> 由於生成式 AI 模型每次翻譯結果都有機率出現問題，建議使用分支測試，並多嘗試幾次。

> [!WARNING]
> 如果你遇到如下錯誤: `Error: Input required and not supplied: token`，請根據下方步驟二確定已建立 `Token`，或者 `Token` 是否已經過期!

1. 單擊 :star: 圖標將此項目添加到您的 Github 存儲庫 .

2. 設置你的 `Github Token`:

    * [創建一個新的 **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * 設置
        * 開發者設置
        * 個人訪問令牌 - `Tokens(classic)`
        * 生成新令牌
        * 選擇令牌**生命週期** - 建議直接使用**無限期**
        * 選擇範圍:`repo` 和 `workflow`
        * **保留**你的secret token(不要丟了,以後需要貼上)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * 創建一個新的 **`repository secret`**
        * 在您的存儲庫中 - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * 按`token`填寫標籤並命名(eg: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. GPT 模型選擇
   
   * `g4f`: **預設**使用 `g4f` 來進行 OpenAI 調用，並完成翻譯任務。
   * `zhipuai`: 如果需要穩定翻譯，你可以在[智譜AI平台](https://open.bigmodel.cn/dev/howuse/introduction)註冊帳號，並[申請 API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys)，這是一個完全免費、無須信用卡的 GPT 模型方案
     * 如果要使用該方案，請仿照步驟2申請 Github Token 的方式，將智譜AI的 API KEY 添加至 Repo 中作為環境變數。

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

4. 在目錄 `.github/workflows/your_action.yml`. 中創建您的操作示例，你可以直接複製以下:

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

    在`.yml`中有三個參數要特別注意:

    * `token`: 根據步驟2，在repos中建立的token
    * `zhipuai`: gpt 的提供者，若有提供則使用智譜AI平台的模型，反之預設使用 `g4f`，需要在 repos 中建立
    * `langs`: 想要產生的語言版本，務必用`,`分隔不同語言，例如:
      * `"en"`: 僅翻譯英文版
      * `"en,zh-TW"`: 翻譯英文、繁體中文
      * `"French,Arabic"`: 翻譯法文、阿拉伯文

5. 現在你可以更新 `README.md`,它會自動生成一個翻譯版本！

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* 查看[測試文檔](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 使用我們的工具更新測試文檔

<a href="#top">Back to top</a>
