import 'package:e_commerce/features/auth/ui/screens/email_verification_screen.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/app_logo_widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AppLogoWidget(),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
