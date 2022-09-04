import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/core/utilities/locales.dart';
import 'package:widgetbook_challenge/translations/locale_keys.g.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  });

  group('Full HomePage tests', () {
    testWidgets(
        'Should test the presence of some visible Widgets on the HomePage', (
      tester,
    ) async {
      await tester.pumpWidget(
        EasyLocalization(
          supportedLocales: L18n.locales,
          path: L18n.assetLocalePath,
          saveLocale: false,
          fallbackLocale: L18n.locales.first,
          child: const ProviderScope(
            child: App(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(LocaleKeys.appTitle.tr()), findsOneWidget);
      expect(
        find.widgetWithText(TextFormField, LocaleKeys.enterName.tr()),
        findsOneWidget,
      );
      expect(find.text(LocaleKeys.send.tr()), findsOneWidget);

      // Find visible widgets
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);

      // Interacting with the TextFormField
      // Enter `Idris` into the TextFormField
      await tester.enterText(find.byType(TextFormField), 'Idris');

      // Clicking on the ElevatedButton
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      //Because `Idris` is a valid text, a Snackbar
      expect(find.byType(SnackBar), findsOneWidget);

     
    });
  });
}
