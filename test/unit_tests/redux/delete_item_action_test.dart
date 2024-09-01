import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/models/item.dart';
import 'package:itemify/application/redux/delete_item_action.dart';

void main() {
  group('DeleteItemAction Tests', () {
    late Store<AppState> store;
    late Item item1;
    late Item item2;

    setUp(() {
      // Initialize test items
      item1 = Item(title: 'Item 1', description: 'Description 1');
      item2 = Item(title: 'Item 2', description: 'Description 2');

      // Set up the initial state
      final initialState = AppState(items: [item1, item2]);

      // Initialize the store with the initial state
      store = Store<AppState>(initialState: initialState);
    });

    test(
        'should remove an item from the state when DeleteItemAction is dispatched',
        () async {
      // Use StoreTester to test the action
      final storeTester = StoreTester<AppState>.from(store);

      // Dispatch the DeleteItemAction with item1
      storeTester.dispatch(DeleteItemAction(item: item1));

      // Wait for the action to complete
      TestInfo<AppState> info = await storeTester.wait(DeleteItemAction);

      // Verify that the item was removed from the state
      expect(info.state.items!.contains(item1), isFalse);
      expect(info.state.items!.length, 1); // Only one item should remain
    });

  });
}
