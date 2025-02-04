import 'package:e_commerce/features/auth/ui/controllers/email_verification_controller.dart';
import 'package:e_commerce/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../features/auth/ui/controllers/otp_verification_controller.dart';
import '../features/common/ui/controllers/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
  }
}
