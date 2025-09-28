import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/create_password_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/forget_password_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/oTP_verification.dart';
import 'package:bookia/feature/auth/presentation/pages/forget_password/password_changed.dart';
import 'package:bookia/feature/auth/presentation/pages/login/login_screen.dart';
import 'package:bookia/feature/auth/presentation/pages/register/register_screen.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/details/pages/details_screen.dart';
import 'package:bookia/feature/main/presentation/pages/main_screen.dart';
import 'package:bookia/feature/profile/presentation/pages/edit_profile_screen.dart';
import 'package:bookia/feature/profile/presentation/pages/update_password_screen.dart';
import 'package:bookia/feature/search/presentation/pages/search_screen.dart';
import 'package:bookia/feature/splash/splash_screen.dart';
import 'package:bookia/feature/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  static final String main = '/main';
  static final String search = '/search';
  static final String details = '/details';
  static final String editProfile = '/editProfile';
  static final String resetPassword = '/resetPassword';

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
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: const ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: createPassword,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: const CreatePasswordScreen(),
        ),
      ),
      GoRoute(
        path: otpVerification,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: const OtpVerificationScreen(),
        ),
      ),
      GoRoute(
        path: passwordChanged,
        builder: (BuildContext context, GoRouterState state) =>
            const PasswordChanged(),
      ),
      GoRoute(
        path: main,
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
      GoRoute(
        path: search,
        builder: (BuildContext context, GoRouterState state) =>
            const SearchScreen(),
      ),
      GoRoute(
        path: details,
        builder: (BuildContext context, GoRouterState state) {
          var data = state.extra as Product;
          return BlocProvider(
            create: (BuildContext context) {
              return HomeCubit();
            },
            child: DetailsScreen(products: data),
          );
        },
      ),
      GoRoute(
        path: editProfile,
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfileScreen(),
      ),
      GoRoute(
        path: resetPassword,
        builder: (BuildContext context, GoRouterState state) =>
            const UpdatePasswordScreen(),
      ),
    ],
  );
}
