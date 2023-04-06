import 'package:blogproject/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:page_indicator/page_indicator.dart';

class SuggetionWidget extends StatelessWidget {
  SuggetionWidget({super.key});

  final blogController = Get.put(UploadConrtoller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recommended Blogs",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 400,
                child: PageIndicatorContainer(
                    align: IndicatorAlign.bottom,
                    indicatorSpace: 8,
                    padding: const EdgeInsets.all(5),
                    indicatorColor: Colors.grey,
                    indicatorSelectorColor: Colors.amber,
                    shape: IndicatorShape.oval(),
                    length: blogController.Blogs.take(5).length,
                    child: PageView.builder(
                        itemCount: blogController.Blogs.take(5).length,
                        itemBuilder: (context, index) {
                          return Stack(children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: NetworkImage(blogController
                                          .Blogs[index].image
                                          .toString()),
                                      fit: BoxFit.cover)),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.pushNamed("DetailScreen" ,params: {
                                  "id":blogController.Blogs[index].id.toString()
                                } );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(1.0),
                                          Colors.black.withOpacity(0.0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: const [0.0, 0.9])),
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                child: Container(
                                    padding:
                                        const EdgeInsets.only(left: 10, right: 10),
                                    width: 250,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            blogController.Blogs[index].title
                                                .toString(),
                                            style: const TextStyle(
                                                height: 1.5,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ])))
                          ]);
                        }))),
          ],
        ));
  }
}
