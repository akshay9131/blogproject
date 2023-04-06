import 'package:blogproject/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AllBlogsWidget extends StatefulWidget {
  const AllBlogsWidget({super.key});

  @override
  State<AllBlogsWidget> createState() => _AllBlogsWidgetState();
}

class _AllBlogsWidgetState extends State<AllBlogsWidget> {
  final blogController = Get.put(UploadConrtoller());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "All Blogs",
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
                itemCount: blogController.Blogs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed("DetailScreen", params: {
                            "id": blogController.Blogs[index].id.toString()
                          });
                        },
                        child: Container(
                          // ignore: sort_child_properties_last
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 10, left: 10),
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(blogController
                                            .Blogs[index].image
                                            .toString()),
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${blogController.Blogs[index].title}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // InkWell(
                                      //     onTap: () {
                                      //       blogController.deleteBlog(
                                      //           blogController.Blogs[index].id
                                      //               .toString());
                                      //     },
                                      //     child: Icon(
                                      //       Icons.delete_sweep_outlined,
                                      //       color: Colors.black,
                                      //     ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  SizedBox(
                                    width: 240,
                                    child: Text(
                                      blogController.Blogs[index].description!
                                                  .length >
                                              20
                                          ? "${blogController.Blogs[index].description!.substring(0, 100)}..."
                                          : blogController
                                              .Blogs[index].description!,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 6),
                                        // ignore: sort_child_properties_last
                                        child: Text(
                                          "${blogController.Blogs[index].category}",
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                      ),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range_outlined,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${blogController.Blogs[index].date}",
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
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
                              color: const Color.fromARGB(138, 243, 240, 240),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  );
                }),
          ],
        ));
  }
}
