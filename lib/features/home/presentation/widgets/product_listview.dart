import 'package:flutter/material.dart';

import '../../data/models/products_model.dart';
import 'item_list.dart';

class ProductsListview extends StatelessWidget {
  const ProductsListview({
    super.key,
    required this.list,
  });

  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemBuilder: (context, index) => ItemList(product: list[index],),
        itemCount: list.length,
        separatorBuilder:
            (BuildContext context, int index) => const SizedBox(height: 20),
      ),
    );
  }
}