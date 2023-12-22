import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/upload_image_widget.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: controller.productsFormKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(() => UploadImageWidget(
                    imageFile: controller.personPic,
                    onTap: controller.getImage1,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter name...",
                onChanged: (val) => controller.name = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter product weight...",
                onChanged: (val) => controller.weight = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter price...",
                onChanged: (val) => controller.price = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter description...",
                onChanged: (val) => controller.decription = val,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Add"),
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.brownColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
