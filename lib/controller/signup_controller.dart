import 'package:blogproject/controller/auth_controller.dart';
import 'package:blogproject/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupController extends GetxController {
  final _googleSignin = GoogleSignIn();
  final controller = Get.put(AuthController());
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  final UsernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String id = nanoid(7);

  final db = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool?> registerUser(
      String email, String password, UserModel user) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        db.collection("users").add(user.toJson());
        FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            iosTitle: "Done",
            iosSubtitle: "Registered Successfully",
            androidToast: "Registered Successfully",
            toastDuration: 30,
            toastShowIcon: true);
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

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> getallUserDetails() async {
    final snapshot =
        await db.collection("users").get();
    final allUserData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return allUserData;
  }

  
  Future<bool?> googlelogin(UserModel user) async {
    try {
      googleAccount.value = await _googleSignin.signIn();
      db.collection("users").add(user.toJson());
       FlutterToastAlert.showToastAndAlert(
            type: Type.Success,
            iosTitle: "Done",
            iosSubtitle: "Registered Successfully",
            androidToast: "Registered Successfully",
            toastDuration: 30,
            toastShowIcon: true);
            controller.isLoggedIn(true);
        return true;
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

  

  googlelogout() async {
    googleAccount.value = await _googleSignin.signOut();
  }
}
