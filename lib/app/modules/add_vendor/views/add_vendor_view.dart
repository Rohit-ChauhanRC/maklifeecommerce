import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';

import '../controllers/add_vendor_controller.dart';

class AddVendorView extends GetView<AddVendorController> {
  const AddVendorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vendor'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: controller.vendorFormKey,
          child: ListView(
            children: [
              TextFormWidget(
                label: "Please enter Vendor Name...",
                onChanged: (val) => controller.name = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Vendor Mobile No...",
                onChanged: (val) => controller.mobileNumber = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Vendor GSTIN No...",
                onChanged: (val) => controller.gst = val,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormWidget(
                label: "Please enter Vendor Address...",
                onChanged: (val) => controller.address = val,
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
