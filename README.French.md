# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)

# Introduction

* Nous savons tous que la rédaction de README est très chronophage, mais il y a maintenant une solution pour vous permettre de gagner la moitié du temps. C'est notre "action-translate-readme".

* Traduction des différentes versions des README dans différentes langues grâce à "gpt3.5"

* Soumission automatique(commit, push) des documents traduits grâce à la fonction intégrée des actions Github (CI/CD) 

* Par exemple : "Le fait de rédiger" ou de "modifier" la version anglaise de README va automatiquement générer des versions de README en chinois traditionnel, en chinois simplifié, en français, etc.

Note : Pour la version 1 du traducteur, un système tiers sur "Linux" a été utilisé tandis que pour la version 2, une API openai gratuite appelée "g4f" a été utilisée pour la traduction.

# Comment utiliser ?

1. Appuyez sur l'icône :star: pour ajouter ce projet à votre entrepôt

2. Configurez votre "Github Token" :

    * [Créer un nouveau "**Github Secret Token**"](https://github.com/settings/tokens/new)
        * Réglage
        * Configuration du développeur
        * Jeton d'accès personnel - "Tokens(classic)"
        * Générer un nouveau jeton
        * Choisissez le scope : "repo" et "workflow"
        * **Conservez** votre secret token (ne le perdez pas, vous en aurez besoin plus tard)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Créer un nouveau "**repository secret**" :
        * Dans votre entrepôt - "settings"
        * Sécurité et variables
        * Actions
        * Nouveau secret de l'entrepôt
        * Appuyez sur "token" pour ajouter des tags et un nom ("Action_Bot" par exemple).

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Dans le dossier ".github/workflows/your_action.yml", créez votre exemple d'action. Vous pouvez directement copier ce code :

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
                    langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
    ```

    Il y a trois paramètres à prendre en compte dans ".yml" :

    * "token" : basé sur le nom de l'étape 2.

    * "g4f_provider" : pour le fournisseur GPT, veuillez vous référer au [lien](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)

    * "langs" : définir les langues que vous souhaitez générer, elles doivent être séparées par des virgules. Par exemple :
       * "en": uniquement pour l'anglais
       * "en,zh-TW": pour l'anglais et le chinois (traditionnel)
       * "French,Arabic": pour le français et l'arabe

4. Vous pouvez maintenant mettre à jour le "README.md". Cela générera automatiquement une version traduite !

---

# Demo

![](./img/auto-translation.gif)

---

# Results of Test Document

* Regardez le [document de test] (https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Mettez à jour notre document de test avec notre outil

<a href="#top">Retour en haut de la page</a>