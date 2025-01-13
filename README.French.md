# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# Introduction

> [!NOTE]
> Le traducteur de la version `v1` est réalisé via un paquet tiers de `Linux` ; la version `v2` est réalisée via une traduction AI générative.

* Nous savons tous que rédiger des documents README prend beaucoup de temps, mais il existe maintenant une solution qui peut vous faire gagner la moitié du temps. C'est notre `action-translate-readme`.

* Traduire différentes versions linguistiques du README grâce à l'**AI générative**

* **Soumission automatique (commit, push) via Github Actions (CI/CD)** des fichiers traduits

* Par exemple : **rédiger** ou **modifier** un README en anglais, générer automatiquement les versions chinoises traditionnelle et simplifiée, française... etc. du README.


# Comment l'utiliser ?

> [!IMPORTANT]
> Comme le modèle AI génératif a une chance de générer des erreurs à chaque traduction, il est recommandé d'exécuter sur un branche et de fusionner à la fin.

> [!WARNING]
> Si vous rencontrez l'erreur suivante : `Error: Input required and not supplied: token`, assurez-vous de créer ou vérifier si le `Token` est périmé, selon l'étape deux ci-dessous !

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token` (**obligatoire**):

    1. [Créez un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Réglages
        * Réglages développeur
        * Tokens d'accès personnel - `Tokens(classic)`
        * Générer un nouveau token
        * Choisir la **durée de vie** du token - Recommandé : **illimité**
        * Choisir les étendues : `repo` et `workflow`
        * **Gardez** votre token secret (ne le perdez pas, vous en aurez besoin plus tard)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    2. Ajoutez le Github Token aux **`repository secret`**
        * Dans votre dépôt - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Remplissez le label et le nom par `token` (ex : `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Choix du modèle de traduction GPT (**optionnel**)

   * `g4f` : Par défaut, utilise le `g4f` **gratuit** pour appeler OpenAI et réaliser les traductions.
   * `zhipuai`: Si vous avez besoin de traductions **gratuites et stables**, vous pouvez vous inscrire sur [la plateforme Zhipuai AI](https://open.bigmodel.cn/dev/howuse/introduction) et [demander une API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys), c'est une solution de modèle GPT entièrement gratuite et sans carte de crédit.
     * Pour utiliser cette solution, suivez les mêmes étapes que **étape 2-2** pour ajouter le Github Token, et ajoutez l'**API KEY de Zhipuai AI aux Secrets GitHub Repos**.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai` : **Garantie d'une qualité élevée et stable**, si vous avez une API KEY OPENAI, le `gpt-4o` sera utilisé comme modèle de traduction.
     * Pour utiliser cette solution, suivez les mêmes étapes que **étape 2-2** pour ajouter le Github Token, et ajoutez l'**API KEY OpenAI aux Secrets GitHub Repos**.

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. Créez votre exemple de workflow dans le répertoire `.github/workflows/your_action.yml`. Vous pouvez directement copier ce qui suit :

    ```yaml
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
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Optional: Based on step3
                    openai: ${{ secrets.openai_api_key }}  # Optional: Based on step3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # You can define any langs
    ```

    Il y a plusieurs paramètres à noter dans le `.yml`:

    * `token`: Le GitHub Token utilisé pour autoriser l'action (à ajouter selon l'étape deux).
    * `zhipuai`: Zhipuai API, à ajouter selon l'étape trois (optionnel)
    * `openai`: OpenAI API, à ajouter selon l'étape trois (optionnel)
    * `langs`: Les langues à traduire, à séparer par des virgules comme suit :
      * `"en"` : Traduire uniquement en anglais
      * `"en,zh-TW"` : Traduire en anglais, chinois traditionnel
      * `"French,Arabic"` : Traduire en français, arabe

    > PS: Si ni `zhipuai`, ni `openai` ne sont ajoutés aux secrets GitHub, `g4f` sera utilisé pour les traductions.

5. Maintenant, vous pouvez mettre à jour votre `README.md`, une version traduite sera automatiquement générée !

---

# Démo

![](./img/auto-translation.gif)

---

<a href="#top">Revenir en haut</a>