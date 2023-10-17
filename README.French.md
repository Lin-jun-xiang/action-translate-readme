# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# Introduction

> [!NOTE]
> La version `v1` du traducteur est implémentée à l'aide d'un package tiers `Linux`; la version `v2` est mise en œuvre en appelant gratuitement l'API openai à l'aide de [`g4f`](https://github.com/xtekky/gpt4free).


* Nous savons tous que rédiger une documentation README prend beaucoup de temps, mais il existe maintenant une solution qui vous permet d'économiser la moitié de votre temps. C'est notre `action-translate-readme`.

* Traduisez différentes versions de README dans différentes langues en utilisant `gpt3.5`.

* Soumettez automatiquement (commit, push) les fichiers traduits à l'aide de **Github Actions (CI/CD)**.

* Par exemple: **Écrivez** ou **modifiez** la version anglaise de README, et les versions en chinois traditionnel, en chinois simplifié, en français, etc., seront générées automatiquement.


# Comment utiliser ?

> [!IMPORTANT]
> Comme `gpt3.5` est un modèle d'IA génératif, il y a une probabilité que chaque résultat de traduction présente des problèmes. Il est recommandé de tester sur une branche et d'essayer plusieurs fois.

> [!WARNING]
> Si vous rencontrez l'erreur suivante : `Error: Input required and not supplied: token`, veuillez suivre l'étape 2 pour vérifier si vous avez créé le `Token` ou si le `Token` est expiré !

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token` :

    * [Créez un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Réglages
        * Réglages développeur
        * Jetons d'accès personnels - `Tokens(classic)`
        * Générer un nouveau jeton
        * Choisissez la **durée de vie** du jeton - il est recommandé d'utiliser **illimité**
        * Choisissez les autorisations : `repo` et `workflow`
        * **Conservez** votre secret token (ne le perdez pas, vous en aurez besoin plus tard)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Créez un nouveau **`repository secret`**
        * Dans votre dépôt - Paramètres
        * Sécurité et variables
        * Actions
        * Nouveau secret de dépôt
        * Étiquetez et nommez le secret (par ex : `Action_Bot`)

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
                  uses: Lin-jun-xiang/action-translate-readme@v2 # Basé sur le tag
                  with:
                    token: ${{ secrets.Action_Bot }} # Basé sur le nom de l'étape 2
                    g4f_provider: g4f.Provider.DeepAi # Vous pouvez changer ce fournisseur
                    langs: "en,zh-TW,zh-CN,French,Arabic" # Vous pouvez définir n'importe quelles langues
    ```

    Il y a trois paramètres dans le `.yml` à noter :

    * `token` : le token créé dans l'étape 2 dans le repo
    * `g4f_provider` : le fournisseur de gpt, pour en savoir plus, veuillez consulter le [lien](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)
    * `langs` : les versions linguistiques que vous souhaitez générer, veillez à séparer les différentes langues par des virgules, par exemple :
      * `"en"` : traduire uniquement la version anglaise
      * `"en,zh-TW"` : traduire l'anglais et le chinois traditionnel
      * `"French,Arabic"` : traduire le français et l'arabe

4. Maintenant, vous pouvez mettre à jour `README.md`, et une version traduite sera générée automatiquement !

---

# Démo

![](./img/auto-translation.gif)

---

# Résultats du document de test

* Voir [le document de test](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Mettez à jour le document de test avec notre outil

<a href="#top">Retour en haut</a>
--------------------------------