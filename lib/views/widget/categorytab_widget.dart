import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  IconData? icon;
   CategoryWidget({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed("CategoryView", params: {"category": title}),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Color.fromARGB(141, 102, 101, 101)))),
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
               Icon(
                icon,
                color: Colors.black,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
