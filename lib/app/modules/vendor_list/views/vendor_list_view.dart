import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vendor_list_controller.dart';

class VendorListView extends GetView<VendorListController> {
  const VendorListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VendorListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VendorListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
