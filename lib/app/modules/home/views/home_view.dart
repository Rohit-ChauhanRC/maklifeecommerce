import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
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
        SizedBox(height: Get.height / 2, child: GridWidget()),
        Container(
          height: Get.height / 3,
          // color: Colors.black,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.blackColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Text(
                  "Order",
                  style: TextStyle(
                    fontSize: AppDimens.font24,
                    color: AppColors.brownColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Container(
                height: Get.height / 4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blackColor,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height / 5,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (ctx, i) {
                          return Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.remove_circle_outline,
                                        color: AppColors.reddishColor,
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        " ${i + 1}",
                                        style: TextStyle(
                                          fontSize: AppDimens.font24,
                                          color: AppColors.brownColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        Icons.add_circle_outlined,
                                        color: AppColors.brownColor,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 2.7,
                                  child: Text(
                                    "Product${i + 1}",
                                    overflow: TextOverflow.visible,
                                    style: TextStyle(
                                      fontSize: AppDimens.font24,
                                      color: AppColors.brownColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width / 6,
                                  child: Text(
                                    "₹${100 * i}",
                                    style: TextStyle(
                                      fontSize: AppDimens.font24,
                                      color: AppColors.brownColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      // color: Colors.blue,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount",
                            style: TextStyle(
                              fontSize: AppDimens.font24,
                              color: AppColors.brownColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹5000/-",
                            style: TextStyle(
                              fontSize: AppDimens.font24,
                              color: AppColors.brownColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
