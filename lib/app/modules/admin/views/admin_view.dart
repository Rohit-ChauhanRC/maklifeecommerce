import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
import 'package:maklifeecommerce/app/utils/widgets/card_widget.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 50),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 200,
              ),
              itemCount: controller.gridList.length,
              itemBuilder: (_, i) {
                var grid = controller.gridList[i];
                return _constainer(
                  icon: grid["icon"],
                  title: grid["title"],
                  onTap: grid["onTap"],
                );
              })),
    );
  }

  Widget _constainer(
      {required IconData icon,
      required String title,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200,
        width: 200,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.creamColor1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 100,
              color: AppColors.brownColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: AppDimens.font28,
                color: AppColors.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
