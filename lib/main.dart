import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/presentation/router/route_generator.dart';

void main() {
  AppState state = AppState.initial();

  Store<AppState> store = Store<AppState>(initialState: state);
  runApp(StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homePage,
        onGenerateRoute: RouteGenerator.generateRoute,
      )));
}
