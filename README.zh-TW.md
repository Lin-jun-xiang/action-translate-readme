# action-translate-readme

[英文版](README.md) | [中文版README.md](README.zh-TW.md)



# Introduction

* 我們都知道寫README文檔很費時間,但是現在有一個解決方案可以讓你節省一半的時間. 這就是我們的`action-translate-readme`

* 通過 `gpt3.5` 翻譯不同語言版本的 README

* 透過 **Github Actions(CI/CD) 自動提交(commit、push)** 翻譯後的檔案

* 例如: **撰寫**或**修改**英文版README，自動生成繁體中文、簡體中文、法文...等版本 README

備註: v1版本的翻譯器是透過 `Linux` 第三方套件實現；v2版本是透過 [`g4f`](https://github.com/xtekky/gpt4free) 免費調用 openai api 實現翻譯


# How to use ?

1. 單擊 :star: 圖標將此項目添加到您的 Github 存儲庫 .

2. 設置你的 `Github Token`:

    * [創建一個新的 **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * 設置
        * 開發者設置
        * 個人訪問令牌 - `Tokens(classic)`
        * 生成新令牌
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

4. 創建你想要的 **README** 語言:`README.md`, `READM.zh-TW.md`, ...

5. 在目錄 `.github/workflows/your_action.yml`. 中創建您的操作示例:

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
    ```

6. 現在你可以更新 `README.md`,它會自動生成一個翻譯版本！

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* 查看[測試文檔](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 使用我們的工具更新測試文檔

<a href="#top">Back to top</a>
