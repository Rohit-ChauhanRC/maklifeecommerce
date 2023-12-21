import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';

class AdminController extends GetxController {
  //
  final List gridList = [
    {
      "icon": Icons.receipt_long_rounded,
      "title": "Receive products",
      "onTap": () {
        Get.toNamed(Routes.RECEIVE_PRODUCTS);
      },
    },
    {
      "icon": Icons.manage_accounts_outlined,
      "title": "Add products",
      "onTap": () {
        Get.toNamed(Routes.ADD_PRODUCT);
      },
    },
    {
      "icon": Icons.shopping_cart_rounded,
      "title": "Total Orders",
      "onTap": () {
        Get.toNamed(Routes.TOTAL_ORDERS);
      },
    },
    {
      "icon": Icons.local_shipping_rounded,
      "title": "Add Vendor",
      "onTap": () {
        Get.toNamed(Routes.ADD_VENDOR);
      },
    }
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
