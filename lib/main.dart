import 'package:blogproject/controller/auth_controller.dart';
import 'package:blogproject/firebase_options.dart';
import 'package:blogproject/views/screen/add_blog_screen.dart';
import 'package:blogproject/views/screen/category_list_screen.dart';
import 'package:blogproject/views/screen/category_view_screen.dart';
import 'package:blogproject/views/screen/detail_Screen.dart';
import 'package:blogproject/views/screen/home_screen.dart';
import 'package:blogproject/views/screen/profile_screen.dart';
import 'package:blogproject/views/screen/signup_screen.dart';
import 'package:blogproject/views/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:blogproject/views/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  static bool get isLoggedIn => false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<AuthController>();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routerConfig: router,
    );
  }

  final GoRouter router = GoRouter(
    
      initialLocation: "/",
      redirect: (context, state) {
        if (isLoggedIn && state.location.startsWith("/")) {
          return "/home";
        } else {
          return null;
        }
      },
      routes: [
        GoRoute(
            name: "SplashScreen",
            path: "/",
            builder: ((context, state) => const SplashScreen())),
        GoRoute(
            name: "LogInScreen",
            path: "/login",
            builder: ((context, state) => LogInScreen())),
        GoRoute(
            name: "SignupScreen",
            path: "/signup",
            builder: ((context, state) => SignupScreen())),
        GoRoute(
            name: "HomeScreen",
            path: "/home",
            builder: ((context, state) => HomeScreen())),
        GoRoute(
            name: "AddBlogScreen",
            path: "/upload",
            builder: ((context, state) => AddBlogScreen())),
        GoRoute(
            name: "ProfileScreen",
            path: "/Profile",
            builder: ((context, state) => ProfileScreen())),
        GoRoute(
            name: "CategoryList",
            path: "/categorylist",
            builder: ((context, state) => CategoryList())),
        GoRoute(
            name: "DetailScreen",
            path: "/detail/:id",
            builder: ((context, state) =>
                DetailScreen(id: state.params["id"]!))),
        GoRoute(
            name: "CategoryView",
            path: "/category/:category",
            builder: ((context, state) =>
                CategoryView(category: state.params["category"]!))),
      ]);
}
