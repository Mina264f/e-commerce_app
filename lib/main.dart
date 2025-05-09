import 'package:device_preview/device_preview.dart';
import 'package:devsolutions/core/api_helper/api_helper.dart';
import 'package:devsolutions/core/helpers/cache_helper.dart';
import 'package:devsolutions/injection.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiHelper.setupDio();
  setupServiceLocator();
  await CacheHelper.init();
  runApp(DevicePreview(builder:(context) =>  const EcommerceApp(),enabled: false,));
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: Routes.homeRoute,
    );
  }
}

