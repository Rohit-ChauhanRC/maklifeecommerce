import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddVendorController extends GetxController {
  //
  GlobalKey<FormState>? vendorFormKey = GlobalKey<FormState>();

  final RxString _mobileNumber = ''.obs;
  String get mobileNumber => _mobileNumber.value;
  set mobileNumber(String mobileNumber) => _mobileNumber.value = mobileNumber;

  final RxString _name = ''.obs;
  String get name => _name.value;
  set name(String str) => _name.value = str;

  final RxString _gst = ''.obs;
  String get gst => _gst.value;
  set gst(String str) => _gst.value = str;

  final RxString _address = ''.obs;
  String get address => _address.value;
  set address(String str) => _address.value = str;

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
