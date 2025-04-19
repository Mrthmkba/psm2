import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/dashboard/main_page.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();


  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const MainPage()): Get.back();
  }
}
