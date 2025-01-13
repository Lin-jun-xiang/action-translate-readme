# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)

# Introduction

**GitHub Action pour traduire le Readme dans n'importe quelle langue**

Il s'agit d'une GitHub Action qui traduit automatiquement le readme de votre dépôt dans une langue spécifiée.

> [!NOTE]
> La version `v1` du traducteur est implémentée via un paquet tiers sous `Linux` ; la version `v2` est implémentée via une IA générative pour la traduction.

* Nous savons tous que rédiger des documents README est chronophage, mais il existe désormais une solution pour vous faire gagner la moitié du temps. C'est notre `action-translate-readme`.

* Traduire différentes versions de READMEREADME via **IA générative**

* **Commiter et pousser** automatiquement les fichiers traduits via **GitHub Actions (CI/CD)**

* Par exemple : **Écrire** ou **Modifier** la version anglaise du README, générer automatiquement les versions en chinois traditionnel, chinois simplifié, français... et autres versions du README

# Comment l'utiliser ?

> [!IMPORTANT]
> Étant donné que les résultats de la traduction par le modèle d'IA générative peuvent présenter des problèmes occasionnels, il est recommandé d'effectuer les opérations sur une branche et de fusionner ensuite avec la branche principale.

> [!AVERTISSEMENT]
> Si vous rencontrez cette erreur : `Error: Input required and not supplied: token`, veuillez vous assurer que le `Token` est établi comme indiqué à l'étape deux ci-dessous, ou vérifiez si le `Token` a expiré !

1. Cliquez sur l'icône :star: pour ajouter cet élément à votre dépôt GitHub.

2. Configurez votre `GitHub Token` (**obligatoire**) :

    1. [Créer un nouveau **`GitHub Secret Token`**](https://github.com/settings/tokens/new)
        * Paramètres
        * Paramètres du développeur
        * Jetons d'accès personnels - `Tokens(classic)`
        * Générer un nouveau jeton
        * Choisir la **durée de vie** du jeton - il est recommandé d'utiliser **permanently**
        * Sélection de la portée : `repo` et `workflow`
        * **Conservez** votre jeton secret (ne le perdez pas, vous devrez le coller plus tard)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width="60%" />

    2. Ajoutez le GitHub Token aux **`secrets du dépôt`**
        * Dans votre dépôt - `settings`
`
        * `Sécurité et variables`
        * `Actions`
        * `Nouveau secret du dépôt`
        * Remplissez l'étiquette et nommez-la `token` (par exemple, `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width="60%" />

3. Choisissez le modèle de traduction GPT (**optionnel**)
   
   * `g4f` : **Par défaut**, utilise **gratuitement** `g4f` pour les appels OpenAI afin de réaliser les tâches de traduction.
   * `zhipuai` : Si vous avez besoin d'une traduction **gratuite et stable**, vous pouvez vous inscrire sur la [plateforme Zhipuai AI](https://open.bigmodel.cn/dev/howuse/introduction) et [demander une clé API](https://open.bigmodel.cn/usercenter/proj-mgmt/apikeys), il s'agit d'un modèle GPT entièrement gratuit sans besoin de carte de crédit.
     * Pour utiliser cette option, suivez la méthode d'ajout du GitHub Token à **l'étape 2-2**, et ajoutez **la clé API de Zhipuai AI aux secrets du dépôt GitHub**.

        <img src="static/images/2025-01-02-11-25-45.png" width="60%" />

        <img src="static/images/2025-01-02-11-26-28.png" width="60%" />

   * `openai` : **Garantit une qualité élevée et une stabilité**, si vous avez une clé API OPENAI, `gpt-4o` sera utilisé comme modèle de traduction.
     * Pour utiliser cette option, suivez la méthode d'ajout du GitHub Token à **l'étape 2-2**, et ajoutez **la clé API d'OpenAI aux secrets du dépôt GitHub**.

        <img src="static/images/2025-01-13-10-13-51.png" width="60%" />

4. Créez votre exemple d'action dans `.github/workflows/your_action.yml`. Vous pouvez directement copier ce qui suit :

    ```yaml
    # .github/workflows/translate.yml
    name: Traduire le Readme

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

                - name: Traduction automatique
                  uses: Lin-jun-xiang/action-translate-readme@v2 # Basé sur le tag
                  with:
                    token: ${{ secrets.Action_Bot }} # Basé sur le nom de l'étape 2
                    zhipuai: ${{ secrets.zhipuai_api_key }} # Optionnel : Basé sur l'étape 3
                    openai: ${{ secrets.open
openai_api_key }}  # Optionnel : Basé sur l'étape 3
                    langs: "en,zh-TW,zh-CN,French,Arabic" # Vous pouvez définir n'importe quelles langues
    ```

    Faites attention à plusieurs paramètres dans le `.yml` :

    * `token` : GitHub Token pour autoriser l'opération (ajouté comme à l'étape deux).
    * `zhipuai` : API Zhipuai, ajoutée comme à l'étape trois (optionnel)
    * `openai` : API OpenAI, ajoutée comme à l'étape trois (optionnel)
    * `langs` : Spécifiez les langues à traduire, assurez-vous de séparer différentes langues par `,` comme :
      * `"en"` : Traduire uniquement la version anglaise
      * `"en,zh-TW"` : Traduire l'anglais, le chinois traditionnel
      * `"French,Arabic"` : Traduire le français, l'arabe

    > PS : Si ni `zhipuai` ni `openai` n'est ajouté aux secrets GitHub, `g4f` sera utilisé pour la traduction.

5. Maintenant, vous pouvez mettre à jour `README.md`, et cela générera automatiquement une version traduite !

---

# Démo

![](./img/auto-translation.gif)

# Résultats du document de test

* Voir le [document de test](https://github.com/Lin-jun-xiang/ChatGPT-line-bot) qui a utilisé notre outil pour mettre à jour les documents.

<a href="#top">Retour en haut</a>