import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OrderDetailsView'),
        centerTitle: true,
      ),
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.blackColor,
            ),
            borderRadius: BorderRadius.circular(20),
            color: AppColors.whiteColor,
          ),
          width: Get.width / 1.3,
          height: Get.height / 1.3,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Invoice Id:",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.reddishColor,
                    ),
                  ),
                  Text(
                    "wbbsxh56667",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.brownColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date:",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.reddishColor,
                    ),
                  ),
                  Text(
                    "12/12/23",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.brownColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vendor",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.reddishColor,
                    ),
                  ),
                  Text(
                    "Mak Dairy",
                    style: TextStyle(
                      fontSize: AppDimens.font22,
                      color: AppColors.brownColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Product List: ",
                style: TextStyle(
                  fontSize: AppDimens.font22,
                  color: AppColors.reddishColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.reddishColor,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height / 1.8,
                // color: AppColors.brownColor,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.bgColor,
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
                                "Product:",
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantity:",
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
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price:",
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
