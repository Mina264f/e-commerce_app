import 'package:devsolutions/core/api_helper/api_helper.dart';
import 'package:devsolutions/core/api_helper/failure.dart';
import 'package:devsolutions/features/home/data/repositories/products_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiHelper extends Mock implements ApiHelper {}

void main() {
  late ProductsRepository productsRepository;
  late MockApiHelper mockApiHelper;

  setUp(() {
    mockApiHelper = MockApiHelper();
    productsRepository = ProductsRepository(apiHelper: mockApiHelper);
  });

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: ''));
  });

  group('ProductsRepository', () {
    test('getProducts returns a list of products', () async {
      Response response = Response(
        data: [
          {'id': 1, 'name': 'Product 1'},
          {'id': 2, 'name': 'Product 2'},
        ],
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
        isRedirect: false,
      );
      // Arrange
      when(
        () => mockApiHelper.getData(url: any(named: 'url')),
      ).thenAnswer((_) async => response);

      // Act
      final result = await productsRepository.getProducts();

      // Assert
      expect(result.length, 2);
      expect(result[0].id, 1);
    });

    test('getProducts throws ApiException on DioException', () async {
      // Arrange
      when(
        () => mockApiHelper.getData(url: any(named: 'url')),
      ).thenThrow(ApiException(failure: Failure(errMessage: 'Error')));

      // Act & Assert
      expect(
        () async => await productsRepository.getProducts(),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
