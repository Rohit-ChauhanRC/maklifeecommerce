import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/sell_model.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';

import '../../../utils/app_dimens/app_dimens.dart';
import '../controllers/cutomer_billing_list_controller.dart';

class CutomerBillingListView extends GetView<CutomerBillingListController> {
  const CutomerBillingListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cutomer Billing List'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Obx(() => controller.receiveList.isNotEmpty
            ? ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width / 2,
                          child: TextFormWidget(
                            textController: controller.textController,
                            label: "Search...",
                            onChanged: (v) =>
                                controller.textController!.text = v.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (controller.textController!.text
                                  .toString()
                                  .isNotEmpty) {
                                controller.searchProduct(
                                    controller.textController!.text);
                              }
                            },
                            child: const Text("Search")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              // controller.textController!.clear();
                              // controller.searchP = false;
                              await controller.all();
                            },
                            child: const Text("All"))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: Get.height / 1.2,
                    child: GridView.builder(
                      shrinkWrap: true,
                      // reverse: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 150,
                      ),
                      itemCount: controller.receiveList.length,
                      itemBuilder: (context, index) {
                        SellModel data = controller.receiveList[index];

                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.CUTOMER_BILLING_DETILS,
                                arguments: data);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      data.invoiceId.toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     Text(
                                //       "Amount",
                                //       style: TextStyle(
                                //         fontSize: AppDimens.font18,
                                //         color: AppColors.reddishColor,
                                //       ),
                                //     ),
                                //     Text(
                                //       data.productQuantity ?? "",
                                //       style: TextStyle(
                                //         fontSize: AppDimens.font18,
                                //         color: AppColors.brownColor,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
