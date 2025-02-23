import 'package:e_commerce/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';
import '../../../../services/network_caller/network_caller.dart';
import '../../../common/ui/controllers/auth_controller.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = false;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? _token;
  String? get token=> _token;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(Urls.verifyOtpUrl(email, otp));
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responseData['data'];
      await Get.find<ReadProfileController>().readProfileData(token);
      if (Get.find<ReadProfileController>().getProfileModel == null) {
        //TODO: complete profile
        _shouldNavigateCompleteProfile = true;
      } else {
        await Get.find<AuthController>().saveUserData(
            token, Get.find<ReadProfileController>().getProfileModel!);
        _shouldNavigateCompleteProfile = false;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
