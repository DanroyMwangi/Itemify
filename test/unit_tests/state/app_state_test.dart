import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/domain/models/item.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:async_redux/async_redux.dart';

void main() {
  group('AppState Tests', () {
    test('initial state should have an empty list of items', () {
      // Act: Create an initial state
      final state = AppState.initial();

      // Assert: The initial state should have an empty list of items
      expect(state.items, isEmpty);
      expect(state.wait, isNull);
    });

    test('copyWith should return a new AppState with updated items', () {
      // Arrange: Initial state
      final initialState = AppState.initial();
      final newItem = Item(title: 'New Item', description: 'New Description');

      // Act: Create a new state with updated items using copyWith
      final newState = initialState.copyWith(items: [newItem]);

      // Assert: The new state should have the updated list of items
      expect(newState.items, isNotEmpty);
      expect(newState.items!.length, 1);
      expect(newState.items!.first, newItem);

      // Assert: The original state should remain unchanged
      expect(initialState.items, isEmpty);
    });

    test('copyWith should return a new AppState with updated wait', () {
      // Arrange: Initial state
      final initialState = AppState.initial();
      final wait = Wait();

      // Act: Create a new state with updated wait using copyWith
      final newState = initialState.copyWith(wait: wait);

      // Assert: The new state should have the updated wait object
      expect(newState.wait, isNotNull);
      expect(newState.wait, wait);

      // Assert: The original state should remain unchanged
      expect(initialState.wait, isNull);
    });

    test(
        'copyWith should return a new AppState with both updated items and wait',
        () {
      // Arrange: Initial state
      final initialState = AppState.initial();
      final newItem =
          Item(title: 'Another Item', description: 'Another Description');
      final wait = Wait();

      // Act: Create a new state with updated items and wait using copyWith
      final newState = initialState.copyWith(items: [newItem], wait: wait);

      // Assert: The new state should have the updated items and wait
      expect(newState.items, isNotEmpty);
      expect(newState.items!.first, newItem);
      expect(newState.wait, isNotNull);
      expect(newState.wait, wait);

      // Assert: The original state should remain unchanged
      expect(initialState.items, isEmpty);
      expect(initialState.wait, isNull);
    });
  });
}
