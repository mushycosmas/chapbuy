import 'package:flutter/material.dart';

// Core flow
import '../features/splash/screens/splash_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/account_type_screen.dart';
import 'package:chapbuy/features/auth/screens/login_screen.dart';
import 'package:chapbuy/features/auth/screens/forgot_password_screen.dart';

// Main app
import '../features/home/screens/home_screen.dart';
import '../features/navigation/main_bottom_nav_screen.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/onboarding': (context) => const OnboardingScreen(),

  '/register': (context) => const RegisterScreen(),
  '/account-type': (context) => const AccountTypeScreen(),
  '/login': (context) => const LoginScreen(),
  '/forgot-password': (context) => const ForgotPasswordScreen(),

  '/home': (context) => const HomeScreen(),
};