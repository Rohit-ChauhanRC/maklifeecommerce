import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

import 'card_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.product,
    required this.orders,
    required this.total,
  });

  final List<ProductModel> product;
  final List<ProductModel> orders;
  final VoidCallback total;

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisExtent: 250,
        ),
        itemCount: product.length,
        itemBuilder: (_, i) {
          var grid = product[i];
          return Obx(() => CardWidget(
                picture: grid.picture,
                title: grid.name.toString(),
                onTap: () {
                  if (int.tryParse(product[i].quantity!)! >= 1) {
                    product[i].count = product[i].count! + 1;
                    product[i].quantity =
                        (int.tryParse(product[i].quantity.toString())! - 1)
                            .toString();
                    print(product[i].quantity);
                    orders.add(product[i]);
                    total();
                  }
                },
                quantity: product[i].quantity!,
                volume: product[i].weight.toString(),
                price: product[i].price.toString(),
                model: product[i],
              ));
        });
  }
}
