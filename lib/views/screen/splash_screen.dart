import 'package:blogproject/controller/signup_controller.dart';
import 'package:blogproject/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.put(SignupController());
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/bloglogo.png"),
                  height: 300,
                ),
                TextAnimator('Welcome To \n Bloggers Place',
                    incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontFamily: 'PlayfairDisplay',
                        letterSpacing: -2,
                        fontSize: 40)),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: InkWell(
                        onTap: () {
                          context.go("/login");
                        },
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 118, vertical: 18),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: InkWell(
                        onTap: () {
                          context.go("/signup");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.transparent),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 18),
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 4),
                    WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: InkWell(
                        onTap: () {
                          bool? goToNext = controller
                              .googlelogin(UserModel(
                                  id: controller.id,
                                  username:
                                      controller.UsernameController.text.trim(),
                                  email: controller.emailController.text.trim(),
                                  password: controller.passwordController.text
                                      .trim()))
                              .then((value) => context.go("/home")) as bool?;
                        },
                        child: Container(
                            color: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 18),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("assets/images/google.png"),
                                  height: 30,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "LOGIN WITH GOOGLE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
