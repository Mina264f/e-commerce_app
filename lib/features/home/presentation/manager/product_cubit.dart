import 'package:devsolutions/core/api_helper/failure.dart';
import 'package:devsolutions/core/helpers/cache_helper.dart';
import 'package:devsolutions/features/home/data/models/products_model.dart';
import 'package:devsolutions/features/home/data/repositories/products_repo.dart';
import 'package:devsolutions/features/home/presentation/manager/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.productsRepository}) : super(HomeState(index: 0));

  final ProductsRepository productsRepository;

  Future<void> getProducts([bool product = true]) async {
    emit(state.copyWith(productState: ProductState.loading));
    try {
      var result = await productsRepository.getProducts();
      final favProducts =
          product ? CacheHelper.getList(CacheKeys.favorites) : [];
      List<String> categories = [];
      for (var i = 0; i < result.length; i++) {
        result[i].isFavorite = favProducts.contains(result[i].id.toString());
        if (categories.contains(result[i].category!)) continue;
        categories.add(result[i].category!);
      }
      emit(
        state.copyWith(
          productState: ProductState.success,
          products: result,
          categories: categories,
        ),
      );
    } on ApiException catch (e) {
      emit(
        state.copyWith(
          productState: ProductState.error,
          errorMessage: e.failure.errMessage,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          productState: ProductState.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void changeIndex(int cIndex) {
    emit(state.copyWith(index: cIndex));
  }

  void addToFavorite(Product product) {
    List<Product> products =
        state.products?.where((p) => p.isFavorite).toList() ?? [];
    final favProducts = CacheHelper.getList(CacheKeys.favorites);
    if (products.contains(product)) {
      favProducts.remove(product.id.toString());
      CacheHelper.setList(CacheKeys.favorites, favProducts);
      products.remove(product);
      product.isFavorite = false;
    } else {
      favProducts.add(product.id.toString());
      CacheHelper.setList(CacheKeys.favorites, favProducts);
      products.add(product);
      product.isFavorite = true;
    }
    emit(state.copyWith(favProducts: products));
  }
}
