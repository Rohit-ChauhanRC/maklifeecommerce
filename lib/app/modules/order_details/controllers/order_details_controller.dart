import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/receiving_db.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';
import 'package:maklifeecommerce/app/data/models/receiving_model.dart';

class OrderDetailsController extends GetxController {
  //
  final ReceivingDB receivingDB = ReceivingDB();

  final Rx<ReceivingModel> _receive = Rx(ReceivingModel());
  ReceivingModel get receive => _receive.value;
  set receive(ReceivingModel model) => _receive.value = model;

  final RxList<ReceivingModel> _receiveProduct = RxList([ReceivingModel()]);
  List<ReceivingModel> get receiveProduct => _receiveProduct;
  set receiveProduct(List<ReceivingModel> model) =>
      _receiveProduct.assignAll(model);

  final count = 0.obs;
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
        await receivingDB.fetchByInvoiceId(Get.arguments!.invoiceId));
  }
}
