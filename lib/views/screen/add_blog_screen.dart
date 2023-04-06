import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:blogproject/controller/upload_controller.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final controller = Get.put(UploadConrtoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Upload Your Blog",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Obx(() {
              return Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.chooseImage();
                      },
                      child: controller.imageFile == null
                          ? Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(163, 101, 100, 100)),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Icon(
                                  Icons.add_photo_alternate_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            )
                          : Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          FileImage(controller.imageFile.value),
                                      fit: BoxFit.cover),
                                  border: Border.all(
                                      color:
                                         const Color.fromARGB(163, 101, 100, 100)),
                                  borderRadius: BorderRadius.circular(8)),
                            )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controller.titleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Title", label: Text("title")),
                  ),
                  TextFormField(
                    controller: controller.descriptionController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Description", label: Text("Description")),
                  ),
                  TextFormField(
                    controller: controller.dateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        controller.dateController.text =
                            DateFormat('MM/dd/yyyy').format(date);
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Date", label: Text("DD/MM/YYYY")),
                  ),
                  DropdownButton2(
                    hint: Text(
                      'Select Category',
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.categories
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        controller.selectedValue = value as String;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      height: 80,
                      width: 400,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () async {
                        await controller.uploadImage().then((value) => context.go("/home"));
                        // context.go("/home",);
                      },
                      child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 18),
                          child: const Text(
                            "UPLOAD BLOG",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ))),
                ],
              );
            }),
          ),
        ));
  }
}
