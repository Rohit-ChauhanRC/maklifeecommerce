import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/upload_image_widget.dart';

import '../controllers/edit_product_item_controller.dart';

class EditProductItemView extends GetView<EditProductItemController> {
  const EditProductItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        centerTitle: true,
      ),
      body: Obx(() => !controller.progressBar
          ? Container(
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
                          bytes: controller.imageLocal,
                          imageDb: controller.imgeDb,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => TextFormWidget(
                          label: "Please enter name...",
                          onChanged: (val) => controller.name = val,
                          initialValue: controller.name,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => TextFormWidget(
                          label: "Please enter product weight...",
                          onChanged: (val) => controller.weight = val,
                          initialValue: controller.weight,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => TextFormWidget(
                          label: "Please enter price...",
                          onChanged: (val) =>
                              controller.price = int.tryParse(val)!,
                          initialValue: controller.price.toString(),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => TextFormWidget(
                          label: "Please enter description...",
                          onChanged: (val) => controller.decription = val,
                          initialValue: controller.decription,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            controller.checkValidate();
                          },
                          child: Text("Update"),
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.brownColor)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.deleteProductTable();
                          },
                          child: Text("Delete"),
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.reddishColor)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : const CircularProgressIndicator()),
    );
  }
}
