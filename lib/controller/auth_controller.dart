import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class AuthController extends GetxController {

  static AuthController get instance => Get.find();
  RxBool isLoggedIn = false.obs;
  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    if (user == null) {
      isLoggedIn(false);
      
    }else{
      isLoggedIn(true);
    }
  }
}
