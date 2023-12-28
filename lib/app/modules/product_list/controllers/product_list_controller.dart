import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

class ProductListController extends GetxController {
  //
  final ProductDB productDB = ProductDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();

    if (kDebugMode) {
      print("121212");
    }

    await fetchProduct();
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

  Future<void> fetchProduct() async {
    // _products =
    print("121212");
    products.assignAll(await productDB.fetchAll());
    // if (kDebugMode) {
    //   print("${_products.first.name} name");
    // }
  }
}
