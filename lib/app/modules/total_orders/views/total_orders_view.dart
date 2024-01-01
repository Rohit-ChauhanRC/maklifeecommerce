import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/receiving_model.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
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
        child: Obx(() => controller.receiveList.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150,
                ),
                itemCount: controller.receiveList.length,
                itemBuilder: (context, index) {
                  ReceivingModel data = controller.receiveList[index];

                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ORDER_DETAILS, arguments: data);
                    },
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
                                data.invoiceId ?? "",
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
                                "Date:",
                                style: TextStyle(
                                  fontSize: AppDimens.font18,
                                  color: AppColors.reddishColor,
                                ),
                              ),
                              Text(
                                data.receivingDate ?? "",
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
                                "Vendor",
                                style: TextStyle(
                                  fontSize: AppDimens.font18,
                                  color: AppColors.reddishColor,
                                ),
                              ),
                              Text(
                                data.vendorName ?? "",
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
              )
            : SizedBox(
                child: Center(
                    child: Text(
                  "No data found...",
                  style: TextStyle(
                    color: AppColors.brownColor,
                    fontSize: AppDimens.font30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              )),
      ),
    );
  }
}
