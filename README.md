# action-translate-markdown

[中文版README.md](README.zh-TW.md)

* Continuous Integration (CI)

* **Automatically translate the language of README via Github Action**

* Update `README.md` and push it, this will automatically update `README.zh-TW.md`
     (update `README.zh-TW.md` automatically updates `README.md`)

* Save half the time of writing documents .

* `測試`: test.

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
