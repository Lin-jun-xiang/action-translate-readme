# action-translate-markdown

[中文版README.md](README.zh-TW.md)

* 持續集成(CI)

* **通過 Github Action 自動翻譯 README 的語言**

* 更新 `README.md` 並推送它,這將自動更新 `README.zh-TW.md`
    (更新 `README.zh-TW.md` 自動更新 `README.md`)

* 寫文檔的時間節省一半.

* `測試`: 測試.

# Features

* 未翻譯:
    * 內聯代碼 (`inline_code`)
    * 用於表情符號
    * 代碼塊
    * HTML 標籤
    * 鏈接

# How to use ?

1. 單擊 :star: 圖標將此項目添加到您的 Github 存儲庫 .
2. 從項目的 Github 倉庫下載 `translate-readme.yaml` 文件 .
3. 添加要在 `translate-readme.yaml` 中使用的分支:
    ```
    on:
        push:
            branches:
            - dev
            - test
            - main
    ```
4. 將`translate-readme.yaml`文件保存到自己的倉庫中,在目錄`.github/workflows/.` 這是存放Github Actions的地方.
5. 下載 `translation.sh`
6. 新 **Github 令牌秘密**
    * 設置
    * 開發者設置
    * 個人訪問令牌 - `Tokens(classic)`
    * 生成新令牌
    * 選擇範圍:`repo` 和 `workflow`
    * **保持**你的令牌秘密(不要丟失它)
7. 新 **存儲庫秘密**
    * 在您的存儲庫中 - `settings`
    * `Securits and variables`
    * `Actions`
    * `New repository secret`
    * 填充來自 `step6` 的標籤


# Results of Test Document

* 查看【測試文檔】(https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 測試文檔用 `action-translate-markdown` 更新 .
