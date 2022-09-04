import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/utilities/failure.dart';
import 'package:widgetbook_challenge/repositories/widget_book_repository_implementation.dart';

class WidgetBookApiFailure extends WidgetbookApi {
  @override
  Random get randomNumberGenerator => throw UnimplementedError();

  @override
  Future<String> welcomeToWidgetbook({required String message}) {
    throw UnexpectedException();
  }
}

class WidgetBookApiSuccessMock extends Mock implements WidgetbookApi {}

class WidgetBookApiFailureMock extends Mock implements WidgetBookApiFailure {}

void main() {
  String? name;
  Exception? apiException;

  setUp(() {
    name = 'Idris';
    apiException = UnexpectedException();
  });

  test('For a successful API call, a `String` should be returned', () async {
    final mockWidgetBookApi = WidgetBookApiSuccessMock();

    final widgetBookRepository = WidgetBookRepositoryImpl(mockWidgetBookApi);

    when(() => mockWidgetBookApi.welcomeToWidgetbook(message: name!))
        .thenAnswer((_) async => 'Hello ${name!}');

    final result = await widgetBookRepository.getMessage(name: name!);

    expect(result, isInstanceOf<String>());
  });

  test('For a failed attempt, a `Failure` is thrown', () {
    final mockWidgetBookApi = WidgetBookApiFailureMock();

    final widgetBookRepository = WidgetBookRepositoryImpl(mockWidgetBookApi);

    when(() => mockWidgetBookApi.welcomeToWidgetbook(message: name!))
        .thenThrow(apiException!);

    expect(
      () async => widgetBookRepository.getMessage(name: name!),
      throwsA(isA<Failure>()),
    );
  });
}
