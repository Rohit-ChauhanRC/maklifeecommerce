import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProductController extends GetxController {
  //

  GlobalKey<FormState>? productsFormKey = GlobalKey<FormState>();

  final ProductDB productDB = ProductDB();

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

  final Rx<XFile> _personPic = Rx<XFile>(XFile(''));
  XFile get personPic => _personPic.value;
  set personPic(XFile v) => _personPic.value = v;

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

  Future<void> permissionCheck() async {
    await Permission.camera.request();
    await Permission.mediaLibrary.request();
  }

  void getImage1() {
    Utils.showImagePicker(onGetImage: (image) {
      if (image != null) {
        personPic = image;
      }
    });
  }

  void checkValidate() async {
    if (!productsFormKey!.currentState!.validate()) {
      return null;
    }
    await createproductTable().then((value) {
      Get.back();
    });
  }

  Future<void> createproductTable() async {
    await productDB.create(
      name: name,
      weight: weight,
      price: price,
      quantity: quantity,
      picture: File(personPic.path.toString()).readAsBytesSync(),
    );
  }
}
