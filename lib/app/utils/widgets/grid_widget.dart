import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maklifeecommerce/app/data/models/product_model.dart';

import 'card_widget.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key, required this.product});

  final List<ProductModel> product;

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
            title: grid.name,
            onTap: () {},
            quantity: grid.quantity!,
            volume: grid.weight,
            price: grid.price,
          );
        });
  }
}
