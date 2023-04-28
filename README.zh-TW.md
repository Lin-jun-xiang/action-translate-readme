

# vscode-extensions [最佳]

<div>
    <img src="https://readme-typing-svg.demolab.com/?pause=1&size=50&color=f75c7e&center=True&width=1200&height=120&vCenter=True&lines=Click+the+⭐+Star+please.;Any+questions+ can+be+asked+in+Issue." />
</div>

[中文版README.md](README_中文.md)

<details>
<summary>Vscode Common Commands</summary>

* sss test1234

* 使用 the vscode command palette can improve development speed。

* 打開 命令 調色板： `ctrl+shift+p`

* Common 命令：
   __* `文件： 打開 文件夾`： 打開 a 文件夾 作為 a 工作區。
   __* `首選項： 顏色 主題`： 選擇 a 顏色 主題 為 編輯器。
   __* `首選項： 文件 圖標 主題`： 選擇  圖標 主題 為  文件。
   __* `開發人員： Reload Window`： Reload the VSCode window。

</details>

---

* Record and share vscode extensions, including those that enhance development efficiency, must-haves, theme beautification, etc.
* This project will provide detailed usage instructions for each extension, with the hope of helping coders all over the world to code happily together :太陽鏡：
* This project provides a ["**extensions sharing area**"](./share/README.md), where anyone can submit interesting extensions。

