import 'package:blogproject/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final controller = Get.put(AuthController());

  final UsernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> LoginUser(
      String email, String password, BuildContext ctx) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            iosTitle: "Done",
            iosSubtitle: "Login Successfully",
            androidToast: "Login Successfully",
            toastDuration: 30,
            toastShowIcon: true);
        ctx.go("/home");
        controller.isLoggedIn(true);
        return true;
      });
    } on FirebaseAuthException catch (e) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "error",
          iosSubtitle: e.toString(),
          androidToast: e.toString(),
          toastDuration: 3,
          toastShowIcon: true);
    } catch (e) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Error,
          iosTitle: "error",
          iosSubtitle: e.toString(),
          androidToast: e.toString(),
          toastDuration: 3,
          toastShowIcon: true);
    }
  }

  void logout(context) async {
    await auth.signOut();
  }
}
