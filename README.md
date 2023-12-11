# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [Traditional Chinese Version README.md](README.zh-TW.md)
* [Simplified Chinese](README.zh-CN.md)
* [French](README.French.md)
* [Arabic](README.Arabic.md)


# Introduction

> [!NOTE]
> The translator of version `v1` is implemented through a third-party package in `Linux`; version `v2` is realized by calling the openai api for free through [`g4f`](https://github.com/xtekky/gpt4free).


* We all know that writing README documentation takes a lot of time, but now there is a solution that can save you half the time. That's our `action-translate-readme`

* Translate different language versions of README using `gpt3.5`

* Automatically submit (commit, push) the translated files through **Github Actions (CI/CD)**

* For example: **Write** or **modify** the English version of the README, and automatically generate versions in Traditional Chinese, Simplified Chinese, French, etc.


# How to use?

> [!IMPORTANT]
> Since `gpt3.5` belongs to a generative AI model, there is a probability of problems in each translation result. It is recommended to use branch testing and try multiple times.

> [!WARNING]
> If you encounter the following error: `Error: Input required and not supplied: token`, please follow step two to ensure that the `Token` has been created, or whether the `Token` has expired!

1. Click the :star: icon to add this project to your Github repository.

2. Set up your `Github Token`:

    * [Create a new **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Set
        * Developer settings
        * Personal access tokens - `Tokens(classic)`
        * Generate new token
        * Choose token **lifecycle** - it is recommended to use **infinite**
        * Choose scope: `repo` and `workflow`
        * **Keep** your secret token (do not lose it, you will need to paste it later)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b