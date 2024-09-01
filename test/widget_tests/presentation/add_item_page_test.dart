import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
      expect(find.text('Description'), findsOneWidget);

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
  });
}
