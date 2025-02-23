import 'dart:async';
import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/app_const.dart';
import 'package:e_commerce/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:e_commerce/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:e_commerce/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo_widgets.dart';
import 'package:e_commerce/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:e_commerce/features/common/ui/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static const String name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConst.resendOtpTimeOutInSec.obs;
  late Timer timer;
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    _remainingTime.value = AppConst.resendOtpTimeOutInSec;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (t) {
        _remainingTime.value--;
        if (_remainingTime.value == 0) {
          t.cancel();
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

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
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 digit otp has been send to your email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(
                    milliseconds: 300,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveColor: AppColors.themeColor,
                    activeFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  controller: _otpTEController,
                  validator: (String? value) {
                    if (value?.length != 6) {
                      return 'Enter your OTP';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<OtpVerificationController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text(
                      'Next',
                    ),
                  );
                }),
                const SizedBox(
                  height: 24,
                ),
                //TODO: enable button when 120s button is done and invisible the text
                // stream, timer(setState), getx(obs)
                Obx(
                  () => RichText(
                    text: TextSpan(
                      text: 'This code will be expire in ',
                      style: const TextStyle(color: Colors.greenAccent),
                      children: [
                        TextSpan(
                          text: '${_remainingTime}s',
                          style: const TextStyle(color: AppColors.themeColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => TextButton(
                    onPressed: _remainingTime.value != 0
                        ? null
                        : () {
                            _startResendCodeTimer();
                            //print('resend codes working');
                          },
                    child: const Text('Resend Code'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      final bool response = await _otpVerificationController.verifyOtp(
        widget.email,
        _otpTEController.text,
      );
      if (response) {
        if (_otpVerificationController.shouldNavigateCompleteProfile) {
          if (mounted) {
            Navigator.pushNamed(
              context,
              CompleteProfileScreen.name,
            );
          }
        } else {
          if (mounted) {
            Navigator.pushNamedAndRemoveUntil(
                context, MainBottomNavScreen.name, (predicate) => false);
          }
        }
      }
        else {
          if (mounted) {
            showSnackBarMessage(
                context, _otpVerificationController.errorMessage!);
          }
        }
      }
    }
  }

