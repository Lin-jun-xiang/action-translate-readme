# action-translate-readme

[中文版README.md](README.zh-TW.md)

# Introduction

* 我們都知道寫文檔費時費力,但是現在有一個解決方案可以讓你節省一半的時間. 這就是我們的`action-translate-readme`

* 有了這個工具,你可以自動翻譯`README.md`文件,不僅可以翻譯,還可以翻譯**內聯代碼、表情、代碼塊、HTML標籤和鏈接等各種元素**

* 其運行原理是通過`Github Actions`實現自動化,只需要推送更新的README文件,翻譯後的README(zh或en)文件即可自動更新

* 持續集成(CI)

* **通過 Github Action 自動翻譯 README 的語言**

* 更新`README.md`並推送,這個動作會自動更新`README.zh-TW.md`
    (更新 `README.zh-TW.md` 自動更新 `README.md`)

* 寫文檔的時間節省一半.

# Features

* 未翻譯:
    * 內聯代碼 (`inline_code`)
    * 用於表情符號
    * 代碼塊
    * HTML 標籤
    * 鏈接

# How to use ?

1. 單擊 :star: 圖標將此項目添加到您的 Github 存儲庫 .

2. 設置 `your Github Token`:

    * 新建一個 **`Github Token Secret`**
        * 設置
        * 開發者設置
        * 個人訪問令牌 - `Tokens(classic)`
        * 生成新令牌
        * 選擇範圍:`repo` 和 `workflow`
        * **保持**你的令牌秘密(不要丟失它)

    * 新建一個 **`repository secret`**
        * 在您的存儲庫中 - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * 按 `token` 填寫標籤並命名(例如:`Action_Bot`)

2. 創建 **README** 你想要的語言: `README.md`, `READM.zh-TW.md`, ...

4. 在目錄 `.github/workflows/your_action.yml`. 中創建您的操作示例:

    ```
    // .github/workflows/translate.yml
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
                  uses: Lin-jun-xiang/action-translate-readme@v1 // Based on the tag
                  with:
                    token: ${{ secrets.Action_Bot }} // Based on step2 name
    ```

---

# Results of Test Document

* 查看【測試文檔】(https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 測試文檔用 `action-translate-readme` 更新了 .
