import 'package:blogproject/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  String? id;
  DetailScreen({super.key, this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final controller = Get.find<UploadConrtoller>();
  @override
  void initState() {
    super.initState();
    asyncFunction(widget.id);
  }

  Future<void> asyncFunction(id) async {
    await controller.getsingleBlog(id);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "${controller.getsingleBlogs[0].title}",
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            controller.getsingleBlogs[0].image.toString()),
                        fit: BoxFit.cover),
                    border:
                        Border.all(color: const Color.fromARGB(163, 101, 100, 100)),
                    borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${controller.getsingleBlogs[0].title}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(141, 102, 101, 101)))),
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Row(
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
                      margin: const EdgeInsets.only(top: 6, bottom: 6, right: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Posted by",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 117, 116, 116)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${controller.getsingleBlogs[0].author_name}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                // ignore: sort_child_properties_last
                child: Text(
                  "${controller.getsingleBlogs[0].category}",
                  style: const TextStyle(color: Colors.black),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                height: 10,
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
                    "${controller.getsingleBlogs[0].date}",
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 440,
                child: Text(
                  "${controller.getsingleBlogs[0].description}",
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      );
    });
  }
}
