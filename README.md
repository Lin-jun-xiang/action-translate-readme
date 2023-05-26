# action-translate-readme

[中文版README.md](README.zh-TW.md)

# Introduction

* We all know that writing documentation is time-consuming, but now there is a solution that can save you half the time . This is our `action-translate-readme`

* With this tool, you can automatically translate `README.md` files, not only for translation, but also for various elements such as **inline code, emoticons, code blocks, HTML tags and links**

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

2. set your `Github Token`:

    * Create a new **`Github Secret Token`**
        * settings
        * Developer settings
        * Personal Access Token - `Tokens(classic)`
        * generate a new token
        * selection range: `repo` and `workflow`
        * **keep** your secret token (don’t lose it, you need to paste it later)
            <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Create a new **`repository secret`**
        * in your repository - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * fill in the label by `token` and name it (eg: `Action_Bot`)
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

2. create **README** language you want: `README.md`, `READM.zh-TW.md`, ...

4. Create your action example in the directory `.github/workflows/your_action.yml`.:

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

5. Now you can update `README.md`, and it will auto generate a translation version!
---

# Results of Test Document

* View [Test Documentation](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Test docs updated . with `action-translate-readme`

<a href="#top">Back to top</a>
