import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/data/database/product_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

class HomeController extends GetxController {
  //

  final ProductDB productDB = ProductDB();

  final RxList<ProductModel> _products = RxList<ProductModel>();
  List<ProductModel> get products => _products;
  set products(List<ProductModel> lt) => _products.assignAll(lt);

  final Rx<XFile> _personPic = Rx<XFile>(XFile(''));
  XFile get personPic => _personPic.value;
  set personPic(XFile v) => _personPic.value = v;

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
    products.assignAll(await productDB.fetchAll());
  }
}
