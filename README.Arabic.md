# action-translate-readme

<p align="center">
    <img src="img/2023-11-13-16-50-04.png" width="60%"/>
</p>

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# المقدمة

> [!NOTE]
> إن مترجم الإصدار `v1` تم تنفيذه باستخدام حزمة الطرف الثالث `Linux`؛ بينما يتم تنفيذ الإصدار `v2` باستخدام [`g4f`](https://github.com/xtekky/gpt4free) لاستدعاء واجهة برمجة تطبيقات openai مجانًا للترجمة.


* نعلم جميعًا أن كتابة وثيقة README تستغرق وقتًا طويلاً ، ولكن الآن هناك حلاً يمكنك من خلاله توفير نصف الوقت. هذا هو `action-translate-readme` لدينا.

* قم بترجمة إصدارات README المختلفة بواسطة `gpt3.5`.

* تقديم **Github Actions(CI/CD) للترجمة التلقائية (commit، push)** للملفات المترجمة.

* على سبيل المثال: **كتابة** أو **تعديل** إصدار README باللغة الإنجليزية ، ستتم إنشاء إصدارات README باللغة التايوانية التقليدية واللغة الصينية المبسطة واللغة الفرنسية وما إلى ذلك.


# كيفية الاستخدام؟


> [!IMPORTANT]
> نظرًا لأن `gpt3.5` هو نموذج AI القائم على الإنتاج ، فإنه يحتمل أن تكون هناك مشاكل في كل نتيجة للترجمة ، ويُنصح باستخدام الفروع للاختبار ومحاولة عدة مرات.

> [!WARNING]
> إذا واجهت الخطأ التالي: `Error: Input required and not supplied: token`، يُرجى التأكد من إنشاء `Token` وفقًا للخطوة الثانية ، أو التحقق مما إذا كان الـ `Token` قد انتهت صلاحيته!

1. انقر على رمز النجمة :star: لإضافة هذا المشروع إلى مستودع Github الخاص بك.

2. قم بتعيين `Github Token` الخاص بك:

    * [أنشئ **`Github Secret Token`** جديد](https://github.com/settings/tokens/new)
        * قم بإعداده
        * إعدادات المطور
        * رمز الوصول الشخصي - `Tokens(classic)`
        * إنشاء رمز جديد
        * اختيار **دورة حياة الرمز** - يُوصى باستخدام **غير محددة المدة**
        * اختيار النطاق: `repo` و `workflow`
        * **احتفظ** برمز الوصول السري الخاص بك (لا تفقده ، ستحتاج إليه في المستقبل)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * أنشئ **`repository secret`** جديدًا
        * في مستودعك - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * قم بتعبئة علامة `token` وتسميتها (على سبيل المثال: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. قم بإنشاء مثال الإجراء الخاص بك في الدليل `.github/workflows/your_action.yml`. يمكنك نسخه مباشرة كما يلي:

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

    هناك ثلاثة معلمات تحتاج إلى إيلاء اهتمام خاص في الملف `.yml`:

    * `token`: الرمز الذي تم إنشاؤه في الخطوة 2 في المستودع
    * `g4f_provider`: مزود gpt ، يُرجى الرجوع إلى المزيد من التفاصيل في ال[رابط](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4)
    * `langs`: الإصدارات التي تريد إنشاءها ، يجب عليك تحديد اللغات المختلفة بفاصلة `,` ، على سبيل المثال:
      * `"en"`: ترجمة الإصدار الإنجليزي فقط
      * `"en,zh-TW"`: ترجمة الإصدار الإنجليزي والإصدار التايواني التقليدي
      * `"French,Arabic"`: ترجمة الإصدار الفرنسي والإصدار العربي

4. يمكنك الآن تحديث `README.md` وسيتم إنشاء إصدار مترجم تلقائيًا!

---

# عرض توضيحي

![](./img/auto-translation.gif)

---

# نتائج وثيقة الاختبار

* شاهد [وثيقة الاختبار](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* استخدم أداةنا لتحديث وثيقة الاختبار

<a href="#top">العودة إلى الأعلى</a>
--------------------------------