# action-translate-readme

[英文版](README.md) | [中文版README.md](README.zh-TW.md)

# What's changed for action-translate-readme?

隨著 ChatGPT 的橫空出世，作者想到本專案的翻譯任務可以交給 GPT 實現，透過開源專案 [`gpt4free`](https://github.com/xtekky/gpt4free)，我們得以實現免費的 GPT API，希望可以提升本專案的翻譯能力!

* 版本一的翻譯方式: 透過 Linux 第三方套件實現的 (`translation.sh`)
  * 翻譯效果: 差，與 google 翻譯效果差不多
  * 翻譯速度: 慢
  * 穩定性: 高，可以確保每次都能正確翻譯

* 版本二的翻譯方式: 透過 GPT 進行翻譯任務 (`translation.py`)
  * 翻譯效果: 好
  * 翻譯速度: 時快時慢
  * 穩定性: 低
  
   由於  `gpt4free` 是透過逆向工程來實現免費調用 api，因此調用過程可能會碰到異常問題。作者在調用 api 函式時添加上 `retry` 技術 (發生異常，會重新執行) 來避免翻譯失敗，相對地，翻譯速度就會隨著 retry 次數增加。

> 請**注意**，在 `gpt4free` 中有[不同的 Provider](https://github.com/xtekky/gpt4free#models)，這些 Provider 就是提供調用 api 的來源，如果無法正常使用本專案自動翻譯工具，通常問題來自於當前使用的 Provider 已經 **Inactive**。
>
> 因此在各位的 `translate-readme.yml` 檔案中，可以自行設定該[參數](.github\workflows\translate-readme.yml) (預設為`g4f.Provider.DeepAi`)。
>
> 此外，由於是**生成式AI**的技術，並不能確保每次翻譯正確，如果翻譯效果不好，可以多重複幾次。

# Introduction

* 我們都知道寫文檔很費時間,但是現在有一個解決方案可以讓你節省一半的時間. 這就是我們的`action-translate-readme`

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
