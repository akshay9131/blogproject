import 'package:blogproject/views/widget/all_blog_widget.dart';
import 'package:blogproject/views/widget/suggetion_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blogproject/controller/upload_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(UploadConrtoller());

  @override
  void initState() {
    super.initState();
    controller.getBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.Blogs.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                "Bloggers Place",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      context.pushNamed("ProfileScreen");
                    },
                    icon: const Icon(
                      Icons.account_circle,
                      size: 30,
                      color: Colors.black,
                    ))
              ],
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                child: const Icon(Icons.add_to_photos_rounded,
                    color: Colors.white),
                onPressed: () {
                  context.pushNamed("AddBlogScreen");
                }),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/bloglogo.png"),
                    height: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoadingAnimationWidget.discreteCircle(
                      color: const Color.fromARGB(255, 19, 30, 39), size: 40),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Row(
              children: const [
                Image(
                  image: AssetImage("assets/images/bloglogo.png"),
                  height: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Bloggers Place",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    context.pushNamed("ProfileScreen");
                  },
                  icon: const Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.black,
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child:
                  const Icon(Icons.add_to_photos_rounded, color: Colors.white),
              onPressed: () {
                context.pushNamed("AddBlogScreen");
              }),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SuggetionWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  AllBlogsWidget()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
