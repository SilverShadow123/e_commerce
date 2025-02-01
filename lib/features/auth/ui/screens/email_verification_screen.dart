import 'package:e_commerce/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:e_commerce/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo_widgets.dart';
import 'package:e_commerce/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:e_commerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EmailVerificationController _emailVerificationController =
      Get.find<EmailVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text('Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Email Address';
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return 'Enter a Valid Email Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<EmailVerificationController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenterCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _emailVerificationController
          .verifyEmail(_emailTEController.text.trim());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, OtpVerificationScreen.name);
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
              context, _emailVerificationController.errorMessage!);
        }
      }
    }
  }
}
