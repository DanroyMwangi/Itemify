import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/domain/constants/app_colors.dart';
import 'package:itemify/domain/constants/app_routes.dart';
import 'package:itemify/domain/constants/app_strings.dart';
import 'package:itemify/presentation/pages/home_page.dart';
import 'package:itemify/presentation/pages/widgets/item_tile.dart';

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('displays the app bar with menu icon and title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
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
        const MaterialApp(
          home: HomePage(),
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
        MaterialApp(
          routes: {
            AppRoutes.addItemPage: (context) => const Scaffold(
                  body: Center(child: Text('Add Item Page')),
                ),
          },
          home: const HomePage(),
        ),
      );

      // Tap the New button
      await tester.tap(find.text(newString));
      await tester.pumpAndSettle();

      // Check if it navigates to the AddItemPage
      expect(find.text('Add Item Page'), findsOneWidget);
    });

    testWidgets('displays multiple ItemTile widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // Check that ItemTile widgets are present
      expect(find.byType(ItemTile),
          findsNWidgets(6)); // Adjust this count as needed
    });

    testWidgets('background color of Scaffold is set correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      // Verify that the Scaffold has the correct background color
      final scaffoldFinder = find.byType(Scaffold);
      final scaffoldWidget = tester.widget<Scaffold>(scaffoldFinder);
      expect(scaffoldWidget.backgroundColor, AppColors.whiteShade);
    });
  });
}
