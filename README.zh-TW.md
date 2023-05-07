# action-translate-markdown

[中文版README.md](README.zh-TW.md)

# Introduction

* 我們都知道，寫文檔需要花費大量時間和精力，但現在有一個解決方案可以讓你節省一半的時間。這就是我們的 `action-translate-markdown`

* 通過這個工具，你可以自動翻譯 `README.md` 文件，而且不僅僅是翻譯，它還能夠識別出**內聯代碼、表情符號、代碼塊、HTML標籤和鏈接**等各種元素

* 它運作的原理是通過 `Github Actions` 實現自動化，你只需要推送更新後的 README 文件，就可以自動更新翻譯後的 README(zh or en) 文件

* 持續集成（CI）

* **通過 Github Action 自動翻譯 README 的語言**

* 更新 `README.md` 並推送它，此操作將自動更新 `README.zh-TW.md`
    （更新 `README.zh-TW.md` 自動更新 `README.md`）

* 節省一半寫文檔的時間.

# Features

* 未翻譯:
    * 內聯代碼 (`inline_code`)
    * 表情符號的
    * 代碼塊
    * HTML 標籤
    * 鏈接

# How to use ?

1. 單擊 :star: 圖標將此項目添加到您的 Github 存儲庫.
2. 從該項目的 Github 存儲庫下載 `translate-readme.yaml` 文件.
3. 添加要在 `translate-readme.yaml` 中使用的分支:
    ```
    on:
        push:
            branches:
            - dev
            - test
            - main
    ```
4. 將`translate-readme.yaml` 文件保存到自己的倉庫中，在目錄`.github/workflows/.` 這是Github Actions 存放的地方.
5. 下載 `translation.sh`
6. 新 **Github 代幣秘密**
    * 設置
    * 開發者設置
    * 個人訪問令牌 - `Tokens(classic)`
    * 生成新令牌
    * 選擇範圍:`repo` 和 `workflow`
    * **保持**你的令牌秘密（不要丟失）
7. 新 **存儲庫秘密**
    * 在您的存儲庫中 - `settings`
    * `Securits and variables`
    * `Actions`
    * `New repository secret`
    * 填寫來自 `step6` 的標記


# Results of Test Document

* 查看[測試文檔](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 測試文檔使用`action-translate-markdown`更新.
