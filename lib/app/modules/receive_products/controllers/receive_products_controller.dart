import 'package:get/get.dart';

class ReceiveProductsController extends GetxController {
  //

  String? inputProduct = "Select Product";
  String? inputVendor = "Select Vendor";

  List<String> productList = [
    "Select Product",
    "Milk",
    "Paneer",
    "Dahi",
  ];

  List<String> vendorList = [
    "Select Vendor",
    "Mak Dairy",
    "Amul",
    "Mother Dairy",
  ];

  final RxString _quantity = ''.obs;
  String get quantity => _quantity.value;
  set quantity(String str) => _quantity.value = str;

  final RxString _invoiceId = ''.obs;
  String get invoiceId => _invoiceId.value;
  set invoiceId(String str) => _invoiceId.value = str;

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
