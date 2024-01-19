import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/database/profile_db.dart';
import 'package:maklifeecommerce/app/data/database/sell_db.dart';
import 'package:maklifeecommerce/app/data/database/vendor_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/data/models/profile_model.dart';
import 'package:maklifeecommerce/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  //
  final box = GetStorage();

  final ProductDB productDB = ProductDB();
  final SellDB sellDB = SellDB();
  final VendorDB vendorDB = VendorDB();
  final ProfileDB profileDB = ProfileDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final RxList<ProductModel> _productSearch = RxList<ProductModel>();
  List<ProductModel> get productSearch => _productSearch;
  set productSearch(List<ProductModel> lt) => _productSearch.assignAll(lt);

  final RxBool _searchP = RxBool(false);
  bool get searchP => _searchP.value;
  set searchP(bool b) => _searchP.value = b;

  final RxList<ProductModel> _orders = RxList<ProductModel>();
  List<ProductModel> get orders => _orders;
  set orders(List<ProductModel> lt) => _orders.assignAll(lt);

  final Rx<XFile> _personPic = Rx<XFile>(XFile(''));
  XFile get personPic => _personPic.value;
  set personPic(XFile v) => _personPic.value = v;

  final Rx<Uint8List> _personPicM = Rx<Uint8List>(Uint8List(0));
  Uint8List get personPicM => _personPicM.value;
  set personPicM(Uint8List pic) => _personPicM.value = pic;

  final RxBool _memoryImg = RxBool(true);
  bool get memoryImg => _memoryImg.value;
  set memoryImg(bool b) => _memoryImg.value = b;

  final RxDouble _totalAmount = 0.0.obs;
  double get totalAmount => _totalAmount.value;
  set totalAmount(double str) => _totalAmount.value = str;

  final RxInt _invoiceNo = RxInt(0);
  int get invoiceNo => _invoiceNo.value;
  set invoiceNo(int i) => _invoiceNo.value = i;

  final Rx<ProfileModel> _profile = Rx(ProfileModel());
  ProfileModel get profile => _profile.value;
  set profile(ProfileModel v) => _profile.value = v;

  final RxString _search = "".obs;
  String get search => _search.value;
  set search(String str) => _search.value = str;
  final TextEditingController? textController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getDatabasesPath().then((value) => print("db pthj : $value"));
    await fetchProduct();
    await sellDB.fetchAll();
    fetchInvoiceNo();
    // await fetchProfile();
  }

  @override
  void onReady() async {
    super.onReady();
    await fetchProduct();
  }

  @override
  void onClose() {
    super.onClose();
    _orders.close();
    _invoiceNo.close();
    _personPic.close();
    _totalAmount.close();
    _products.close();
  }

  fetchInvoiceNo() {
    if (box.read("invoiceNo") != null && box.read("invoiceNo") != "") {
      invoiceNo = box.read("invoiceNo");
    } else {
      box.write("invoiceNo", 10001);
    }
  }

  Future<void> fetchProduct() async {
    products.assignAll(await productDB.fetchAll());
  }

  Future<void> searchProduct(String name) async {
    productSearch.assignAll([]);

    for (var i = 0; i < products.length; i++) {
      searchP = true;

      if (products[i].name.toString().toLowerCase().contains(name)) {
        productSearch.add(products[i]);

        update();
        print(products[i].name);
      }
    }
    FocusScope.of(Get.context!).unfocus();
  }

  Future<void> all() async {
    textController!.clear();
    searchP = false;
    // productSearch = products;
    update();
  }

  removeItem(i) {
    orders[i].count = orders[i].count! - 1;
  }

  addItem(i) {
    orders[i].count = orders[i].count! + 1;
  }

  double totalAmountCal() {
    totalAmount = 0.0;
    if (orders.toSet().toList().isNotEmpty) {
      for (var i = 0; i < orders.toSet().toList().length; i++) {
        totalAmount += (int.tryParse(orders.toSet().toList()[i].price!)! *
                orders.toSet().toList()[i].count!)
            .toDouble();
      }
    }
    return totalAmount;
  }

  Future<void> onSave() async {
    for (var i = 0; i < orders.toSet().toList().length; i++) {
      await sellDB.create(
        invoiceId: "I${box.read("invoiceNo")}",
        productName: orders[i].name!,
        productWeight: orders[i].weight!,
        price: (int.tryParse(orders[i].price!)! * orders[i].count!).toString(),
        productId: orders[i].id.toString(),
        productQuantity: orders[i].count.toString(),
        receivingDate: DateTime.now().toIso8601String(),
      );
      final index = products
          .indexWhere((element) => element.id == orders.toSet().toList()[i].id);

      await productDB.update(
          id: products[index].id!,
          quantity: "${int.tryParse(products[index].quantity!)!}");
    }
    box.write("invoiceNo", box.read("invoiceNo") + 1);
    await fetchProduct();
    orders.assignAll([]);
    totalAmount = 0.0;
  }

  handleProductQuantity(int i) {
    if (int.tryParse(products[i].quantity!)! >= 1) {
      products[i].count = products[i].count! + 1;
      products[i].quantity =
          (int.tryParse(products[i].quantity.toString())! - 1).toString();

      orders.add(products[i]);
      totalAmountCal();
      update();
    }
  }

  handleAddProductQuantity(int i) {
    if (int.tryParse(products[i].quantity!)! >= 1) {
      products[i].count = products[i].count! + 1;
      products[i].quantity =
          (int.tryParse(products[i].quantity.toString())! + 1).toString();

      orders.add(products[i]);
      totalAmountCal();
      update();
    }
  }

  itemAdd(int i) {
    if (orders.toSet().toList()[i].count! >= 1 &&
        orders.toSet().toList()[i].count! <=
            int.tryParse(orders.toSet().toList()[i].quantity.toString())!) {
      orders.toSet().toList()[i].count = orders.toSet().toList()[i].count! + 1;
      orders.add(orders.toSet().toList()[i]);
      final index = products
          .indexWhere((element) => element.id == orders.toSet().toList()[i].id);
      if (int.tryParse(products[index].quantity!)! >= 1) {
        products[index].quantity =
            (int.tryParse(products[index].quantity.toString())! - 1).toString();

        totalAmountCal();
        update();
      }
    }
  }

  itemSub(int i) {
    if (orders.toSet().toList()[i].count! >= 1) {
      orders.toSet().toList()[i].count = orders.toSet().toList()[i].count! - 1;
      orders.add(orders.toSet().toList()[i]);
      totalAmountCal();
      final index = products
          .indexWhere((element) => element.id == orders.toSet().toList()[i].id);

      if (int.tryParse(products[index].quantity!)! >= 1) {
        products[index].quantity =
            (int.tryParse(products[index].quantity.toString())! + 1).toString();

        totalAmountCal();
        update();
      }
    }
  }

  void getImage1() {
    Utils.showImagePicker(onGetImage: (image) {
      if (image != null) {
        personPic = image;
        memoryImg = false;
      }
    });
  }

  Future<void> fetchProfile() async {
    await profileDB.fetchAll().then((v) {
      if (v.isNotEmpty) {
        profile = v[1];
        personPicM = v[1].picture!;
        memoryImg = true;
      }
    });
  }
}
