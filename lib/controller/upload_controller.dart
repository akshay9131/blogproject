import 'dart:io';

import 'package:blogproject/controller/auth_controller.dart';
import 'package:blogproject/controller/signup_controller.dart';
import 'package:blogproject/model/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nanoid/nanoid.dart';

class UploadConrtoller extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final categaryController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final dateController = TextEditingController();
  final userCon = Get.put(SignupController());
  final authCon = Get.put(AuthController());

  final List<String> categories = [
    'Sports',
    'Fashion',
    'Movies',
    'Music',
    'Politics',
    'Photography',
    'Lifestyle',
    'News',
  ];
  String? selectedValue;
  String blog_id = nanoid(7);
  final isLoading = false;

  final imageFile = File("").obs;
  ImagePicker imagePicker = ImagePicker();

  // UploadConrtoller(String id);

  Future<void> chooseImage() async {
    await imagePicker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        imageFile.value = File(value.path);
      }
    });
  }

  Future<void> uploadImage() async {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child("images").child(imageFileName);

    final UploadTask uploadTask = storageReference.putFile(imageFile.value);

    await uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imageUrl) async {
        await saveData(
            imageUrl,
            BlogModel(
                image: imageUrl.toString(),
                description: descriptionController.text.trim(),
                title: titleController.text.trim(),
                category: selectedValue.toString(),
                date: dateController.text.trim(),
                id: blog_id,
                author_id: auth.currentUser!.uid,
                author_name: auth.currentUser!.email.toString().split("@")[0],));
      });
    }).catchError((error) {
      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          iosTitle: error.toString(),
          iosSubtitle: error.toString(),
          androidToast: error.toString(),
          toastDuration: 30,
          toastShowIcon: true);
    });
  }

  Future<void> saveData(String imageUrl, BlogModel blog) async {
    try {
      await FirebaseFirestore.instance.collection("Blogs").add(blog.toJson());
      FlutterToastAlert.showToastAndAlert(
          type: Type.Success,
          iosTitle: "Done",
          iosSubtitle: "Blog Uploaded Successfully",
          androidToast: "Blog Uploaded Successfully",
          toastDuration: 30,
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

  final Blogs = <BlogModel>[].obs;
  final getsingleBlogs = <BlogModel>[].obs;
  final getcurrentblog = <BlogModel>[].obs;
  final getcategoryblog = <BlogModel>[].obs;

  void getBlog() async {
    final snapshot = await FirebaseFirestore.instance.collection("Blogs").get();
    final blog = snapshot.docs.map((e) => BlogModel.fromSnapshot(e)).toList();
    Blogs.value = blog;
  }


  Future<void> getsingleBlog(String id) async {
    getsingleBlogs.value = Blogs.where((element) => element.id == id).toList();
    print(getsingleBlogs);
  }

  Future<void> getUserBlog() async {
    getcurrentblog.value =
          Blogs.where((element) => element.author_id == auth.currentUser!.uid)
              .toList();
  }

  Future<void> getCategoriesBlog(String category) async {
    getcategoryblog.value =
          Blogs.where((element) => element.category == category)
              .toList();
  }


  void getcurrntuserBlog(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Blogs")
        .where("author_id", isEqualTo: uid)
        .get();
    final singleBlog =
        snapshot.docs.map((e) => BlogModel.fromSnapshot(e)).toList();
    getcurrentblog.value = singleBlog;
  }

  void deleteBlog(String id) async {
    await FirebaseFirestore.instance
        .collection('Blog')
        .doc(id)
        .delete();
  }

}
