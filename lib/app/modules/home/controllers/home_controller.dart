import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/database/sell_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

class HomeController extends GetxController {
  //

  final ProductDB productDB = ProductDB();
  final SellDB sellDB = SellDB();

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

  @override
  void onInit() async {
    super.onInit();
    await fetchProduct();
    await sellDB.fetchAll().then((value) {
      value.map((e) => print(e.productName!));
    });
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

  onSave() async {
    orders.forEach((e) async {
      await sellDB.create(
        productName: e.name!,
        productWeight: e.weight!,
        price: e.price!,
        productId: e.id.toString(),
        productQuantity: e.count.toString(),
        receivingDate: DateTime.now().toIso8601String(),
      );
      orders.assignAll([]);

      products.map((el) async {
        if (el.id == e.id) {
          await productDB.update(
              id: e.id!,
              quantity:
                  "${int.tryParse(el.quantity!)! - int.tryParse(e.quantity!)!}");
        }
      });
    });
    await fetchProduct();
  }
}
