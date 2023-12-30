import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/database/vendor_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/data/models/receiving_model.dart';
import 'package:maklifeecommerce/app/data/models/vendor_model.dart';

class ReceiveProductsController extends GetxController {
  //

  final ProductDB productDB = ProductDB();
  final VendorDB vendorDB = VendorDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final Rx<ProductModel> _pmodel =
      Rx(ProductModel(name: "", weight: "", price: ""));
  ProductModel get pmodel => _pmodel.value;
  set pmodel(ProductModel m) => _pmodel.value = m;

  final RxList<VendorModel> _vendors = RxList<VendorModel>();
  List<VendorModel> get vendors => _vendors;
  set vendors(List<VendorModel> lt) => _vendors.assignAll(lt);

  final Rx<VendorModel> _vendorModel = Rx(VendorModel());
  VendorModel get vendorModel => _vendorModel.value;
  set vendorModel(VendorModel v) => _vendorModel.value = v;

  final RxInt _id = RxInt(0);
  int get id => _id.value;
  set id(int i) => _id.value = i;

  final RxString _inputProduct = "Select Product".obs;
  String get inputProduct => _inputProduct.value;
  set inputProduct(String str) => _inputProduct.value = str;

  final RxString _inputVendor = "Select Vendor".obs;
  String get inputVendor => _inputVendor.value;
  set inputVendor(String str) => _inputVendor.value = str;

  final RxString _vendorId = "".obs;
  String get vendorId => _vendorId.value;
  set vendorId(String str) => _vendorId.value = str;

  final RxString _quantity = ''.obs;
  String get quantity => _quantity.value;
  set quantity(String str) => _quantity.value = str;

  final RxString _invoiceId = ''.obs;
  String get invoiceId => _invoiceId.value;
  set invoiceId(String str) => _invoiceId.value = str;

  final RxString _totalAmount = ''.obs;
  String get totalAmount => _totalAmount.value;
  set totalAmount(String str) => _totalAmount.value = str;

  final RxList<ReceivingModel> _productListModel = RxList([ReceivingModel()]);
  List<ReceivingModel> get productListModel => _productListModel;
  set productListModel(List<ReceivingModel> pr) => _productListModel.addAll(pr);

  final Rx<DateTime> _receivingDate = Rx<DateTime>(DateTime.now());
  DateTime get receivingDate => _receivingDate.value;
  set receivingDate(DateTime ti) => _receivingDate.value = ti;

  @override
  void onInit() async {
    super.onInit();
    await fetchProduct();
    await fetchVendor();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSelected(String value) {
    _inputVendor.value = value;
  }

  void setSelectedProduct(String value) {
    _inputProduct.value = value;
  }

  Future<void> fetchProduct() async {
    products.assignAll(await productDB.fetchAll());
    pmodel = products[0];
  }

  Future<void> fetchVendor() async {
    vendors.assignAll(await vendorDB.fetchAll());
    vendorModel = vendors[0];
    vendorId = vendors[0].id.toString();
    inputVendor = vendors[0].name.toString();
  }

  void addProductList(index) {
    // print(productListModel[0].productName);
    // for (var element in productListModel) {
    //   print(element.productName);
    // }
    productListModel.insert(
        index + 1,
        ReceivingModel(
          vendorId: vendorId,
          invoiceId: invoiceId,
          receivingDate: receivingDate,
          totalAmount: totalAmount,
          vendorName: inputVendor,
          productId: "",
          productName: "",
          productQuantity: "",
        ));
    print(productListModel.length);
  }

  void removeProductList(int index, ReceivingModel product) {
    if (productListModel.length > 1) {
      // productListModel.remove(product);
      productListModel.removeWhere((element) =>
          element.productName == product.productName &&
          element.productQuantity == product.productQuantity);
    }
  }
}
