import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/widgets/app_drawer.dart';
import 'package:maklifeecommerce/app/utils/widgets/grid_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genmak Info India Limited'),
        centerTitle: true,
        actions: [
          Obx(() => CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.greenColor,
                // color: Colors.white,
                backgroundImage: controller.personPic != null &&
                        controller.personPic.path != null &&
                        controller.personPic.path != ""
                    ? Image.file(
                        File(controller.personPic.path),
                        fit: BoxFit.contain,
                      ).image
                    : Image.asset("assets/images/images.png").image,
              ))
        ],
      ),
      drawer: AppDrawer(),
      body: Column(children: [
        SizedBox(height: Get.height - 150, child: GridWidget()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brownColor,
              ),
              child: const Text("Save"),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.reddishColor,
              ),
              child: const Text("Cart"),
            )
          ],
        ),
      ]),
      // floatingActionButton:
    );
  }
}
