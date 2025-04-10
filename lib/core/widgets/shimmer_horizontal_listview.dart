import 'package:devsolutions/core/widgets/shimmer_item.dart';
import 'package:flutter/material.dart';

class ShimmerHorizontalListview extends StatelessWidget {
  const ShimmerHorizontalListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ShimmerItem(
          width: 70,
          height: 60,
          margin: 15,
        ),
      ),
    );
  }
}