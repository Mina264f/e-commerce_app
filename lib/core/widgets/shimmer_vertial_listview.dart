import 'package:devsolutions/core/widgets/shimmer_item.dart';
import 'package:flutter/material.dart';

class ShimmerListview extends StatelessWidget {
  const ShimmerListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ShimmerItem(
          width: double.infinity,
          height: 150,
          margin: 15,
        ),
      ),
    );
  }
}