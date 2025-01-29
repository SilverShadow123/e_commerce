import 'package:e_commerce/app/app_theme_data.dart';
import 'package:e_commerce/app/controller_binder.dart';
import 'package:e_commerce/features/Catagory/UI/Screens/catagory_list_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/splash_screen.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce/features/product/ui/screens/product_details_screen.dart';
import 'package:e_commerce/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/ui/screens/email_verification.dart';
import '../features/product/ui/screens/product_list_screen.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      initialBinding: ControllerBinder(),
      onGenerateRoute: (RouteSettings settings) {
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == EmailVerification.name) {
          widget = const EmailVerification();
        } else if (settings.name == OtpVerificationScreen.name) {
          widget = const OtpVerificationScreen();
        } else if (settings.name == CompleteProfileScreen.name) {
          widget = const CompleteProfileScreen();
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CatagoryListScreen.name) {
          widget = const CatagoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          String name = settings.arguments as String;
          widget = ProductListScreen(
            catagoryName: name,
          );
        } else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(
            productId: productId,
          );
        }
        return MaterialPageRoute(builder: (ctx) => widget);
      },
    );
  }
}
