import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/database/sell_db.dart';
import 'package:maklifeecommerce/app/data/database/vendor_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

class HomeController extends GetxController {
  //
  final box = GetStorage();

  final ProductDB productDB = ProductDB();
  final SellDB sellDB = SellDB();
  final VendorDB vendorDB = VendorDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final RxList<ProductModel> _orders = RxList<ProductModel>();
  List<ProductModel> get orders => _orders;
  set orders(List<ProductModel> lt) => _orders.assignAll(lt);

  final Rx<XFile> _personPic = Rx<XFile>(XFile(''));
  XFile get personPic => _personPic.value;
  set personPic(XFile v) => _personPic.value = v;

  final RxDouble _totalAmount = 0.0.obs;
  double get totalAmount => _totalAmount.value;
  set totalAmount(double str) => _totalAmount.value = str;

  final RxInt _invoiceNo = RxInt(0);
  int get invoiceNo => _invoiceNo.value;
  set invoiceNo(int i) => _invoiceNo.value = i;

  @override
  void onInit() async {
    super.onInit();

    await fetchProduct();
    await sellDB.fetchAll().then((value) {
      value.map((e) => print(e.productName!));
    });
    fetchInvoiceNo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchInvoiceNo() {
    if (box.read("invoiceNo") != null && box.read("invoiceNo") != "") {
      invoiceNo = box.read("invoiceNo");
    } else {
      box.write("invoiceNo", 00001);
    }
  }

  Future<void> fetchProduct() async {
    products.assignAll(await productDB.fetchAll());
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
    for (var i = 0; i < orders.length; i++) {
      await sellDB.create(
        invoiceId: "I${box.read("invoiceNo")}",
        productName: orders[i].name!,
        productWeight: orders[i].weight!,
        price: orders[i].price!,
        productId: orders[i].id.toString(),
        productQuantity: orders[i].count.toString(),
        receivingDate: DateTime.now().toIso8601String(),
      );

      products.map((e) async {
        if (e.id! == orders[i].id!) {
          await productDB.update(
              id: orders[i].id!,
              quantity:
                  "${int.tryParse(orders[i].quantity!)! - int.tryParse(orders[i].quantity!)!}");
        }
      });
    }
    invoiceNo += 1;
    box.write("invoiceNo", invoiceNo);
    await fetchProduct();
    orders.assignAll([]);
    totalAmount = 0.0;
  }
}
