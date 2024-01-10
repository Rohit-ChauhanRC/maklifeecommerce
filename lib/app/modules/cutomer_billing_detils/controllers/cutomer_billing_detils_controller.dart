import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/sell_model.dart';
import 'package:maklifeecommerce/app/modules/home/controllers/home_controller.dart';

class CutomerBillingDetilsController extends GetxController {
  //
  final HomeController homeController = Get.find();

  final Rx<SellModel> _receive = Rx(SellModel());
  SellModel get receive => _receive.value;
  set receive(SellModel model) => _receive.value = model;

  final RxList<SellModel> _receiveProduct = RxList([SellModel()]);
  List<SellModel> get receiveProduct => _receiveProduct;
  set receiveProduct(List<SellModel> model) => _receiveProduct.assignAll(model);

  @override
  void onInit() async {
    super.onInit();
    receive = Get.arguments!;
    await fetchDataByInvoiceId();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchDataByInvoiceId() async {
    receiveProduct.assignAll(
        await homeController.sellDB.fetchByInvoiceId(Get.arguments!.invoiceId));
  }
}
