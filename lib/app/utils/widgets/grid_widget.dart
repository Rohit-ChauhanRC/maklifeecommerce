import 'package:flutter/material.dart';
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
          return CardWidget(
            picture: grid.picture,
            title: grid.name.toString(),
            onTap: () {
              product[i].count = product[i].count! + 1;
              // print(grid.count);
              print(product[i].count);
              orders.add(product[i]);
              total();
            },
            quantity: grid.quantity!,
            volume: grid.weight.toString(),
            price: grid.price.toString(),
          );
        });
  }
}
