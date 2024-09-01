import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/models/item.dart';

class DeleteItemAction extends ReduxAction<AppState> {
  final Item item;

  DeleteItemAction({required this.item});

  @override
  Future<AppState?> reduce() async {
    // Make a copy of the current items list
    List<Item?> itemsList = List.from(state.items ?? []);

    // Add the new item to the list
    try {
      if (itemsList.remove(item)) {
        // Return the new state with the updated items list
        return state.copyWith(items: itemsList);
      } else {
        throw const UserException('Deleting item failed');
      }
    } catch (e) {
      throw UserException(e.toString());
    }
  }
}
