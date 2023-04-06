import 'package:blogproject/controller/login_controller.dart';
import 'package:blogproject/controller/signup_controller.dart';
import 'package:blogproject/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final logcontroller = Get.put(SignupController());
  final logoutcontroller = Get.put(LoginController());
  final controller = Get.put(UploadConrtoller());
  @override
  void initState() {
    super.initState();
    asyncFunction();
  }

  Future<void> asyncFunction() async {
    await controller.getUserBlog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() {
          if (controller.getcurrentblog.isEmpty) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                image: AssetImage("assets/images/user.jpeg"))),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "${controller.getcurrentblog[0].author_name}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.pushNamed("CategoryList");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Color.fromARGB(
                                            141, 102, 101, 101)))),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.grid_view,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        color: Color.fromARGB(
                                            141, 102, 101, 101)))),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Account",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            logoutcontroller.logout(context);
                            logcontroller.googlelogout();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 18),
                            child: const Text(
                              "LOG OUT",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ))
                    ])));
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage("assets/images/user.jpeg"))),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "${controller.getcurrentblog[0].author_name}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.pushNamed("CategoryList");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    color:
                                        Color.fromARGB(141, 102, 101, 101)))),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.grid_view,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Category",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                    color:
                                        Color.fromARGB(141, 102, 101, 101)))),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.settings,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Account",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async{
                      logoutcontroller.logout(context);
                      context.go("/");
                      logcontroller.googlelogout();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                      child: const Text(
                        "LOG OUT",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                 Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "My Blogs",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.getcurrentblog.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed("DetailScreen", params: {
                                      "id":
                                          controller.Blogs[index].id.toString()
                                    });
                                  },
                                  child: Container(

                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              right: 10, left: 10),
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .getcurrentblog[index]
                                                      .image
                                                      .toString()),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${controller.getcurrentblog[index].title}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 7,
                                            ),
                                            SizedBox(
                                              width: 240,
                                              child: Text(
                                                controller
                                                            .getcurrentblog[
                                                                index]
                                                            .description!
                                                            .length >
                                                        20
                                                    ? "${controller
                                                            .getcurrentblog[
                                                                index]
                                                            .description!
                                                            .substring(0, 100)}..."
                                                    : controller
                                                        .getcurrentblog[index]
                                                        .description!,
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 6),
                                                    // ignore: sort_child_properties_last
                                                    child: Text(
                                                      "${controller.getcurrentblog[index].category}",
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                  ),
                                                  const SizedBox(
                                                    width: 70,
                                                  ),
                                                  const Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.black,
                                                  )
                                                ],
                                              ),
                                            
                                          ],
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(bottom: 20),
                                    height: 150,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(138, 243, 240, 240),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
