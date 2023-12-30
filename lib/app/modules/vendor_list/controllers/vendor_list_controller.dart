import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/database/vendor_db.dart';
import 'package:maklifeecommerce/app/data/models/vendor_model.dart';

class VendorListController extends GetxController {
  //
  final VendorDB vendorDB = VendorDB();

  final RxList<VendorModel> _vendors = RxList<VendorModel>();
  List<VendorModel> get vendors => _vendors;
  set vendors(List<VendorModel> lt) => _vendors.assignAll(lt);

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

  // void increment() => count.value++;

  Future<void> fetchAll() async {
    vendors.assignAll(await vendorDB.fetchAll());
  }
}
