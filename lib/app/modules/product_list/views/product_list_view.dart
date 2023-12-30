import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
import 'package:maklifeecommerce/app/utils/widgets/product_list_item.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        height: Get.height,
        width: Get.width,
        child: Obx(() => controller.homeController.products.length > 1
            ? ListView.builder(
                itemCount: controller.homeController.products.length,
                itemBuilder: (ctx, i) {
                  ProductModel product = controller.homeController.products[i];
                  return ProductListItem(product: product);
                })
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
