import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddProductController extends GetxController {
  //

  GlobalKey<FormState>? productsFormKey = GlobalKey<FormState>();

  final RxString _decription = ''.obs;
  String get decription => _decription.value;
  set decription(String mobileNumber) => _decription.value = decription;

  final RxString _name = ''.obs;
  String get name => _name.value;
  set name(String str) => _name.value = str;

  final RxString _weight = ''.obs;
  String get weight => _weight.value;
  set weight(String str) => _weight.value = str;

  final RxString _quantity = ''.obs;
  String get quantity => _quantity.value;
  set quantity(String str) => _quantity.value = str;

  final RxString _price = ''.obs;
  String get price => _price.value;
  set price(String str) => _price.value = str;

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
}
