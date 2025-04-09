import 'package:devsolutions/features/home/presentation/manager/product_cubit.dart';
import 'package:devsolutions/features/home/presentation/manager/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/home_widget.dart';
import '../widgets/product_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: state.index ?? 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: 'Favorite',
              ),
            ],
          ),
          body:state.index==0? HomeWidget(state: state,): _favoriteWidget(state),
        );
      },
    );
  }


  _favoriteWidget(HomeState state) {
    var list = state.favProducts ?? [];
    if (list.isEmpty) {
      return const Center(child: Text('No favorite product'));
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Expanded(child: ProductsListview(list: list)),
        ],
      );
  }}




}
