import 'package:devsolutions/core/api_helper/failure.dart';
import 'package:devsolutions/features/home/data/models/products_model.dart';
import 'package:devsolutions/features/home/data/repositories/products_repo.dart';
import 'package:devsolutions/features/home/presentation/manager/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.productsRepository}) : super(HomeState(index: 0));

  final ProductsRepository productsRepository;

  Future<void> getProducts() async {
    emit(state.copyWith(productState: ProductState.loading));
    try {
      final result = await productsRepository.getProducts();
      emit(
        state.copyWith(productState: ProductState.success, products: result),
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
    List<Product> products = state.favProducts ?? [];
    if (products.contains(product)) {
      products.remove(product);
      product.isFavorite = false;
    } else {
      products.add(product);
      product.isFavorite = true;
    }
    emit(state.copyWith(favProducts: products));
  }
}
