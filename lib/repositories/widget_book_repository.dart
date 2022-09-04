// ignore_for_file: public_member_api_docs, only_throw_errors

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/utilities/failure.dart';
import 'package:widgetbook_challenge/repositories/widget_book_repository_implementation.dart';

/// An abstract class that helps connect with the simulated backend
abstract class WidgetBookRepository {
  /// This provide an instance of [WidgetBookRepository]
  WidgetBookRepository(this.widgetbookApi);

  final WidgetbookApi widgetbookApi;

  /// A method to get the message, returns a successful message when successful,
  /// ooherwise, returns a [Failure]
  Future<String> getMessage({required String name});
}

/// A singleton that helps get the [WidgetBookRepository]
final widgetbookRepositoryProvider = Provider<WidgetBookRepository>(
  (ref) => WidgetBookRepositoryImpl(
    WidgetbookApi(),
  ),
);
