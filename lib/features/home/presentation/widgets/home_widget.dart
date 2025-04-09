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
}

Widget _bodyWidget(HomeState state) {
  var list = state.products ?? [];
  if (state.isLoading) {
    return const CircularProgressIndicator();
  } else if (state.isSuccess) {
    return ProductsListview(list: list);
  }

  return const Text('no data');
}


