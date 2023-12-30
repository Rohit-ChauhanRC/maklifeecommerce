import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:maklifeecommerce/app/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProductItemController extends GetxController {
  GlobalKey<FormState>? productsFormKey = GlobalKey<FormState>();

  final ProductDB productDB = ProductDB();

  final HomeController _homeController = Get.find();

  // late ProductModel product;

  final RxString _description = ''.obs;
  String get description => _description.value;
  set description(String mobileNumber) => _description.value = description;

  final RxString _name = ''.obs;
  String get name => _name.value;
  set name(String str) => _name.value = str;

  final RxString _weight = ''.obs;
  String get weight => _weight.value;
  set weight(String str) => _weight.value = str;

  final RxString _quantity = "".obs;
  String get quantity => _quantity.value;
  set quantity(String str) => _quantity.value = str;

  final RxString _price = "".obs;
  String get price => _price.value;
  set price(String str) => _price.value = str;

  final Rx<XFile> _personPic = Rx<XFile>(XFile(''));
  XFile get personPic => _personPic.value;
  set personPic(XFile v) => _personPic.value = v;

  final RxBool _imageDb = RxBool(true);
  bool get imgeDb => _imageDb.value;
  set imageDb(bool b) => _imageDb.value = b;

  final RxBool _progresBar = RxBool(true);
  bool get progressBar => _progresBar.value;
  set progressBar(bool b) => _progresBar.value = b;

  final Rx<Uint8List> _imageLocal = Rx<Uint8List>(Uint8List(0));
  Uint8List get imageLocal => _imageLocal.value;
  set imageLocal(Uint8List pic) => _imageLocal.value = pic;

  @override
  void onInit() async {
    super.onInit();
    await fetchProductById();
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
        imageDb = false;
        personPic = image;
      }
    });
  }

  void checkValidate() async {
    if (!productsFormKey!.currentState!.validate()) {
      return null;
    }
    await updateProductTable().then((value) {
      Get.back();
    });
  }

  Future<void> updateProductTable() async {
    await productDB
        .update(
      id: Get.arguments!,
      name: name,
      weight: weight,
      price: price,
      quantity: quantity,
      description: description.toString(),
      picture: (imgeDb)
          ? imageLocal
          : File(personPic.path.toString()).readAsBytesSync(),
    )
        .then((value) async {
      await _homeController.fetchProduct();
    });
  }

  Future<void> deleteProductTable() async {
    await productDB
        .delete(
      id: Get.arguments!,
    )
        .then((value) async {
      await _homeController.fetchProduct().then((value) => Get.back());
    });
  }

  Future<void> fetchProductById() async {
    await productDB.fetchById(Get.arguments!).then((value) {
      name = value.name;
      weight = value.weight;
      price = value.price;
      quantity = value.quantity!;
      description = value.description.toString();
      imageLocal = value.picture!;
      imageDb = true;
    }).then((value) {
      progressBar = false;
    });
  }
}
