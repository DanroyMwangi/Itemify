import 'package:flutter/material.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/presentation/pages/add_item_page.dart';
import 'package:itemify/presentation/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute<HomePage>(
          builder: (BuildContext context) => const HomePage(),
          settings: const RouteSettings(name: AppRoutes.homePage),
        );
      case AppRoutes.addItemPage:
        return MaterialPageRoute<AddItemPage>(
          builder: (BuildContext context) => const AddItemPage(),
          settings: const RouteSettings(name: AppRoutes.addItemPage),
        );
      default:
        return null;
    }
  }
}
