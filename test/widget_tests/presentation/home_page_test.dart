import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:itemify/presentation/pages/home_page.dart';
import 'package:itemify/presentation/pages/widgets/item_tile.dart';

void main() {
  group('Home page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(ItemTile), findsAtLeastNWidgets(4));
    });
  });
}
