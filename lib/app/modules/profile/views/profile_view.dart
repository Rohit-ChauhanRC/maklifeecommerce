import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/upload_image_widget.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 20,
            ),
            Obx(() => UploadImageWidget(
                  imageFile: controller.homeController.personPic,
                  onTap: controller.getImage1,
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Pleae enter name...",
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Pleae enter address...",
              onChanged: (val) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Pleae enter contact no...",
              onChanged: (val) {},
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: Get.width / 4,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Save"))),
          ],
        ),
      ),
    );
  }
}
