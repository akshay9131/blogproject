import 'package:blogproject/controller/signup_controller.dart';
import 'package:blogproject/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoastalert/FlutterToastAlert.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(),
                  child: const Image(
                    image: AssetImage("assets/images/bloglogo.png"),
                    height: 250,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAnimator('Welcome to \n\n Bloggers Place',
                        incomingEffect:
                            WidgetTransitionEffects.incomingScaleUp(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: -2,
                            fontSize: 40)),
                    const SizedBox(
                      height: 4,
                    ),
                    TextAnimator('Create Your Account',
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
                  height: 50,
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromBottom(),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Username";
                              }
                              return null;
                            },
                            controller: controller.UsernameController,
                            decoration: InputDecoration(
                                label: const Text("Username"),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Username",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
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
                                    borderSide:
                                        const BorderSide(color: Colors.black))),
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
                                    borderSide:
                                        const BorderSide(color: Colors.black))),
                          ),
                          const SizedBox(
                            height: 10,
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
                          bool? goToNext = controller
                              .registerUser(
                                  controller.emailController.text.trim(),
                                  controller.passwordController.text.trim(),
                                  UserModel(
                                      id: controller.id,
                                      username: controller
                                          .UsernameController.text
                                          .trim(),
                                      email: controller.emailController.text
                                          .trim(),
                                      password: controller
                                          .passwordController.text
                                          .trim()))
                              .then((value) => context.go("/home")) as bool?;
                          if (goToNext != null) {
                            context.go('/home');
                          }
                        }
                      },
                      child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 18),
                          child: const Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have an Account?"),
                    TextButton(
                        onPressed: () {
                          context.go("/login");
                        },
                        child: const Text(
                          "LogIn",
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
