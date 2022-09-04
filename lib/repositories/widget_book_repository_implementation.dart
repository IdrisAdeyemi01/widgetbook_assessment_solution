// ignore_for_file: public_member_api_docs, only_throw_errors

import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/utilities/failure.dart';
import 'package:widgetbook_challenge/repositories/widget_book_repository.dart';

/// An implementation of the [WidgetBookRepository] class
class WidgetBookRepositoryImpl implements WidgetBookRepository {
  /// This provide an instance of [WidgetBookRepositoryImpl]
  WidgetBookRepositoryImpl(this.widgetbookApi);

  @override
  final WidgetbookApi widgetbookApi;

  /// A method to get the message, returns a successful message when successful,
  /// ooherwise, returns a [Failure] - an implementation
  ///
  @override
  Future<String> getMessage({required String name}) async {
    try {
      final result = await widgetbookApi.welcomeToWidgetbook(message: name);
      return result;
    } catch (e) {
      const errorMessage = 'An error occured';
      throw Failure(errorMessage);
    }
  }
}
