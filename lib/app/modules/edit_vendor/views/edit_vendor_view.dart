import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_vendor_controller.dart';

class EditVendorView extends GetView<EditVendorController> {
  const EditVendorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditVendorView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditVendorView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
