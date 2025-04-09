import 'package:devsolutions/core/api_helper/api_helper.dart';
import 'package:devsolutions/injection.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/routes.dart';

void main() {
  ApiHelper.setupDio();
  setupServiceLocator();
  runApp(const EcommerceApp());
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

