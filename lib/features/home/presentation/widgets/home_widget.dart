import 'package:devsolutions/core/widgets/shimmer_horizontal_listview.dart';
import 'package:devsolutions/core/widgets/shimmer_vertial_listview.dart';
import 'package:devsolutions/features/home/presentation/widgets/product_listview.dart';
import 'package:flutter/material.dart';

import '../manager/product_state.dart';
import 'header_widget.dart';

class HomeWidget extends StatelessWidget {
  final HomeState state;

  const HomeWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const HeaderWidget(),
          _categoryWidget(state),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'All Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          _bodyWidget(state),
        ],
      ),
    );
  }

  _categoryWidget(HomeState state) {
    var list = state.categories ?? [];
    if (state.isLoading) {
      return const ShimmerHorizontalListview();
    } else if (state.isSuccess) {
      return SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    list[index],
                    style: const TextStyle(color: Color(0xff14AE5C)),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: list.length,
          ),
        ),
      );
    }

    return const SizedBox();
  }
}

Widget _bodyWidget(HomeState state) {
  var list = state.products ?? [];
  if (state.isLoading) {
    return const ShimmerListview();
  } else if (state.isSuccess) {
    return ProductsListview(list: list);
  }

  return const Center(child: Text('no data'));
}
