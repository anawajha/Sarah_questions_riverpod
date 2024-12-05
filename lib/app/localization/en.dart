import 'package:sarahah_questions/app/localization/trans_manager.dart';

class En implements TransManager {
  static final En singleton = En._internal();
  En._internal();
  Map<String, String> get keys => {
        TransManager.thereIsNoOptionsFound: "There is no options found",
        TransManager.loading: "Loading...",
        TransManager.login: "Login",
        TransManager.username: "Username",
        TransManager.password: "Password",
        TransManager.phoneNumber: "Phone number",
        TransManager.emailAddress: "Email address",
        TransManager.gallery: "Gallery",
        TransManager.camera: "Camera",
        TransManager.pickImage: "Pick image",
        TransManager.invalidEmail: "Invalid email address",
        TransManager.weakPassword: "Weak password",
        TransManager.invalidUsername: "Invalid username",
        TransManager.resetPasswordHintPart1:
            "Please enter your email address to complete the ",
        TransManager.resetPasswordHintPart3: "process",
        TransManager.continue_: "Continue",
        TransManager.pleaseWait: "Please wait...",
        TransManager.pleaseEnterValidEmail: "Please enter valid email",
        TransManager.requiredField: "Required field",
        TransManager.passwordMustBeAtLeast6Characters:
            "Password must be at least 6 characters",
        TransManager.home: "Home",
        TransManager.myProfile: "My profile",
        TransManager.saveChanges: "Save changes",
        TransManager.settings: "Settings",
        TransManager.helpAndSupportCenter: "Help and support center",
        TransManager.aboutUs: "About us",
        TransManager.logout: "Logout",
        TransManager.arabic: "Arabic",
        TransManager.english: "English",
        TransManager.darkMode: "Dark mode",
        TransManager.lightMode: "Light mode",
        TransManager.systemMode: "System mode",
        TransManager.language: "Language",
        TransManager.theme: "Theme",
        TransManager.howCanWeHelpYou: "How can we help you?",
        TransManager.weAreHereAllTheTimeToMeetYourWishesAndSolveYourProblems:
            "We are here all the time to meet your wishes and solve your problems",
        TransManager.topicTitle: "Topic title",
        TransManager.topic: "Topic",
        TransManager.writeTopicHere: "write topic here...",
        TransManager.topicIsRequired: "Topic is required",
        TransManager.topicTitleIsRequired: "Topic title is required",
        TransManager.cancel: "Cancel",
        TransManager.appName: "ٍSarahah Questions",
        TransManager.contactUs: "contactUs",
        TransManager.privacyPolicy: "Privacy policy",
        TransManager.rateUs: "rateUs",
        TransManager.ourApps: "ourApps",
        TransManager.adminLogin: "adminLogin",
        TransManager.addNew: "addNew",
        TransManager.questionText: "questionText",
        TransManager.enterQuestionTextHere: "enterQuestionTextHere",
        TransManager.add: "add",
        TransManager.questions: "questions",
        TransManager.wrongEmailOrPassword: "wrongEmailOrPassword",
        TransManager.addNewCategory: "addNewCategory",
        TransManager.categoryName: "categoryName",
        TransManager.selectCategory: "selectCategory",
        TransManager.addNewQuestion: "addNewQuestion",
        TransManager.editProfile: "editProfile",
        TransManager.somethingWentWrong: "somethingWentWrong",
        TransManager.questionAddedSuccessfully: "questionAddedSuccessfully",
        TransManager.youMustSelectCategory: "youMustSelectCategory",
        TransManager.youMustEnterCategoryName: "youMustEnterCategoryName",
        TransManager.youMustEnterTheQuestion: "youMustEnterTheQuestion",
        TransManager.categories: "categories",
        TransManager.manageCategories: "manageCategories",
        TransManager.categoryDeletedSuccessfully: "categoryDeletedSuccessfully",
        TransManager.errorWhileDeletingCategory: "errorWhileDeletingCategory",
        TransManager.questionDeletedSuccessfully: "questionDeletedSuccessfully",
        TransManager.errorWhileDeletingQuestion: "errorWhileDeletingQuestion",
        TransManager.statistics: "statistics",
        TransManager.loggedOut: "LoggedOut",
        TransManager.delete: "delete",
        TransManager.edit: "edit",
        TransManager.deleteCategory: "deleteCategory",
        TransManager
                .whenDeletingThisCategoryAllQuestionsThatsLinkedToItWillBeRemoved:
            "whenDeletingThisCategoryAllQuestionsThatsLinkedToItWillBeRemoved",
        TransManager.deleteQuestion: "deleteQuestion",
        TransManager.areYouSureYouWantToDeleteThisQuestion:
            "areYouSureYouWantToDeleteThisQuestion",
        TransManager.copiedToClipboard: "copiedToClipboard",
        TransManager.cancel: "cancel",
        TransManager.send: "send",
        TransManager.contactNumber: "Phone number",
        TransManager.youCanContactUs: "You can contact us",
        TransManager.throughTheFollowingContact:
            "Through the following contact ways",
        TransManager.email: "Email",
        TransManager.website: "Website",
        TransManager.privacyPolicyContent: """
Terms and Conditions of Use for Saraha Questions App

Welcome to the Saraha Questions App. By using this app, you agree to the following terms and conditions:

1. Language and Conduct:
   - Users must use appropriate and respectful language.
   - We reserve the right to remove content that we deem inappropriate.

2. Security and Privacy:
   - We respect your privacy and are committed to protecting your personal data and information.
   - We advise against sharing your personal information with others.

3. Content:
   - We reserve the right to remove or modify content that violates these terms.
   - Published content reflects the opinions of users and not necessarily the opinion of the app.

4. Account Termination:
   - Users may request to terminate their accounts at any time in case of violations of these terms.

5. Support and Contact:
   - If you have any questions or issues, please contact the support team via [email address].

We hope you read these terms carefully and comply with them while using the Saraha Questions App. If you do not agree to these terms, please do not use the app. 

Make sure to include the contact information for your support team in the actual text of the terms and conditions.

""",
        TransManager.controllTextSize: "Controll text size",
        TransManager.category: "Categories",
        TransManager.question: "Question",

      };
}
