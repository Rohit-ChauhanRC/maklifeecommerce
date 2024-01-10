import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/sell_model.dart';
import 'package:maklifeecommerce/app/modules/home/controllers/home_controller.dart';

class CutomerBillingListController extends GetxController {
  //SellModel
  final HomeController homeController = Get.find();

  final RxList<SellModel> _receiveList = RxList();
  List<SellModel> get receiveList => _receiveList;
  set receiveList(List<SellModel> lt) => _receiveList.assignAll(lt);

  @override
  void onInit() async {
    super.onInit();
    await fetchAll();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchAll() async {
    receiveList.assignAll(await homeController.sellDB.fetchAll());
    // final amounts = receiveList.map((e) => (int.tryParse(e.price!)! * int.tryParse(e.productQuantity!)!));
    final ids = receiveList.map((e) => e.invoiceId).toSet();
    receiveList.retainWhere((x) => ids.remove(x.invoiceId));
  }
}
