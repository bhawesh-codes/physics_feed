import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:get_it/get_it.dart';
import 'package:physics_feed/main.dart' as app;
import 'package:physics_feed/views/home/widgets/article_card.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Helper to boot app and wait for initial load
  Future<void> launchApp(WidgetTester tester) async {
    app.main();
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  }

  setUp(() async {
    await GetIt.instance.reset();
  });

  group('Home → Detail flow (real API)', () {
    testWidgets('shows article list after loading', (tester) async {
      await launchApp(tester);
      expect(find.byType(ArticleCard), findsWidgets);
    });

    testWidgets('tapping article navigates to detail screen', (tester) async {
      await launchApp(tester);
      expect(find.byType(ArticleCard), findsWidgets);

      await tester.tap(find.byType(ArticleCard).first);
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.text('Details Screen'), findsOneWidget);
    });

    testWidgets('scroll article list in homescreen', (tester) async {
      await launchApp(tester);
      expect(find.byType(ArticleCard), findsWidgets);

      await tester.fling(
        find.byType(ArticleCard).first,
        const Offset(0, -400),
        300,
      );
      await tester.pumpAndSettle(); // wait for scroll to settle

      expect(find.byType(ArticleCard), findsWidgets);
    });

    testWidgets('bottom nav switches to categories tab', (tester) async {
      await launchApp(tester);

      await tester.tap(find.text('Categories'));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle(Duration(seconds: 1));

      expect(find.byType(ArticleCard), findsNothing);
      expect(find.text('Categories'), findsOneWidget);
    });

    testWidgets('bottom nav switches to tags tab', (tester) async {
      await launchApp(tester);
      await tester.tap(find.text('Tags'));
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle(Duration(seconds: 1));

      await tester.tap(
        find.byType(Container).first,
      );
      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.text('Articles under tag Astrophysics'), findsOneWidget);
    });
  });
}
