# action-translate-readme

* [English](README.md)
* [繁體中文版README.md](README.zh-TW.md)
* [简体中文](README.zh-CN.md)
* [Française](README.French.md)
* [عربى](README.Arabic.md)


# مقدمة

* نعلم جميعًا أن كتابة وثيقة README تستغرق وقتًا طويلاً ، ولكن الآن هناك حلاً يمكن أن يوفر لك نصف الوقت. هذا هو `action-translate-readme` الخاص بنا

* ترجمة إصدارات README بلغات مختلفة باستخدام `gpt3.5`

* تلقائيًا تقديم الوثائق المترجمة بعد الترجمة باستخدام **Github Actions (CI/CD)**

* على سبيل المثال: **كتابة** أو **تعديل** الإصدار الإنجليزي من README ، وتوليد تلقائي لإصدارات README باللغة التايوانية التقليدية والصينية المبسطة والفرنسية وما إلى ذلك

> [!NOTE]
> تم تنفيذ مترجم الإصدار `v1` باستخدام حزمة طرفية من `Linux` ؛ تم تنفيذ الإصدار `v2` باستخدام [`g4f`](https://github.com/xtekky/gpt4free) لاستدعاء واجهة برمجة التطبيقات المجانية لـ openai للترجمة

# كيفية الاستخدام ؟

1. انقر على الرمز :star: لإضافة هذا المشروع إلى مستودع Github الخاص بك.

2. قم بإعداد `Github Token` الخاص بك:

    * [إنشاء **`Github Secret Token`** جديد](https://github.com/settings/tokens/new)
        * قم بتعيين
        * إعدادات المطور
        * رمز الوصول الشخصي - `Tokens(classic)`
        * إنشاء رمز جديد
        * حدد النطاق: `repo` و `workflow`
        * **احتفظ** برمز الوصول السري الخاص بك (لا تفقده ، ستحتاج إليه في المستقبل)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * إنشاء **`repository secret`** جديد
        * في مستودعك - `settings`
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * قم بتعبئة العلامة بـ `token` وقم بتسميتها (مثال: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. قم بإنشاء مثال العمل الخاص بك في الدليل `.github/workflows/your_action.yml`. يمكنك نسخه مباشرة من الأمثلة التالية:

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

    هناك ثلاثة معلمات مهمة في `.yml`:

    * `token`: الرمز الذي تم إنشاؤه في الخطوة 2 في المستودع
    * `g4f_provider`: مزود gpt ، يرجى الرجوع إلى [الرابط](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4) لمزيد من المعلومات
    * `langs`: الإصدارات التي ترغب في إنشائها بلغات مختلفة ، يجب فصل اللغات بفاصلة `,` ، على سبيل المثال:
      * `"en"`: ترجمة الإصدار الإنجليزي فقط
      * `"en,zh-TW"`: ترجمة الإصدار الإنجليزي والصيني التقليدي
      * `"French,Arabic"`: ترجمة الإصدار الفرنسي والعربي

4. يمكنك الآن تحديث `README.md` ، وسيتم إنشاء إصدار مترجم تلقائيًا!

> [!IMPORTANT]
> نظرًا لأن `gpt3.5` هو نموذج AI يعتمد على الإنتاج ، فإن هناك احتمالًا لحدوث مشكلات في كل مرة يتم فيها الترجمة ، ويوصى باستخدام فروع الاختبار ومحاولة عدة مرات.

---

# عرض توضيحي

![](./img/auto-translation.gif)

---

# نتائج وثيقة الاختبار

* راجع [وثيقة الاختبار](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* استخدم أداةنا لتحديث وثيقة الاختبار

<a href="#top">العودة إلى الأعلى</a>