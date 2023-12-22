import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maklifeecommerce/app/modules/home/controllers/home_controller.dart';
import 'package:maklifeecommerce/app/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  //

  final HomeController homeController = Get.find<HomeController>();
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await permissionCheck();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> permissionCheck() async {
    await Permission.camera.request();
    await Permission.mediaLibrary.request();
  }

  void getImage1() {
    Utils.showImagePicker(onGetImage: (image) {
      if (image != null) {
        homeController.personPic = image;
        //  File(homeController.personPic.path).renameSync(newPath)
      }
    });
  }
}
