import 'package:devsolutions/features/home/presentation/manager/product_cubit.dart';
import 'package:get_it/get_it.dart';

import 'core/api_helper/api_helper.dart';
import 'features/home/data/repositories/products_repo.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  //home
  locator.registerFactory<HomeCubit>(
    () => HomeCubit(productsRepository: locator()),
  );
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(apiHelper: locator()),
  );
  locator.registerLazySingleton<ApiHelper>(() => ApiHelper());
}
