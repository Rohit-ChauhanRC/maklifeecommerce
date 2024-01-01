import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/receiving_db.dart';
import 'package:maklifeecommerce/app/data/models/receiving_model.dart';

class TotalOrdersController extends GetxController {
  //
  final ReceivingDB receivingDB = ReceivingDB();
  final RxList<ReceivingModel> _receiveList = RxList();
  List<ReceivingModel> get receiveList => _receiveList;
  set receiveList(List<ReceivingModel> lt) => _receiveList.assignAll(lt);

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
    receiveList.assignAll(await receivingDB.fetchAll());
    final ids = receiveList.map((e) => e.invoiceId).toSet();
    receiveList.retainWhere((x) => ids.remove(x.invoiceId));
  }
}
