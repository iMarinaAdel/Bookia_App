import 'package:bookia/feature/auth/presentation/pages/forget_password/create_password_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/login/login_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/oTP_verification.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/password_changed.dart';
import 'package:bookia/feature/auth/presentation/pages/register/register_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final String splash = '/';
  static final String welcome = '/welcome';
  static final String login = '/login';
  static final String register = '/register';
  static final String createPassword = '/createPassword';
  static final String forgetPassword = '/forgetPassword';
  static final String otpVerification = '/otpVerification';
  static final String passwordChanged = '/passwordChanged';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
      ),
      GoRoute(
        path: register,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterScreen(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (BuildContext context, GoRouterState state) =>
            const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: createPassword,
        builder: (BuildContext context, GoRouterState state) =>
            const CreatePasswordScreen(),
      ),
      GoRoute(
        path: otpVerification,
        builder: (BuildContext context, GoRouterState state) =>
            const OtpVerification(),
      ),
      GoRoute(
        path: passwordChanged,
        builder: (BuildContext context, GoRouterState state) =>
            const PasswordChanged(),
      ),
    ],
  );
}
