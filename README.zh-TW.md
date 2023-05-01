# action-translate-markdown

* **通過 Github Action（持續集成，CI）自動翻譯 README.md 的語言**

* 更新 `README.md` 並推送它，此操作將自動更新 `README.zh-TW.md`

# How to use ?

1. 單擊“星號”圖標將此項目添加到您的 Github 存儲庫.
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
4. 將 `translate-readme.yaml` 文件保存到您自己的存儲庫中，在目錄 `.github/workflows/.` 這是 Github Actions 存儲的地方.
5. 下載`translation.sh`

---

> 方法:
>
> 1. 訪問當前電腦上vscode的所有擴展，並輸出為文本. 在終端（`powershell`）中輸入以下命令:
>`代碼--列表擴展| ForEach-Object {"code --install-extension $_"} > extensions.ps1`
>
> 2. 命令執行後會在當前目錄下得到`extensions.ps1`文件（文件名在執行命令時定義）.
>
> 3. 在新計算機上的終端（`powershell`）中輸入以下命令:
> `./extensions.ps1`
>
> 4. 下載完成
> <img src="https://user-images.githubusercontent.com/63782903/226086537-1dddd375-3206-44db-8208-17715d70c744.png" width="60%">

