import 'package:get/get.dart';
import 'package:sarahah_questions/app/bindings/bindings.dart';
import 'package:sarahah_questions/app/router/routes.dart';
import 'package:sarahah_questions/presentation/middleware/login_middleware.dart';
import 'package:sarahah_questions/presentation/middleware/register_middleware.dart';
import 'package:sarahah_questions/presentation/middleware/settings_middleware.dart';
import 'package:sarahah_questions/presentation/middleware/splash_middleware.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/forget_password/forget_password_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/login/login_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/register/register_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/reset_password/reset_password_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/auth/verify_code/verify_code_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/general/about_us/about_us_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/general/help_center_and_support/help_center_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/change_password/change_password_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/settings/settings_screen.dart';
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
      name: Routes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      middlewares: [RegisterMiddleware()],
    ),

    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
      middlewares: [SettingsMiddleware()],
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: Routes.helpCenter,
      page: () => const HelpCenterScreen(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: Routes.aboutUs,
      page: () => const AboutUsScreen(),
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => const VerifyCodeScreen(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
  ];
}
