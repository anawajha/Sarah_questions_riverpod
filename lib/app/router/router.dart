import 'package:get/get.dart';
import 'package:sarahah_questions/app/bindings/bindings.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/middleware/login_middleware.dart';
import 'package:sarahah_questions/presentation/middleware/splash_middleware.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/add_category/add_category_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/add_question/add_new_question_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/manage_categories/manage_categories_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/admin/manage_questions/manage_questions_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/home_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/questions/questions_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/login/login_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/general/about_us/about_us_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/splash/splash_screen.dart';

class AppRouter {
  static final AppRouter router = AppRouter._internal();
  AppRouter._internal();

  final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      middlewares: [SplashMiddleware()],
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      middlewares: [LoginMiddleware()],
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.manageCategories,
      page: () => const ManageCategoriesScreen(),
      binding: ManageCategoriesBinding()
    ),
    GetPage(
      name: Routes.addNewCategory,
      page: () => const AddNewCategoryScreen(),
      binding: AddNewCategoryBinding()
    ),
    GetPage(
      name: Routes.manageQuestions,
      page: () => const ManageQuestionsScreen(),
      binding: ManageQuestionsBinding()
    ),
    GetPage(
      name: Routes.addNewQuestion,
      page: () => const AddNewQuestionScreen(),
      binding: AddNewQuestionBinding()
    ),
    GetPage(
      name: Routes.aboutUs,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: Routes.questions,
      page: () => const QuestionsScreen(),
      binding: QuestionsBinding()
    ),
  ];
}
