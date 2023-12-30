import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/data/models/receiving_model.dart';
import 'package:maklifeecommerce/app/data/models/vendor_model.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
import 'package:maklifeecommerce/app/utils/widgets/date_time_picker_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/drop_down_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/input_dropdown.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';

import '../controllers/receive_products_controller.dart';

class ReceiveProductsView extends GetView<ReceiveProductsController> {
  const ReceiveProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Products'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormWidget(
              label: "Please enter invoice id...",
              onChanged: (val) => controller.invoiceId = val,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Please enter total amount...",
              onChanged: (val) => controller.totalAmount = val,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.vendors.length > 1 &&
                    controller.inputVendor.isNotEmpty
                ? InputDecorator(
                    decoration: const InputDecoration(
                      hintText: "Select Vendor",
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<VendorModel>(
                        items: controller.vendors
                            .map((VendorModel dropDownStringItem) {
                          return DropdownMenuItem<VendorModel>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem.name!),
                          );
                        }).toList(),
                        onChanged: (VendorModel? val) {
                          print(val!.id);
                          controller.setSelected(val.name!.toString());
                          controller.vendorModel = val;
                          controller.vendorId = val.id.toString();
                        },
                        value: controller.vendorModel,
                        isDense: true,
                      ),
                    ),
                  )
                : const SizedBox()),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  const Text(
                    "if vendor not available in the above list please,",
                    style: TextStyle(
                      fontSize: AppDimens.font18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ADD_VENDOR);
                    },
                    child: Text(
                      "\tclick here",
                      style: TextStyle(
                        fontSize: AppDimens.font18,
                        color: AppColors.reddishColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.reddishColor,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePickerWidget(
              onChanged: (val) {},
              hintText: "Receiving Date",
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: Get.height / 2,
              // color: Colors.black,
              child: Obx(() => ListView.builder(
                  itemCount: controller.productListModel.length,
                  itemBuilder: (ctx, index) {
                    ReceivingModel _product =
                        controller.productListModel[index];

                    return Container(
                      // key: GlobalObjectKey(index),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.blackColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Obx(() => controller.products.length > 1 &&
                                  controller.pmodel != null
                              ? InputDecorator(
                                  decoration: const InputDecoration(
                                    hintText: "Select Product",
                                  ),
                                  child: DropdownButtonHideUnderline(
                                      child: DropdownButton<ProductModel>(
                                    items: controller.products
                                        .map((ProductModel dropDownStringItem) {
                                      return DropdownMenuItem<ProductModel>(
                                        value: dropDownStringItem,
                                        child: Text(dropDownStringItem.name),
                                      );
                                    }).toList(),
                                    onChanged: (ProductModel? val) {
                                      // controller.productListModel[index]
                                      //     .productName = val!.name;
                                      // controller.pmodel = val;
                                      _product.productModel = val;
                                      _product.productName = val!.name;

                                      // controller.setSelectedProduct(val.name);
                                    },
                                    value: _product.productModel,
                                    isDense: true,
                                  )),
                                )
                              : const SizedBox()),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: [
                                const Text(
                                  "if product not available in the above list please,",
                                  style: TextStyle(
                                    fontSize: AppDimens.font18,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.ADD_PRODUCT);
                                  },
                                  child: Text(
                                    "\tclick here",
                                    style: TextStyle(
                                      fontSize: AppDimens.font18,
                                      color: AppColors.reddishColor,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.reddishColor,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormWidget(
                            label: "Please enter product quantity...",
                            onChanged: (val) {
                              _product.productQuantity = val;
                            },
                            keyboardType: TextInputType.number,
                            // initialValue: _product.productQuantity,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    controller.addProductList(index);
                                  },
                                  child: const Text("ADD")),
                              const SizedBox(
                                width: 30,
                              ),
                              if (controller.productListModel.length > 1 ||
                                  index > 1)
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.reddishColor,
                                    ),
                                    onPressed: () {
                                      controller.removeProductList(
                                          index, _product);
                                    },
                                    child: const Text("REMOVE")),
                            ],
                          ),
                        ],
                      ),
                    );
                  })),
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.brownColor)),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
