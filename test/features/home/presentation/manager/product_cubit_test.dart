import 'package:bloc_test/bloc_test.dart';
import 'package:devsolutions/core/api_helper/failure.dart';
import 'package:devsolutions/features/home/data/repositories/products_repo.dart';
import 'package:devsolutions/features/home/presentation/manager/product_cubit.dart';
import 'package:devsolutions/features/home/presentation/manager/product_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late MockProductsRepository mockProductsRepository;
  late HomeCubit homeCubit;

  setUp(() {
    mockProductsRepository = MockProductsRepository();
    homeCubit = HomeCubit(productsRepository: mockProductsRepository);
  });

  group('getProducts', () {
    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getProducts is called',
      build: () {
        when(
          () => mockProductsRepository.getProducts(),
        ).thenAnswer((_) async => []);
        return homeCubit;
      },
      act: (bloc) => bloc.getProducts(false),
      expect:
          () => [
            HomeState(productState: ProductState.loading, index: 0),
            HomeState(
              productState: ProductState.success,
              products: const [],
              categories: const [],
              index: 0,
            ),
          ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, error] when getProducts throws an ApiException',
      build: () {
        when(
          () => mockProductsRepository.getProducts(),
        ).thenThrow(ApiException(failure: Failure(errMessage: '')));
        return homeCubit;
      },
      act: (bloc) => bloc.getProducts(),
      expect:
          () => [
            HomeState(productState: ProductState.loading, index: 0),
            HomeState(
              productState: ProductState.error,
              errorMessage: '',
              index: 0,
            ),
          ],
    );
  });
}
