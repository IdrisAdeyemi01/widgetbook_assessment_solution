import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/utilities/app_theme.dart';
import 'package:widgetbook_challenge/features/home_page/views/home_page.dart';
import 'package:widgetbook_challenge/services/snackbar_service.dart';

/// The app.
class App extends ConsumerWidget {
  
  /// Creates a new instance of [App]
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.read(snackbarService).scaffoldMessengerKey,
      theme: AppTheme.themeData,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}
