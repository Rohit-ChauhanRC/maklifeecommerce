import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/receive_products_controller.dart';

class ReceiveProductsView extends GetView<ReceiveProductsController> {
  const ReceiveProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReceiveProductsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReceiveProductsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
