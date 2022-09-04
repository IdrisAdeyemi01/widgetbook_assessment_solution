import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/app.dart';
import 'package:widgetbook_challenge/core/utilities/locales.dart';
import 'package:widgetbook_challenge/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: L18n.locales,
      path: L18n.assetLocalePath,
      fallbackLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      child: const ProviderScope(
        child: App(),
      ),
    ),
  );
}
