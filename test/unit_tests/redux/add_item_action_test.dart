import 'package:async_redux/async_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/models/item.dart';
import 'package:itemify/application/redux/add_item_action.dart'; // Import the AddItemAction

void main() {
  group('AddItemAction Tests', () {
    late Store<AppState> store;
    late Item newItem;

    setUp(() {
      // Initialize a new item to be added
      newItem = Item(title: 'New Item', description: 'New Description');

      // Set up the initial state
      const initialState = AppState(items: []);

      // Initialize the store with the initial state
      store = Store<AppState>(initialState: initialState);
    });

    test('should add an item to the state when AddItemAction is dispatched',
        () async {
      final storeTester = StoreTester<AppState>.from(store);

      // Dispatch the AddItemAction with newItem
      storeTester.dispatch(AddItemAction(item: newItem, callBack: () {}));

      // Wait for the action to complete
      TestInfo<AppState> info = await storeTester.wait(AddItemAction);

      // Verify that the item was added to the state
      expect(info.state.items!.contains(newItem), isTrue);
      expect(info.state.items!.length, 1); // Should contain exactly one item
    });
  });
}
