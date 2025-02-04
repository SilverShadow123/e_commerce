class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';
  static String verifyEmailUrl(String email) =>
      'http://35.73.30.144:2005/api/v1/RecoverVerifyEmail/$email';
  static String verifyOtpUrl(String email, String otp) =>
      'http://35.73.30.144:2005/api/v1/RecoverVerifyOtp/$email/$otp';
}
