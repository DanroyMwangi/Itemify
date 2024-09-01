import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/application/state/view_models/app_state_view_model.dart';
import 'package:itemify/domain/constants/app_assets.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/domain/models/item.dart';
import 'package:itemify/presentation/pages/widgets/item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteShade,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        title: const Text(
          itemifyString,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed(AppRoutes.addItemPage),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      newString,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.3),
      ),
      body: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          List<Item?>? itemList = vm.appState.items;

          if (itemList == null || itemList.isEmpty) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      emptyStateImagePath,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      noItemsMessage,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                ...itemList.map((Item? item) {
                  return ItemTile(item: item!);
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
