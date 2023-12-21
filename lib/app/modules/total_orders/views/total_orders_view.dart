import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';

import '../controllers/total_orders_controller.dart';

class TotalOrdersView extends GetView<TotalOrdersController> {
  const TotalOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Orders'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.blackColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteColor,
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invoice Id:",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.reddishColor,
                          ),
                        ),
                        Text(
                          "wbbsxh56667",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.brownColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date:",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.reddishColor,
                          ),
                        ),
                        Text(
                          "12/12/23",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.brownColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Vendor",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.reddishColor,
                          ),
                        ),
                        Text(
                          "Mak Dairy",
                          style: TextStyle(
                            fontSize: AppDimens.font18,
                            color: AppColors.brownColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
