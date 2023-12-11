# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# Introduction

> [!NOTE]
> La version `v1` du traducteur est mise en œuvre via un package tiers `Linux`; la version `v2` est mise en œuvre via [`g4f`](https://github.com/xtekky/gpt4free) appel gratuit à l'api openai pour la traduction


* Nous savons tous que rédiger la documentation README prend beaucoup de temps, mais maintenant il existe une solution qui vous fera gagner la moitié du temps. C'est notre `action-translate-readme`

* Traduction de différentes versions de README via `gpt3.5`

* Soumission automatique (commit, push) des fichiers traduits via **Github Actions (CI/CD)**

* Par exemple: **écrire** ou **modifier** la version anglaise du README, générer automatiquement les versions chinoise traditionnelle, chinoise simplifiée, française... etc.


# Comment utiliser ?


> [!IMPORTANT]
> Comme `gpt3.5` est un modèle IA génératif, il y a donc une probabilité de problèmes à chaque traduction, il est recommandé de tester sur une branche et d'essayer plusieurs fois.

> [!WARNING]
> Si vous rencontrez l'erreur suivante: `Error: Input required and not supplied: token`, veuillez vérifier si vous avez créé un `Token` selon l'étape deux, ou si le `Token` a expiré !

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token`:

    * [Créez un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Configuration
        * Configuration du développeur
        * Jeton d