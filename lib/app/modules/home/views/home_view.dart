import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maklifeecommerce/app/utils/widgets/app_drawer.dart';
import 'package:maklifeecommerce/app/utils/widgets/grid_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genmak Info India Limited'),
        centerTitle: true,
        actions: const [Icon(Icons.access_alarm_outlined)],
      ),
      drawer: const AppDrawer(),
      body: Column(children: [
        SizedBox(height: Get.height - 150, child: GridWidget()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Save")),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Cart"))
          ],
        ),
      ]),
      // floatingActionButton:
    );
  }
}
