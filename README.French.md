# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# Introduction

* Nous savons tous que rédiger une documentation README prend du temps, mais il existe maintenant une solution qui vous permet d'économiser la moitié de votre temps. C'est notre `action-translate-readme`

* Traduisez les différentes versions de README dans différentes langues avec `gpt3.5`

* Soumettez automatiquement les fichiers traduits via **Github Actions (CI/CD)** (commit, push)

* Par exemple : **écrire** ou **modifier** la version anglaise du README, générer automatiquement les versions en chinois traditionnel, en chinois simplifié, en français, etc.

> [!NOTE]
> La version `v1` du traducteur est implémentée via un package tiers `Linux` ; la version `v2` est implémentée via l'appel gratuit de l'API openai de [`g4f`](https://github.com/xtekky/gpt4free) pour la traduction

# Comment utiliser ?

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token` :

    * [Créez un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Configurez
        * Paramètres du développeur
        * Jeton d'accès personnel - `Tokens(classic)`
        * Générer un nouveau jeton
        * Choisissez les autorisations : `repo` et `workflow`
        * **Conservez** votre jeton secret (ne le perdez pas, vous en aurez besoin plus tard)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Créez un nouveau **`repository secret`**
        * Dans votre dépôt - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Remplissez l'étiquette avec `token` et donnez-lui un nom (par exemple : `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Créez votre exemple d'action dans le répertoire `.github/workflows/your_action.yml`. Vous pouvez simplement copier le contenu suivant :

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

    Il y a trois paramètres importants dans le fichier `.yml` :

    * `token` : le token que vous avez créé dans le dépôt lors de l'étape 2
    * `g4f_provider` : le fournisseur de gpt, pour plus d'informations, veuillez consulter le [lien](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)
    * `langs` : les versions linguistiques que vous souhaitez générer, veillez à séparer les différentes langues par des virgules, par exemple :
      * `"en"` : traduire uniquement la version anglaise
      * `"en,zh-TW"` : traduire en anglais et en chinois traditionnel
      * `"French,Arabic"` : traduire en français et en arabe

4. Vous pouvez maintenant mettre à jour le fichier `README.md`, il générera automatiquement une version traduite !

> [!IMPORTANT]
> Étant donné que `gpt3.5` est un modèle d'IA génératif, il y a toujours une probabilité que les résultats de la traduction soient incorrects. Nous vous recommandons de tester sur une branche et d'essayer plusieurs fois.

---

# Démo

![](./img/auto-translation.gif)

---

# Résultats du document de test

* Voir [le document de test](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Mettez à jour le document de test avec notre outil

<a href="#top">Retour en haut</a>
--------------------------------