import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
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
                label: "Please enter Name...",
                onChanged: (val) => controller.name = val,
                validator: (v) => v!.isEmpty ? "Field is required!" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Product Weight...",
                onChanged: (val) => controller.weight = val,
                validator: (v) => v!.isEmpty ? "Field is required!" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Price...",
                onChanged: (val) => controller.price = val,
                validator: (v) => v!.isEmpty ? "Field is required!" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter GST...",
                onChanged: (val) => controller.gst = val,
                validator: (v) => v!.isEmpty ? "Field is required!" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Discount...",
                onChanged: (val) => controller.discount = val,
                // validator: (v) => v!.isEmpty ? "Field is required!" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter HSNCode...",
                onChanged: (val) => controller.hsnCode = val,
                // validator: (v) => v!.isEmpty ? "Field is required!" : null,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    child: Text(
                      "\tActive: ",
                      style: TextStyle(
                        fontSize: AppDimens.font20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: 200,
                      child: ListTile(
                        title: const Text('Yes'),
                        leading: Radio(
                          value: 0,
                          groupValue: controller.check,
                          onChanged: (value) {
                            print(value);
                            controller.check = value!;
                            // setState(() {
                            // selectedOption = value!;
                            // });
                          },
                        ),
                      ),
                    ),
                  ),
                  Obx(() => SizedBox(
                        width: 200,
                        child: ListTile(
                          title: const Text('No'),
                          leading: Radio(
                            value: 1,
                            groupValue: controller.check,
                            onChanged: (value) {
                              print(value);
                              controller.check = value!;

                              // setState(() {
                              // selectedOption = value!;
                              // });
                            },
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.checkValidate();
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.brownColor)),
                child: const Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
