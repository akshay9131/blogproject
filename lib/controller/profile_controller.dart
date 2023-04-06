import 'package:blogproject/controller/auth_controller.dart';
import 'package:blogproject/controller/signup_controller.dart';
import 'package:get/get.dart';

class profileController extends GetxController {
  static profileController get instance => Get.find();

  final authCon = Get.put(AuthController());
  final userCon = Get.put(SignupController());

  getUserData() {
    final email = authCon.firebaseUser.value?.email;
    if (email != null) {
      return userCon.getUserDetails(email);
    } else {
      Get.snackbar("error", "login to continue");
    }
  }
}
