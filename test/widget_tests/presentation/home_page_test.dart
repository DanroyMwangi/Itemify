import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/domain/models/item.dart';
import 'package:itemify/presentation/pages/home_page.dart';
import 'package:itemify/presentation/pages/widgets/item_tile.dart';

void main() {
  group('HomePage Widget Tests', () {
    late Store<AppState> store;

    setUp(() {
      // Initialize the store with an initial state
      store = Store<AppState>(
        initialState: AppState(
          items: [
            Item(title: 'Item 1', description: 'Description 1'),
            Item(title: 'Item 2', description: 'Description 2'),
            Item(title: 'Item 3', description: 'Description 3'),
          ],
        ),
      );
    });

    testWidgets('displays the app bar with menu icon and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Check for the menu icon
      expect(find.byIcon(Icons.menu), findsOneWidget);

      // Check for the app bar title
      expect(find.text(itemifyString), findsOneWidget);
    });

    testWidgets('displays the New button with icon and text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Check for the add icon within the New button
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Check for the New button text
      expect(find.text(newString), findsOneWidget);
    });

    testWidgets('tapping New button navigates to AddItemPage',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
            routes: {
              AppRoutes.addItemPage: (context) => const Scaffold(
                    body: Center(child: Text('Add Item Page')),
                  ),
            },
            home: const HomePage(),
          ),
        ),
      );

      // Tap the New button
      await tester.tap(find.text(newString));
      await tester.pumpAndSettle();

      // Check if it navigates to the AddItemPage
      expect(find.text('Add Item Page'), findsOneWidget);
    });

    testWidgets('displays multiple ItemTile widgets based on state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Check that the number of ItemTile widgets matches the number of items in the state
      expect(find.byType(ItemTile),
          findsNWidgets(3)); // Matches the initial state with 3 items
    });

    testWidgets('background color of Scaffold is set correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider<AppState>(
          store: store,
          child: const MaterialApp(
            home: HomePage(),
          ),
        ),
      );

      // Verify that the Scaffold has the correct background color
      final scaffoldFinder = find.byType(Scaffold);
      final scaffoldWidget = tester.widget<Scaffold>(scaffoldFinder);
      expect(scaffoldWidget.backgroundColor, AppColors.whiteShade);
    });
  });
}
