import 'package:devsolutions/core/routes/routes.dart';
import 'package:devsolutions/features/home/presentation/manager/product_cubit.dart';
import 'package:devsolutions/features/home/presentation/pages/details_screen.dart';
import 'package:devsolutions/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/products_model.dart';
import '../../features/home/presentation/pages/home_screen.dart';

class AppRoutes {
  static final HomeCubit homeCubit = locator<HomeCubit>();
  static Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => homeCubit..getProducts(),
                child: const HomeScreen(),
              ),
        );
      case Routes.detailsScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider.value(
                value: homeCubit,
                child: ProductDetails(product: args as Product),
              ),
        );
      default:
        return null;
    }
  }
}