* Outline of extensions：
   __- [快速 下載 多個 擴展 （首先閱讀 這個 ）]（#starquickly-download-multiple-extensions-please-read-this-first）
    - [透明 編輯器](#snowflaketransparent-editor)
    - [主題](#purple_hearttheme)
    - [Editor and environment beautification](#yellow_heart-beautifying-editor-and-editing-environment)
    - [必備 和 高度 推薦]（#green_heart-must-have-highly-recommended）
    - [Big data and AI engineer - Jupyter(Python)](#star2big-data-ai-engineer---jupyter-python)
    - [Git and Markdown 助手](#wavegitmarkdown-support)
    - [遠程 WSL & 開發容器](#computer-remote-wsl--dev-container)
    - [修復器](#wrenchfixer-fix-vscode-corrupt)
    - [通過 社區共享 和 貢獻 ](./share/README.md)
---

## :star:Quickly download multiple extensions （請 閱讀 this first）
稍後， 我們 將 引入 a lot of vscode 擴展。 這裡 是 一個 技巧 可以 快速 下載 許多 擴展 而無需   查找 它們 一個 一個。

如果 你 想要 轉移 擴展 從 一台 舊 計算機 到 一台 新 一個 在 未來， 你 可以 也 使用 這個 方法 ：接吻：

* 您 可以 下載  `.ps1` 文件 附加 到 這個 項目 和 排除  擴展 您 不需要 通過 以下 步驟 三個 。
* 在  `extensions.ps1` 文件中， 每個 擴展 都 註釋了。 請 刪除 那些 你 在 執行  安裝 命令之前 不需要 。

> 方法：
> 1. 訪問 所有 the extensions__of vscode on the current computer and output them as text. Enter the following command in terminal (`powershell`):
> `code --list-extensions | ForEach-Object {"code --install-extension $_"} > extensions.ps1`
> 2. 在  命令 執行後，  `extensions.ps1` 文件 （ 文件名 是 定義 當 執行  命令） 將 在 當前 目錄中 獲得。
> 3. Enter the following command in terminal (`powershell`) on the new computer：
> `.xtensions.ps1`
> 4. 下載 已完成
> <img src="https://user-images.githubusercontent.com/63782903/226086537-1dddd375-3206-44db-8208-17715d70c744.png" width="60%">

<details>
<summary>Missing Extensions</summary>

* [`extensions-compare`](./extensions_compare/)

* Compare two `.ps` files and find the **difference** between the two extension records.

* 用法 （選擇 一個 的 以下 ）：
    * `比較.py`
         運行 the `Python` 腳本。

        ![](./img/2023-04-19-11-06-37.png)
    * `compare.sh`
        __Run `./extensions_compare/compare.sh` on `git bash, wsl, or linux`, 等。

        ![](./img/2023-04-19-11-07-16.png)
</details>

---

## :snowflake:Transparent   編輯器
透明 效果 是 太棒了。

它 可以 是 一個 工作 懶惰 工具 （代碼 同時 看 視頻~）。

你 可以 使用 你的 自己的 桌面 背景 而 編碼 和 看 **古拉**。

### GlassIt-VSC

> 用法：
`ctrl+alt+z`: 減少 飽和度 （透明）
`ctrl+alt+c`:__ 增加 __ 飽和度  （不透明）

<img src="img/2023-03-20-20-35-03.png" width="60%">

<a href="#top">Back to top</a>

---

## :purple_heart:主題

 使用  vscode  的 最大 原因 是 要 擁有 一個 `引人注目`、 `優雅`、 `舒適`、 和 `令人愉快 編輯 界面`。  鍵盤 ~：太陽鏡：

接下來， 作者 將 與 你 一個 通過 一個 分享 他 最喜歡的 主題 （ 以下 示例 是 基於 on Python， 和 可能 是 輕微的 差異  不同的 語言）

哦！ 等 一 分鐘， 這是 一個 快速 方式  切換 主題。 畢竟， 你 可能 想要 to change your theme every day~~

> Quickly switch themes
> 1. "ctrl+shift+p": 打開 the vscode command input box
> 2. “首選項： 顏色 主題”： 輸入 並 選擇 the theme you want

### 黃油主題
* As its name suggests, it is a non-eye-straining *cream yellow* theme
* 一個 非常 罕見 主題 （ 把 它 坦率地說， 不是 很多 人 使用 ）， 但是  作者 喜歡 它
* 在 情況下 you can't find this theme，<a href="https://marketplace.visualstudio.com/items?itemName=Levampire.Buttur" target="_blank">鏈接</a>

<img src="img/2023-03-17-14-36-15.png" width="60%">

### Arc Dark for Visual Studio Code
* The theme is somewhat similar to the dark theme of Visual Studio Code， but with softer overall tones that resemble the colors_of macarons。

<img src="img/2023-03-25-16-10-51.png" width="60%">

### Coder200
* This time, I have absolutely no idea just by looking at the name...
* A very rare theme, filled with *orange* color, so sexy~ :flushed:

<img src="img/2023-03-17-14-44-30.png" width="60%">

### 德古拉 官方
* 非常 眾所周知， with a vampire color of *pink* and *purple*

<img src="img/2023-03-17-14-51-36.png" width="60%">

### 激光波
* A *紫色-粉色* 主題 with a sunset feel

<img src="img/2023-03-17-20-17-56.png" width="60%">

### Moegi 主題
* A gentle and eye-friendly theme

<img src="img/2023-03-17-20-20-13.png" width="60%">

### 熊貓 主題
* A top-notch theme with *lake green* :panda_face:
* This theme is really nice！

<img src="img/2023-03-17-20-21-23.png" width="60%">

### 簡單 黑暗
* The background is very dark， and the text color is not too harsh on the eyes

<img src="img/2023-03-17-20-23-37.png" width="60%">

###__天際線
* Blue lovers must use it:blue_heart:

<img src="img/2023-03-17-20-25-15.png" width="60%">

### SynthWave '84
* A super high-tech, flashy fluorescent theme :太陽鏡:
* After selecting the theme， remember to activate the fluorescent effect （which can also be combined with other theme _colors:fu:)

> To enable fluorescent mode:
> 1. "ctrl+shift+p": 打開 the VS Code command input box
> 2. "Synthwave '84: Enable/Disable Neon Dreams": Turn on/off （see figure）
> 3. “重啟”： 重啟 VS Code

<img src="img/2023-03-17-20-28-44.png" width="60%">

<img src="img/2023-03-17-20-27-06.png" width="60%">

### Tearz
* 它  一點 相似 to the previously introduced Moegi theme
* 但是 這個 *紫色* 對 作者來說 真的 有吸引力~

<img src="img/2023-03-17-20-33-32.png" width="60%">

### doom-emacs-主題
* 簡單 風格

<image src="https://user-images.githubusercontent.com/63782903/232356902-fc57dbc3-f650-4c41-b5a6-f33497954cc7.png" width="60%" />

### Xcode 主題
* One of the classic themes, cannot be ignored

<img src="img/2023-03-17-20-35-39.png" width="60%">

### One Dark Pro
* One of the classic themes, cannot be ignored

<img src="img/2023-03-17-20-36-31.png" width="60%">

### 材質 深色
* One of the classic themes, cannot be ignored

<img src="img/2023-03-17-20-37-24.png" width="60%">

<a href="#top">Back to top</a>

---
## :yellow_heart: 美化 editor and editing environment
在 裝飾 我們的 編輯器之後， 插件 我們 將 引入 不能 只能 增加 美觀 但 也 提高 工作 效率~

### 顏色 高光
* 如果 你 是 **前端** 工程師 或 **數據 分析師** 誰 經常 需要  做 **視覺** 工作， 你 必須 下載 這個！ 
* 當 編輯時， as long as a **十六進制** color expression 出現， you can clearly see the color （no need to run the code  to see if the color looks good）。

<img src="img/2023-03-17-20-48-11.png" width="60%">

###__材料 主題 圖標
* Different file extensions have different icons
* 不 只 看起來 好 但 也 使 它 更快  找到 文件. 

<img src="img/2023-03-17-20-51-07.png" width="60%">

### vscode-圖標
* Slightly different from Material Theme Icons
* The author prefers to use this one~

<img src="img/2023-03-17-20-53-26.png" width="60%">

<a href="#top">Back to top</a>

---
## ：green_heart： 必備， 高度 推薦
 插件  將 引入 下面  真的 容易  使用！

The vast majority of them can improve development efficiency, so don't miss them:heart_eyes:

### Code Runner
* 我 相信  那些 誰 使用 VSCode 應該 不  不熟悉  這個 插件！？
* 它 允許 VSCode  執行 程序  一次 點擊。
* Supports many languages, such as C, C++, Java, JavaScript, PHP, Python, Perl...等。

<img src="img/2023-03-17-20-59-33.png" width="60%">

### 評論 分隔符
* Generates good-looking **comment styles** with shortcut keys。
* 如 所示 在 下面的 圖 中， 您 可以 看到 兩種 樣式： `Shift+Alt+x` 和 `Alt+x`。

<img src="img/2023-03-17-21-03-04.png" width="60%">

### autoDocstring - Python Docstring 生成器
*  插件 是 為 Python 開發人員引入的。
* Quickly generate comments in **Docstring** style using shortcut keys。
* Describe the purpose, parameters, return values, and other information of the function.
* 支持 different **Docstring** styles, such as google, sphinx, numpy, etc.

> 用法： 按 以下 鍵 在 地方  你 想要  生成 評論
Windows: `ctrl+shift+2`
蘋果機： `cmd+shift+2` 

<img src="img/2023-03-17-21-07-10.png" width="60%">

### Draw.io 集成
* 流程圖 繪圖 工具
* When designing a project， you can use this plugin to plan feasibility。
* Can be used as a note-taking tool。
* 支持 許多 commonly used patterns， such as the Google Cloud Platform representative function symbol （as shown in the figure）。

<img src="img/2023-03-17-21-14-00.png" width="60%">

### Path 智能感知
* Having this plugin when coding is really great :kissing_heart:
* Suitable for code farmers who often read and write files。
* When writing a path, it will automatically list the files under the path you are looking__for。

<img src="img/2023-03-17-21-17-09.png" width="60%">

<a href="#top">Back to top</a>

---

## :star2:Big data, AI engineer - Jupyter (Python)
 插件 在這裡 介紹 真的 太棒了！

 作者 知道 很多 人 誰 使用 Python  不  使用  使用 vscode， 和 有 很多 原因：
* Interactive 模式
* View variable data types and variable values （只是 like in Spyder， Pycharm）
* Execute code line by line and execute part_of the code （真的 實用， even better than Debug~:heart_eyes:)

 插件 提供 以下 功能：
* :圖釘:**Interactive mode**
* ：圖釘：**查看 variable data types and variable values** （只是 like in Spyder， Pycharm）
* :pushpin:**Execute code line by line** and **execute part_of the code** （真的 實用， even better than Debug~:heart_eyes:)

> 如果 你 能 理解 中文， 它 是 推薦 到 花費 5 分鐘 快速 學習 如何 使用 the Jupyter 插件 （查看 <a href="https://www.bilibili.com/video/BV1Bg411J78F/" target="_blank" >鏈接</a>)

> 用法：
>
> :bulb:下載 以下 插件 （有些 可能  不需要 ， 但是 我 忘了~）
>
> `Jupyter`, `Jupyter keymap`, `Jupyter slide show`, `Jupyter cell tag`, `Jupyter notebook renderes`, `vs code jupyter notebook previewer`
>
><img src="img/2023-03-17-21-50-07.png" width="40%">

> :bulb:**Execute code in interactive mode**
>
>  1.  右鍵單擊_in the _script。
> 2. Select `Run Current File in Interactive Window`
（  推薦  設置 a VS 代碼 快捷方式 鍵， 我 將 它 設置為 `F10`）。
> 3. After execution, an `Interactive` window will appear.
>
><img src="img/2023-03-17-21-54-03.png" width="40%">
><img src="img/2023-03-17-21-57-03.png" width="40%">

> :bulb:**View variable data types and variable values** （需要 to be in interactive mode）
>
> 單擊 *變量* 在 交互式 窗口中。
>
><img src="img/2023-03-20-13-17.PNG" width="60%">

> :bulb:**Execute line by line or partially**
>
> 1. 選擇 代碼 來 執行 （可以 是 一個 或 更多 行）。
> 2. 右鍵單擊 the selected 代碼。
> 3. Select *Run Selection/Line in Interactive Window*。
>
><img src="img/2023-03-17-22-04-33.png" width="60%">

<a href="#top">Back to top</a>

---

## :wave:Git、Markdown   支持
 插件 介紹 下面 是 必不可少的 開發人員 在 Github 或 Gitlab 項目上 工作。

### GitLens
* 下載後， 腳本 代碼 將 顯示 **哪些** 部分 已經 修改**， **誰** 做了  更改， 和 **他們 被 做了。
* 注意  代碼 在 屏幕 右邊  上。 有 一條 綠色 線 在 線 `170`， 哪個 表示 那 有 是 記錄 的 新 代碼 已添加 （紅色 表示 已刪除 代碼）。
* Remember to track the project with `git` for this plugin to work。

<img src="img/2023-03-17-22-08-15.png" width="60%">

### Markdown Preview Enhanced
* When writing `.md` files, you can preview the results.
* 按 `ctrl+k`， 然後 `v` 打開  預覽 窗口。
* The middle__of the figure below shows the `.md` file, and the right side shows the preview window.

<img src="img/2023-03-17-22-15-20.png" width="60%">

<a href="#top">Back to top</a>

---

## ：計算機： Remote WSL & Dev Container

### 遠程 WSL
* vscode will open in the `Windows Subsystem Linux` environment。
* 您 可以 編輯 文件 在  `WSL` 環境 中  vscode 編輯器 而不 使用 `vim` or `nano`。

> 用法：
> 1. `ctrl+shift+p`: 打開 命令 調色板。
> 2. `WSL: New WSL Window`: open the `WSL` environment within vscode。

<img src="img/2023-03-20-11-47-42.png" width="60%">

### 開發容器
* 使用  幫助 of `Docker`，  整個 開發 環境 within vscode 可以 在 a 容器中 運行， 包括 編輯， 終端， 調試， 和 執行。

* 您 可以 執行 各種 開發 任務 ，例如 `Node.js`、 `Python`、 `Java`、 等 在 最 舒適 方式 內 只有 `Docker`__和 vscode 安裝， 沒有 需要__  安裝 相應的 運行時 和 編譯 軟件。

<img src="img/2023-03-20-11-48-43.png" width="60%">

<a href="#top">Back to top</a>

---

## ：扳手：Fixer （Fix Vscode Corrupt）
有時， 當 卸載 a 插件時，  錯誤 消息 出現 在  下 右 角 的 VS 代碼 窗口 如下 ：

<img src="https://user-images.githubusercontent.com/63782903/231321298-916da9d3-0e90-4bd5-bfc6-859371545ec7.png" width="60%" />

你 可以 解決 這個 問題 使用 以下 方法：

> 用法：
> 1. 下載 Fix VSCode Checksums 插件。
> 2. `ctrl+shift+p`: 打開  command 調色板。
> 3. `Fix ChecksumS: Apply`: execute the repair。
> 4. `ctrl+shift+p`: 打開 命令 調色板。
> 5. `開發人員： 重新加載 Window`： 重新啟動 VS Code。

<img src="img/2023-03-17-21-36-48.png" width="60%">

<a href="#top">Back to top</a>


