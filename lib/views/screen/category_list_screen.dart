import 'package:blogproject/views/widget/categorytab_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Category",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            CategoryWidget(title: "Sports", icon: Icons.abc),
            const SizedBox(height: 10,),
            CategoryWidget(title: "Fashion", icon: Icons.design_services,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "Movies", icon: Icons.movie_creation,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "Music", icon: Icons.queue_music,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "Politics", icon: Icons.flag_circle,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "PhotoGraphy", icon: Icons.camera_alt_rounded,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "LifeStyle", icon: Icons.nature_people_rounded,),
            const SizedBox(height: 10,),
            CategoryWidget(title: "News", icon: Icons.newspaper_outlined,),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    ));
  }
}
