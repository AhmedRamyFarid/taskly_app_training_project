import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly_app/core/di/dependency_injection.dart';
import 'package:taskly_app/core/routing/routes.dart';
import 'package:taskly_app/features/home/ui/home_screen.dart';
import 'package:taskly_app/features/login/logic/cubit/login_cubit.dart';
import 'package:taskly_app/features/login/ui/login_screen.dart';
import 'package:taskly_app/features/signup/logic/cubit/signup_cubit.dart';
import 'package:taskly_app/features/signup/ui/sign_up_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
