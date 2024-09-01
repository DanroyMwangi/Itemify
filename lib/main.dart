import 'package:flutter/material.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/presentation/router/route_generator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.homePage,
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
