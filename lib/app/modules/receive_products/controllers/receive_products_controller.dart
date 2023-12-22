import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/product_list_model.dart';

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

  final RxString _totalAmount = ''.obs;
  String get totalAmount => _totalAmount.value;
  set totalAmount(String str) => _totalAmount.value = str;

  final RxList<ProductListModel> _productListModel =
      RxList([ProductListModel(productName: "", quantity: "", index: 1)]);

  List<ProductListModel> get productListModel => _productListModel;
  set productListModel(List<ProductListModel> pr) =>
      _productListModel.addAll(pr);

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

  void addProductList(index) {
    productListModel
        .add(ProductListModel(productName: "", quantity: "", index: index + 1));
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
