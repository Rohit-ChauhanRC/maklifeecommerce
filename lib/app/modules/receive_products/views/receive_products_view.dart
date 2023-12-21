import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/routes/app_pages.dart';
import 'package:maklifeecommerce/app/utils/app_colors/app_colors.dart';
import 'package:maklifeecommerce/app/utils/app_dimens/app_dimens.dart';
import 'package:maklifeecommerce/app/utils/widgets/date_time_picker_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/drop_down_widget.dart';
import 'package:maklifeecommerce/app/utils/widgets/text_form_widget.dart';

import '../controllers/receive_products_controller.dart';

class ReceiveProductsView extends GetView<ReceiveProductsController> {
  const ReceiveProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Products'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView(
          children: [
            DropdownFormField(
              onSaved: (val) {},
              items: controller.productList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  // onTap: fn1,
                  value: value,
                  child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff2d1f76),
                        ),
                      )),
                );
              }).toList(),
              initialValue: controller.inputProduct,
              hintDrop: "Select Product",
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  const Text(
                    "if product not available in the above list please,",
                    style: TextStyle(
                      fontSize: AppDimens.font18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ADD_PRODUCT);
                    },
                    child: Text(
                      "\tclick here",
                      style: TextStyle(
                        fontSize: AppDimens.font18,
                        color: AppColors.reddishColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.reddishColor,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Please enter product quantity...",
              onChanged: (val) => controller.quantity = val,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownFormField(
              onSaved: (val) {},
              items: controller.vendorList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  // onTap: fn1,
                  value: value,
                  child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff2d1f76),
                        ),
                      )),
                );
              }).toList(),
              initialValue: controller.inputVendor,
              hintDrop: "Select Vendor",
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  const Text(
                    "if vendor not available in the above list please,",
                    style: TextStyle(
                      fontSize: AppDimens.font18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ADD_VENDOR);
                    },
                    child: Text(
                      "\tclick here",
                      style: TextStyle(
                        fontSize: AppDimens.font18,
                        color: AppColors.reddishColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.reddishColor,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePickerWidget(
              onChanged: (val) {},
              hintText: "Receiving Date",
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormWidget(
              label: "Please enter invoice id...",
              onChanged: (val) => controller.invoiceId = val,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.brownColor)),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
