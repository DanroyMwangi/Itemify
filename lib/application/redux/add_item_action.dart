import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/models/item.dart';

class AddItemAction extends ReduxAction<AppState> {
  final Item item;
  final Function() callBack;

  AddItemAction({required this.item, required this.callBack});

  @override
  Future<AppState?> reduce() async {
    // Make a copy of the current items list
    List<Item?> itemsList = List.from(state.items ?? []);

    // Add the new item to the list
    itemsList.add(item);

    // Return the new state with the updated items list
    return state.copyWith(items: itemsList);
  }

  @override
  void after() {
    callBack();
    super.after();
  }
}
