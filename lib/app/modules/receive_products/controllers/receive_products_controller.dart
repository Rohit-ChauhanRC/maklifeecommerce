import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/models/product_list_model.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

class ReceiveProductsController extends GetxController {
  //

  final ProductDB productDB = ProductDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final RxInt _id = RxInt(0);
  int get id => _id.value;
  set id(int i) => _id.value = i;

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

  final RxString _totalAmount = ''.obs;
  String get totalAmount => _totalAmount.value;
  set totalAmount(String str) => _totalAmount.value = str;

  final RxList<ProductModel> _productListModel =
      RxList([ProductModel(name: "", quantity: 0, price: 0, weight: "")]);

  List<ProductModel> get productListModel => _productListModel;
  set productListModel(List<ProductModel> pr) => _productListModel.addAll(pr);

  @override
  void onInit() async {
    super.onInit();
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

  Future<void> fetchProduct() async {
    // _products =
    print("121212");
    products.assignAll(await productDB.fetchAll());
    // if (kDebugMode) {
    //   print("${_products.first.name} name");
    // }
  }

  void addProductList(index) {
    // productDB.update(id: id, quantity: int.tryParse(quantity));

    productListModel.add(ProductModel(
      name: "",
      price: 0,
      weight: "",
      description: "",
    ));
  }

  void removeProductList(int index, ProductListModel pr) {
    // productListModel.removeAt(index - 1);
    if (productListModel.length > 1) {
      // productListModel.removeAt(index);
      // productListModel.retainWhere((element) => element == pr);

      if (productListModel.contains(pr)) {
        // print(pr.quantity);
        productListModel.remove(pr);
        update();
      }

      // productListModel
      //     .removeWhere((el) => el.index.toString() == index.toString());
    }
  }
}
