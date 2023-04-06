import 'package:blogproject/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CategoryView extends StatefulWidget {
  String? category;
  CategoryView({super.key, this.category});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final controller = Get.find<UploadConrtoller>();
  @override
  void initState() {
    super.initState();
    asyncFunction(widget.category);
  }

  Future<void> asyncFunction(category) async {
    await controller.getCategoriesBlog(category);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(8.0),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.getcategoryblog.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                               
                                  context.pushNamed("DetailScreen", params: {
                                    "id": controller.getcategoryblog[index].id.toString()
                                  });
                                
                              },
                              child: Container(
                                // ignore: sort_child_properties_last
                                child:  Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10, left: 10),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(controller.getcategoryblog[index].image
                                                  .toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "${controller.getcategoryblog[index].title}",
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
                                            controller.getcategoryblog[index].description!
                                                        .length >
                                                    20
                                                ? "${controller.getcategoryblog[index].description!
                                                        .substring(0, 100)}..."
                                                : controller.getcategoryblog[index].description!,
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
                                                  "${controller.getcategoryblog[index].category}",
                                                  style:
                                                      const TextStyle(color: Colors.black),
                                                ),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(4)),
                                              ),
                                              const SizedBox(
                                                width: 70,
                                              ),
                                              Row(
                                                children:[
                                                  const Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "${controller.getcategoryblog[index].date}",
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
                                    color:const Color.fromARGB(138, 243, 240, 240),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        );
                      }),
                ],
              ),
        ),
      ),
    ));
  }
}
