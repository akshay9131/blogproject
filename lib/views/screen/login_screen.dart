import 'package:blogproject/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetAnimator(
                  incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                  child: const Image(
                    image: AssetImage("assets/images/bloglogo.png"),
                    height: 300,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAnimator('Welcome Back To \n Bloggers Place',
                        incomingEffect:
                            WidgetTransitionEffects.incomingScaleUp(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: -2,
                            fontSize: 30)),
                    const SizedBox(
                      height: 4,
                    ),
                    TextAnimator('Login Your Account',
                        incomingEffect:
                            WidgetTransitionEffects.incomingScaleDown(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 33, 33, 33),
                            letterSpacing: 0,
                            fontSize: 10)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                WidgetAnimator(
                  incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                            controller: controller.emailController,
                            decoration: InputDecoration(
                                label: const Text("Email Address"),
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Email Address",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                                label: const Text("Password"),
                                prefixIcon: const Icon(
                                  Icons.password,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      )),
                ),
                WidgetAnimator(
                  incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                  child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.LoginUser(
                              controller.emailController.text.trim(),
                              controller.passwordController.text.trim(),
                              context
                              );
                        }
                      },
                      child: Container(
                          color: Colors.black,
                          padding:
                              const EdgeInsets.symmetric(horizontal: 118, vertical: 18),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have Account?"),
                    TextButton(
                        onPressed: () {
                          context.go("/signUp");
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
