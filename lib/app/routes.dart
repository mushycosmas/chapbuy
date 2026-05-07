import 'package:flutter/material.dart';
import '../features/splash/screens/splash_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/account_type_screen.dart';
import 'package:chapbuy/features/auth/screens/login_screen.dart';
import 'package:chapbuy/features/auth/screens/forgot_password_screen.dart';
import '../features/home/screens/home_screen.dart';



// Add these routes to your existing routes
import 'package:flutter/material.dart';
import '../../../features/seller_homepage/screens/seller_dashboard_screen.dart';
import '../features/seller_homepage/screens/home_seller_screen.dart';
import '../../../features/seller_homepage/screens/rfp_screen.dart';
import '../../../features/seller_homepage/screens/account_screen.dart';

class AppRoutes {
  static const String sellerDashboard = '/seller-dashboard';
  static const String orders = '/orders';
  static const String rfp = '/rfp';
  static const String account = '/account';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case sellerDashboard:
        return MaterialPageRoute(builder: (_) => const SellerDashboardScreen());
      // case orders:
      //   return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case rfp:
        return MaterialPageRoute(builder: (_) => const RfpScreen());
      case account:
        return MaterialPageRoute(builder: (_) => const AccountScreen());
      default:
        return null;
    }
  }
}






Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/onboarding': (context) => const OnboardingScreen(),
  '/register': (context) => const RegisterScreen(),
  '/account-type': (context) => const AccountTypeScreen(),
  '/login': (context) => const LoginScreen(),
  '/forgot-password': (context) => const ForgotPasswordScreen(),
  '/home': (context) => const HomeScreen(),


};