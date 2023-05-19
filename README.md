# action-translate-readme

[中文版README.md](README.zh-TW.md)

# Introduction

* We all know that writing documentation takes time and effort, but now there is a solution that can save you half the time . This is our `action-translate-readme`

* With this tool, you can automatically translate `README.md` files, not only for translation, but also for various elements such as **inline codes, emoticons, code blocks, HTML tags and links**

* Its operating principle is to realize automation through `Github Actions`, only need to push the updated README file, and the translated README (zh or en) file can be automatically updated

* Continuous Integration (CI)

* **Automatically translate the language of README via Github Action**

* Update `README.md` and push it, this action will automatically update `README.zh-TW.md`
    (Update `README.zh-TW.md` automatically update `README.md`)

* Save half the time of writing documents .

# Features

* Not translated:
    * inline code (`inline_code`)
    * for emoji
    * code blocks
    * HTML tags
    * links

# How to use ?

1. Click the :star: icon to add this project to your Github repository .

2. Setup your `Github Token`:

    * New a **`Github Secret Token`**
        * settings
        * Developer Settings
        * Personal Access Token - `Tokens(classic)`
        * generate a new token
        * selection range: `repo` and `workflow`
        * **keep** your scret token (don't lose it, you need to paste it later)
    <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    * New a **`repository secret`**
        * in your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * fills in tags by `token` and name it (ex: `Action_Bot`)
    <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

2. Create **README** which languages you want: `README.md`, `READM.zh-TW.md`, ...

4. Create your action in the directory `.github/workflows/your_action.yml`. example:

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
                  uses: Lin-jun-xiang/action-translate-readme@v1 # Based on the tag
                  with:
                    token: ${{ secrets.Action_Bot }} # Based on step2 name
    ```

---

# Results of Test Document

* View [Test Documentation](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Test docs updated . with `action-translate-readme`
