# action-translate-markdown

[中文版README.md](README.zh-TW.md)

# Introduction

* We all know that writing documentation takes a lot of time and effort, but now there is a solution that can save you half the time. This is our `action-translate-markdown`

* With this tool, you can automatically translate `README.md` files, and not only translate, it can also recognize various elements such as **inline code, emoticons, code blocks, HTML tags and links**

* The principle of its operation is to achieve automation through `Github Actions`, you only need to push the updated README file, and the translated README(zh or en) file can be automatically updated

* Continuous Integration (CI)

* **Automatically translate the language of README via Github Action**

* Update `README.md` and push it, this will automatically update `README.zh-TW.md`
     (update `README.zh-TW.md` automatically updates `README.md`)

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
2. Download the `translate-readme.yaml` file . from the project's Github repository
3. Add branch to be used in `translate-readme.yaml`:
    ```
    on:
        push:
            branches:
            - dev
            - test
            - main
    ```
4. Save the `translate-readme.yaml` file to your own warehouse, in the directory `.github/workflows/.` This is where Github Actions are stored.
5. download `translation.sh`
6. New **Github Token Secret**
    * settings
    * Developer settings
    * Personal Access Token - `Tokens(classic)`
    * generate a new token
    * selection range: `repo` and `workflow`
    * **keep** your token secret (don't lose it)
7. new **repository secret**
    * in your repository - `settings`
    * `Securits and variables`
    * `Actions`
    * `New repository secret`
    * fills in tags from `step6`


# Results of Test Document

* View [test document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Test docs update . with `action-translate-markdown`
