import 'package:sarahah_questions/app/localization/trans_manager.dart';

class Ar {
  static final Ar singleton = Ar._internal();
  Ar._internal();

  Map<String, String> get keys => {
        TransManager.thereIsNoOptionsFound: "لا توجد خيارات متاحة",
        TransManager.loading: "جار التحميل...",
        TransManager.login: "تسجيل الدخول",
        TransManager.username: "اسم المستخدم",
        TransManager.password: "كلمة المرور",
        TransManager.phoneNumber: "رقم الهاتف",
        TransManager.emailAddress: "عنوان البريد الإلكتروني",
        TransManager.gallery: "المعرض",
        TransManager.camera: "الكاميرا",
        TransManager.pickImage: "اختر صورة",
        TransManager.invalidEmail: "عنوان البريد الإلكتروني غير صالح",
        TransManager.weakPassword: "كلمة المرور ضعيفة",
        TransManager.invalidUsername: "اسم المستخدم غير صالح",
        TransManager.resetPasswordHintPart1:
            "الرجاء كتابة البريد الإلكتروني الخاص بحسابك, لإستكمال إجراء ",
        TransManager.resetPasswordHintPart3: " ",
        TransManager.continue_: "متابعة",
        TransManager.pleaseWait: "الرجاء الانتظار...",
        TransManager.pleaseEnterValidEmail: "الرجاء إدخال بريد إلكتروني صالح",
        TransManager.requiredField: "هذا الحقل مطلوب",
        TransManager.passwordMustBeAtLeast6Characters:
            "كلمة المرور يجب أن تكون على الأقل 6 أحرف",
        TransManager.home: "الشاشة الرئيسة",
        TransManager.myProfile: "حسابي الشخصي",
        TransManager.appName: "أسئلة الصراحة",
        TransManager.contactUs: "اتصل بنا",
        TransManager.privacyPolicy: "سياسة الخصوصية",
        TransManager.rateUs: "قيمنا",
        TransManager.ourApps: "تطبيقاتنا",
        TransManager.adminLogin: "تسجيل دخول المسؤول",
        TransManager.addNew: "إضافة جديد",
        TransManager.questionText: "نص السؤال",
        TransManager.enterQuestionTextHere: "أدخل نص السؤال هنا",
        TransManager.add: "إضافة",
        TransManager.questions: "الأسئلة",
        TransManager.wrongEmailOrPassword:
            "البريد الإلكتروني أو كلمة المرور غير صحيحة",
        TransManager.addNewCategory: "إضافة تصنيف جديدة",
        TransManager.categoryName: "اسم التصنيف",
        TransManager.selectCategory: "اختر التصنيف",
        TransManager.addNewQuestion: "إضافة سؤال جديد",
        TransManager.editProfile: "تعديل الملف الشخصي",
        TransManager.somethingWentWrong: "حدث خطأ ما",
        TransManager.questionAddedSuccessfully: "تمت إضافة السؤال بنجاح",
        TransManager.youMustSelectCategory: "يجب اختيار فئة",
        TransManager.youMustEnterCategoryName: "يجب إدخال اسم الفئة",
        TransManager.youMustEnterTheQuestion: "يجب إدخال السؤال",
        TransManager.categories: "الفئات",
        TransManager.manageCategories: "إدارة الفئات",
        TransManager.categoryDeletedSuccessfully: "تم حذف الفئة بنجاح",
        TransManager.errorWhileDeletingCategory: "حدث خطأ أثناء حذف التصنيف",
        TransManager.questionDeletedSuccessfully: "تم حذف السؤال بنجاح",
        TransManager.errorWhileDeletingQuestion: "حدث خطأ أثناء حذف السؤال",
        TransManager.statistics: "الإحصائيات",
        TransManager.loggedOut: "تم تسجيل الخروج",
        TransManager.delete: "حذف",
        TransManager.edit: "تعديل",
        TransManager.deleteCategory: "حذف التصنيف",
        TransManager
                .whenDeletingThisCategoryAllQuestionsThatsLinkedToItWillBeRemoved:
            "عند حذف هذا التصنيف سيتم حذف جميع الأسئلة المرتبطة به",
        TransManager.deleteQuestion: "حذف السؤال",
        TransManager.areYouSureYouWantToDeleteThisQuestion:
            "هل أنت متأكد أنك تريد حذف هذا السؤال؟",
        TransManager.copiedToClipboard: "تم النسخ إلى الحافظة",
        TransManager.cancel: "إلغاء",
        TransManager.send: "إرسال",
        TransManager.contactNumber: "رقم الهاتف",
        TransManager.youCanContactUs: "يمكنك التواصل معنا",
        TransManager.throughTheFollowingContact: "عبر طرق الاتصال التالية",
        TransManager.email: "البريد الإلكتروني",
        TransManager.website: "الموقع الإلكتروني",
        TransManager.privacyPolicyContent: """
بنود وشروط استخدام تطبيق أسئلة صراحة
مرحبا بك في تطبيق أسئلة صراحة. عند استخدام هذا التطبيق، فإنك توافق على الشروط والأحكام التالية:

1. اللغة والسلوك:
- يجب على المستخدمين استخدام لغة لائقة ومحترمة.
- نحن نحتفظ بالحق في إزالة المحتوى الذي نعتبره غير مناسب.
2. الأمان والخصوصية:
- نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية ومعلوماتك.
- ننصح بعدم مشاركة معلوماتك الشخصية مع الآخرين.
3. المحتوى:
- نحتفظ بحق إزالة أو تعديل المحتوى الذي ينتهك هذه البنود.
- المحتوى الذي تم نشره يعبر عن آراء المستخدمين وليس ضرورة رأي التطبيق.
4. إنهاء الحساب:
- يعكن المستخدم طلب إنهاء حسابة في اى وق جنال مخالفة لهذه البينون.
5. دعم وتواصل:
- إذا كان لديك استفسارات أو مشكلات، يرجى الاتصال بفريق الدعم عبر [عنوان البريد الإلكتروني].
نأمل منك قراءة هذه البنود بعناية والامتثال لها أثناء استخدام تطبيق أسئلة صراحة. إذا كنت غير موافق على هذه البنود، فيرجى عدم استخدام التطبيق.
تاكد من تضمين معلومات الاتصال الخاصة بفريق الدعم الخاص بك في النص الفعلي لبنود وشروط الاستخدام.
 """,
      };
}
