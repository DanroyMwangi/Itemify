import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/application/state/app_state.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/presentation/pages/add_item_page.dart';

void main() {
  group('AddItemPage Widget Tests', () {
    testWidgets('displays the app bar with back button and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddItemPage(),
        ),
      );

      // Check for the back button
      expect(find.byIcon(Icons.chevron_left_rounded), findsOneWidget);

      // Check for the app bar title
      expect(find.text(addItemString), findsNWidgets(2));
    });

    testWidgets('displays item title and description form fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddItemPage(),
        ),
      );

      // Check for item title text
      expect(find.text('Item Title*', findRichText: true), findsOneWidget);

      // Check for item title hint
      expect(find.text('Enter a title for the item'), findsOneWidget);

      // Check for description text
      expect(find.text('Description*', findRichText: true), findsOneWidget);

      // Check for description hint
      expect(find.text('Add description'), findsOneWidget);
    });

    testWidgets('displays cancel and add item buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddItemPage(),
        ),
      );

      // Check for Cancel button
      expect(find.text('Cancel'), findsOneWidget);

      // Check for Add Item button
      expect(find.text('Add Item'), findsNWidgets(2));
    });

    testWidgets('tapping back button navigates back',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const AddItemPage(),
              );
            },
          ),
        ),
      );

      // Tap the back button
      await tester.tap(find.byIcon(Icons.chevron_left_rounded));
      await tester.pumpAndSettle();

      // Expect to navigate back (no longer finds AddItemPage widgets)
      expect(find.byType(AddItemPage), findsNothing);
    });

    testWidgets('shows validation errors when fields are empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AddItemPage(),
        ),
      );

      // Tap the Add Item button without entering text
      await tester.tap(find.byKey(const Key('add_item_button_key')));
      await tester.pump();

      // Expect validation error messages
      expect(find.text('Please enter a title'), findsOneWidget);
      expect(find.text('Please enter a description'), findsOneWidget);
    });
    testWidgets('allows form submission when valid input is provided',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        StoreProvider(
          store: Store<AppState>(
            initialState: AppState.initial(),
          ),
          child: const MaterialApp(
            home: AddItemPage(),
          ),
        ),
      );

      // Enter valid text into the title and description fields
      await tester.enterText(
          find.byKey(const Key('title_key')), 'Sample Title');
      await tester.enterText(
          find.byKey(const Key('description_key')), 'Sample Description');

      // Tap the Add Item button
      await tester.tap(find.byKey(const Key('add_item_button_key')));
      await tester.pump();

      // No validation error messages should be present
      expect(find.text('Please enter a title'), findsNothing);
      expect(find.text('Please enter a description'), findsNothing);
    });

    testWidgets('tapping cancel button navigates back',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const AddItemPage(),
              );
            },
          ),
        ),
      );

      // Tap the Cancel button
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();

      // Expect to navigate back (no longer finds AddItemPage widgets)
      expect(find.byType(AddItemPage), findsNothing);
    });
  });
}
