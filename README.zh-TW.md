# action-translate-markdown

[中文版README.md](README.zh-TW.md)

* 持續集成（CI）

* **通過 Github Action 自動翻譯 README.md 的語言**

* 更新 `README.md` 並推送它，此操作將自動更新 `README.zh-TW.md`

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
2. 從這個項目的 Github 存儲庫下載 `translate-readme.yaml` 文件.
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
6. 新 **Github 代幣**
    * 設置
    * 開發者設置
    * 個人訪問令牌 - 令牌（經典）
    * 生成新令牌
    * 選擇範圍:`repo` 和 `workflow`
    * **保持**你的令牌秘密（不要丟失）
7. 新 **存儲庫秘密**
    * 在您的存儲庫中 - 設置
    * 證券和變量
    * 操作
    * 新存儲庫機密
    * 填寫來自 `step6` 的標記


# Results of Test Document

* 查看[測試文檔](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* 測試文檔使用`action-translate-markdown`更新.

