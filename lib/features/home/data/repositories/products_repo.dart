import 'package:devsolutions/core/api_helper/api_helper.dart';
import 'package:devsolutions/core/api_helper/failure.dart';
import 'package:dio/dio.dart';

import '../../../../core/api_helper/end_points.dart';
import '../models/products_model.dart';

class ProductsRepository {
  final ApiHelper apiHelper;

  ProductsRepository({required this.apiHelper});

  Future<List<Product>> getProducts() async {
    List<Product> products = [];
    try {
      final response = await apiHelper.getData(url: EndPoints.products);
      for(var p in response.data)
        {
          products.add(Product.fromJson(p));
        }
      return products;
    } catch (e) {
      if (e is DioException) {
        throw ApiException(failure: ServerFailure.serverError(e));
      }
      throw ApiException(failure: Failure(errMessage: e.toString()));
    }
  }
}
