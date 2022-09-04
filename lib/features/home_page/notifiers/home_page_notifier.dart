import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/utilities/failure.dart';
import 'package:widgetbook_challenge/core/utilities/view_state.dart';
import 'package:widgetbook_challenge/features/home_page/states/home_page_state.dart';
import 'package:widgetbook_challenge/repositories/widget_book_repository.dart';
import 'package:widgetbook_challenge/services/snackbar_service.dart';
import 'package:widgetbook_challenge/translations/locale_keys.g.dart';

/// The [HomePageNotifier] includes functions and variables relating to the
/// state of the `HomePage` view
class HomePageNotifier extends StateNotifier<HomePageState> {
  /// Creates a new instance of [HomePageNotifier]
  HomePageNotifier(this._read) : super(HomePageState.initial());

  final Reader _read;

  ///Method to get the message and return adequate result
  Future<void> getMessage({
    required String name,
  }) async {
    state = state.copyWith(viewState: ViewState.loading);
    await Future<void>.delayed(const Duration(seconds: 2));
    try {
      final message =
          await _read(widgetbookRepositoryProvider).getMessage(name: name);

      _read(snackbarService).showSuccessSnackBar(message);
    } on Failure  {
      
      _read(snackbarService).showErrorSnackBar(LocaleKeys.anErrorOccurred.tr());
    } finally {
      state = state.copyWith(viewState: ViewState.idle);
    }
  }
}

///The `homePageProvider` provides the [HomePageNotifier] and [HomePageState]
final homePageProvider = StateNotifierProvider<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(ref.read),
);
