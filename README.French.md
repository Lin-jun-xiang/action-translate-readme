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
> La version `v1` du traducteur est réalisée via des paquets tiers sous `Linux` ; la version `v2` est réalisée via une IA générative pour la traduction.


* Nous savons tous que rédiger un README prend du temps, mais il existe maintenant une solution pour vous faire gagner la moitié de ce temps. C'est notre `action-translate-readme`

* Traduire les versions de README dans différentes langues via **IA générative**

* Soumettre automatiquement (commit, push) les fichiers traduits via **Github Actions (CI/CD)**

* Par exemple : **rédiger** ou **modifier** le README en anglais, générer automatiquement les versions en chinois traditionnel, chinois simplifié, français, etc.


# How to use ?

> [!IMPORTANT]
> Étant donné que les résultats de la traduction par le modèle d'IA générative peuvent présenter des problèmes à chaque tentative, il est recommandé de tester sur une branche et de réessayer plusieurs fois.

> [!WARNING]
> Si vous rencontrez l'erreur suivante : `Error: Input required and not supplied: token`, veuillez suivre les étapes ci-dessous pour vous assurer que le `Token` a été créé ou qu'il n'a pas expiré !

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token`:

    * [Créer un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Configuration
        * Paramètres développeur
        * Jetons d'accès personnels - `Tokens(classic)`
        * Générer un nouveau jeton
        * Choisir la **durée de vie** du jeton - Il est recommandé d'utiliser directement **illimité**
        * Choisir les scopes : `repo` et `workflow`
        * **Conserver** votre secret token (ne le perdez pas, vous en aurez besoin plus tard)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * Créer un nouveau **`repository secret`**
        * Dans votre dépôt - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Remplir le libellé avec `token` et le nommer (ex : `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Sélection du modèle GPT
   
   * `g4f` : **Par défaut**, utilise `g4f` pour les appels OpenAI et réaliser les tâches de traduction.
   * `zhipuai` : Si vous avez besoin d'une traduction stable, vous pouvez vous inscrire sur la [plateforme Zhipu AI](https://open.bigmodel.cn/dev/howuse/introduction) et [demander un API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys). C'est une solution GPT entièrement gratuite, sans besoin de carte de crédit.
     * Pour utiliser cette solution, veuillez suivre les étapes de la création du Github Token et ajouter l'API KEY de Zhipu AI dans le dépôt en tant que variable d'environnement.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

4. Créez votre exemple d'action dans le répertoire `.github/workflows/your_action.yml`. Vous pouvez directement copier ce qui suit:

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
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Basé sur l'étape 3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # Vous pouvez définir n'importe quelles langues
    ```

    Dans le `.yml`, trois paramètres nécessitent une attention particulière:

    * `token` : Selon l'étape 2, le token créé dans les dépôts
    * `zhipuai` : Le fournisseur de GPT, si fourni, utilise le modèle de la plateforme Zhipu AI, sinon utilise `g4f` par défaut, doit être créé dans les dépôts
    * `langs` : Les versions linguistiques que vous souhaitez générer, assurez-vous de les séparer par des `,`, par exemple:
      * `"en"` : Traduire uniquement la version anglaise
      * `"en,zh-TW"` : Traduire l'anglais et le chinois traditionnel
      * `"French,Arabic"` : Traduire le français et l'arabe

5. Vous pouvez maintenant mettre à jour `README.md`, il générera automatiquement une version traduite !

---

# Demo

![](./img/auto-translation.gif)

---

# Résultats du Document de Test

* Voir le [document de test](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* Utiliser notre outil pour mettre à jour le document de test

<a href="#top">Retour en haut</a>