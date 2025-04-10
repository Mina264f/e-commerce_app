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
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        }
      },
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
          body:RefreshIndicator(child: state.index == 0
              ? HomeWidget(state: state)
              : _favoriteWidget(state), onRefresh: ()=>
            cubit.getProducts()
          )

        );
      },
    );
  }

  _favoriteWidget(HomeState state) {
    var list = state.products?.where((p) => p.isFavorite).toList() ?? [];
    if (list.isEmpty) {
      return const Center(child: Text('No favorite product'));
    } else {
      return Column(
        children: [
          const SizedBox(height: 60),
          ProductsListview(list: list),
        ],
      );
    }
  }
}
