import 'package:async_redux/async_redux.dart';
import 'package:itemify/domain/models/item.dart';

class AppState {
  final List<Item?>? items;
  final Wait? wait;

  const AppState({this.items, this.wait});

  // Factory constructor for initial state
  factory AppState.initial() {
    return const AppState(
      items: <Item>[],
    );
  }

  // CopyWith method for updating the state immutably
  AppState copyWith({
    List<Item?>? items,
    Wait? wait,
  }) {
    return AppState(
      items: items ?? this.items,
      wait: wait ?? this.wait,
    );
  }
}
