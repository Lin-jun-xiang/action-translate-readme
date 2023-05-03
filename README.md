# action-translate-markdown

[中文版README.md](README.zh-TW.md)

* Continuous Integration (CI)

* **Auto Translate the Language of README.md** through Github Action

* Update `README.md` and push it, this action will auto update `README.zh-TW.md`

* Save half your time to write documents.

# Features

* Not translated:
    * Inline Code (`inline_code`)
    * Emoji's
    * Code Block
    * HTML Tag
    * Links

# How to use ?

1. Click on the :star: icon to add this project to your Github repository.
2. Download the `translate-readme.yaml` file from this project's Github repository.
3. Add the branched which want to use in `translate-readme.yaml`:
    ```
    on:
        push:
            branches:
            - dev
            - test
            - main
    ```
4. Save the `translate-readme.yaml` file to your own repository, in the directory `.github/workflows/.` This is where Github Actions are stored.
5. Download `translation.sh`
6. New **Github Token**
    * Settings
    * Developer settings
    * Personal access tokens - Tokens(classic)
    * Generate New Token
    * Select scopes: `repo` and `workflow`
    * **Keep** your token secrets (Don't lost)
7. New **repository secret**
    * In your repository - settings
    * Securits and variables
    * Actions
    * New repository secret
    * Fill in the token from `step6`


# Results of Test Document

* Check out [Test Document](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* The Test Document is used `action-translate-markdown` to update.
 