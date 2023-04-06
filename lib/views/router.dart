import 'package:blogproject/views/screen/add_blog_screen.dart';
import 'package:blogproject/views/screen/category_list_screen.dart';
import 'package:blogproject/views/screen/category_view_screen.dart';
import 'package:blogproject/views/screen/detail_Screen.dart';
import 'package:blogproject/views/screen/home_screen.dart';
import 'package:blogproject/views/screen/login_screen.dart';
import 'package:blogproject/views/screen/profile_screen.dart';
import 'package:blogproject/views/screen/signup_screen.dart';
import 'package:blogproject/views/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class MyAppRoutingConfig {
  static GoRouter returnRouter(bool isLoggedIn) {
    GoRouter router = GoRouter(
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

    return router;
  }
}
