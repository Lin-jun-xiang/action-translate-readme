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
> La version `v1` du traducteur est réalisée via des paquets tiers sous `Linux` ; la version `v2` est réalisée via une IA générative pour la traduction.


* Nous savons tous que rédiger un README prend du temps, mais il existe maintenant une solution qui peut vous faire gagner la moitié de ce temps. C'est notre `action-translate-readme`

* Traduire les README dans différentes langues via une **IA générative**

* Soumettre automatiquement (commit, push) les fichiers traduits via **Github Actions (CI/CD)**

* Par exemple : **écrire** ou **modifier** le README en anglais, générer automatiquement les versions en chinois traditionnel, chinois simplifié, français, etc.


# How to use ?

> [!IMPORTANT]
> Étant donné que les résultats de la traduction par le modèle d'IA générative peuvent présenter des problèmes à chaque tentative, il est recommandé d'exécuter sur une branche et de fusionner ensuite avec la branche principale.

> [!WARNING]
> Si vous rencontrez l'erreur suivante : `Error: Input required and not supplied: token`, veuillez suivre les étapes ci-dessous pour vous assurer que le `Token` a été créé, ou vérifiez si le `Token` a expiré !

1. Cliquez sur l'icône :star: pour ajouter ce projet à votre dépôt Github.

2. Configurez votre `Github Token` (**obligatoire**) :

    1. [Créer un nouveau **`Github Secret Token`**](https://github.com/settings/tokens/new)
        * Configuration
        * Paramètres du développeur
        * Jetons d'accès personnels - `Tokens(classic)`
        * Générer un nouveau jeton
        * Choisir la **durée de vie** du jeton - Il est recommandé d'utiliser **illimité**
        * Choisir les scopes : `repo` et `workflow`
        * **Conserver** votre secret token (ne le perdez pas, vous en aurez besoin plus tard)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    2. Ajoutez le Github Token aux **`repository secret`**
        * Dans votre dépôt - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * Remplissez le label avec `token` et donnez-lui un nom (ex : `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. Choix du modèle de traduction GPT (**optionnel**)
   
   * `g4f` : **Par défaut**, utilise **gratuitement** `g4f` pour les appels OpenAI et réaliser les tâches de traduction.
   * `zhipuai` : Si vous avez besoin d'une traduction **gratuite et stable**, vous pouvez vous inscrire sur la [plateforme Zhipuai AI](https://open.bigmodel.cn/dev/howuse/introduction) et [demander un API KEY](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys). C'est une solution GPT entièrement gratuite, sans besoin de carte de crédit.
     * Pour utiliser cette solution, veuillez ajouter l'API KEY de Zhipuai AI aux Secrets de GitHub Repos de la même manière que décrit dans **étape 2-2**.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai` : **Garantit une qualité élevée et stable**, si vous avez un OPENAI API KEY, le modèle `gpt-4o` sera utilisé pour la traduction.
     * Pour utiliser cette solution, veuillez ajouter l'API KEY d'OpenAI aux Secrets de GitHub Repos de la même manière que décrit dans **étape 2-2**.

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. Créez votre exemple d'action dans le répertoire `.github/workflows/your_action.yml`. Vous pouvez directement copier ce qui suit :

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
                  uses: Lin-jun-xiang/action-translate-readme@v2 # Basé sur le tag
                  with:
                    token: ${{ secrets.Action_Bot }} # Basé sur le nom de l'étape 2
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Optionnel : Basé sur l'étape 3
                    openai: ${{ secrets.openai_api_key }}  # Optionnel : Basé sur l'étape 3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # Vous pouvez définir n'importe quelles langues
    ```

    Dans le `.yml`, quelques paramètres nécessitent une attention particulière :

    * `token` : Le GitHub Token utilisé pour autoriser l'action (ajouté selon l'étape 2).
    * `zhipuai` : API Zhipuai, ajoutée selon l'étape 3 (optionnel)
    * `openai` : API OpenAI, ajoutée selon l'étape 3 (optionnel)
    * `langs` : Langues à traduire, veillez à les séparer par des `,`, par exemple :
      * `"en"` : Traduire uniquement la version anglaise
      * `"en,zh-TW"` : Traduire l'anglais et le chinois traditionnel
      * `"French,Arabic"` : Traduire le français et l'arabe

    > PS : Si ni `zhipuai`, ni `openai` n'ont été ajoutés aux Secrets de GitHub, `g4f` sera utilisé pour la traduction.

5. Maintenant, vous pouvez mettre à jour `README.md`, une version traduite sera générée automatiquement !

---

# Demo

![](./img/auto-translation.gif)

---

<a href="#top">Retour en haut</a>