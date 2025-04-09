import 'package:cached_network_image/cached_network_image.dart';
import 'package:devsolutions/core/helpers/extenstion.dart';
import 'package:devsolutions/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../data/models/products_model.dart';

class ItemList extends StatelessWidget {
  final Product product;

  const ItemList({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.detailsScreen,arguments: product);
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              color: Colors.black.withValues(alpha: 0.2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF7F7F7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: product.id.toString(),
                child: CachedNetworkImage(
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl: product.image ?? '',
                  placeholder: (context, url) => Image.asset(Assets.assetsLoading),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.title ?? '',
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${product.price?.toString() ?? '0.0'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(66),
                  ),
                  child: Text(
                    product.category ?? '',
                    style: const TextStyle(color: Color(0xff14AE5C)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
