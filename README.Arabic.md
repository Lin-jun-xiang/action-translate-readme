# action-translate-readme

* [الإنجليزية](README.md)
* [قراءة الإصدار التقليدي ل README.md](README.zh-TW.md)
* [الصينية المبسطة](README.zh-CN.md)
* [فرنسي](README.French.md)
* [عربى](README.Arabic.md)


# المقدمة

* نعلم جميعًا أن كتابة مستند README تستغرق وقتًا طويلاً ، ولكن الآن هناك حل يمكن أن يوفر لك النصف من وقتك. هذا هو `action-translate-readme` الخاص بنا

* ترجمة إصدارات README المختلفة بواسطة `gpt3.5`

* عن طريق ** Github Actions (CI / CD) التحميل التلقائي للكتابة(commit، push)** للملفات المترجمة

* على سبيل المثال: ** كتابة **أو** تعديل **إصدار README الإنجليزي، توليد إصدار README الصيني التقليدي و الصيني المبسط و الفرنسي... إلخ

ملاحظة: يتم تحقيق المترجم في الإصدار v1 عن طريق حزمة جانبية من `Linux` ؛ ويتم تحقيق الإصدار v2 عن طريق استخدام برنامج [`g4f`](https://github.com/xtekky/gpt4free) لاستخدام ترخيص openai بشكل مجاني.


# كيفية الاستخدام؟

1. انقر فوق رمز النجمة لإضافة هذا المشروع إلى مستودع GitHub الخاص بك.

2. تعيين `Github Token` الخاص بك:

    * [قم بإنشاء **`Github Secret Token`** جديد](https://github.com/settings/tokens/new)
        * إعداد
        * تمكين المطور
        * بيانات اعتماد الوصول الشخصية - `الرموز الكلاسيكية`
        * إنشاء رمز جديد
        * اختر النطاق: `repo` و `workflow`
        * **حافظ** على الرمز السري الخاص بك (لا تفقده ، ستحتاج إليه في المستقبل)
  
        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/b7487b49-817c-4925-b94a-bdb7b025a0c2" width=" 60%" />

    * أنشئ مفتاح سرّي جديد للـ **`repository secret`**
        * في مستودعك - الإعدادات
        * `Securits and variables`
        * `Actions`
        * `New repository secret`
        * اضغط على `token` ثم قم بتسميته (مثل: `Action_Bot`)

        <img src="https://github.com/Lin-jun-xiang/action-translate-readme/assets/63782903/27dc7bcd-633f-431e-98e8-387b97ecd47c" width=" 60%" />

3. في الدليل `.github/workflows/your_action.yml`.، قم بإنشاء مثال عملك ، يمكنك نسخه مباشرة:

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

    هناك ثلاثة معلمات في `.yml` يجب مراعاتها بشكل خاص:

    * `token`: الرمز السري الذي تم إنشاؤه بموجب الخطوة 2 في المستودع
    * `g4f_provider`: مزود gpt ، يرجى الرجوع إلى [هذا الرابط](https://github.com/xtekky/gpt4free/tree/main#gpt-35--gpt-4) للحصول على مزيد من المعلومات
    * `langs`: أي لغات تريد إنشاء إصدارات لها ، يرجى تحديدها بفصلها بـ `,` ، مثلاً:
      * `"en"`: الإنجليزية فقط
      * `"en,zh-TW"`: الإنجليزية، الصينية التقليدية
      * `"French,Arabic"`: الفرنسية، العربية

4. يمكنك الآن تحديث `README.md` ، وسيتم إنشاء إصدار مترجم تلقائيًا!

---

# مثال توضيحي

![](./img/auto-translation.gif)

---

# نتائج الوثيقة الاختبارية

* راجع [الوثيقة التجريبية](https://github.com/Lin-jun-xiang/vscode-extensions-best/tree/main)
* استخدم أداتنا لتحديث الوثيقة الاختبارية

<a href="#top">عودة إلى أعلى الصفحة</a>