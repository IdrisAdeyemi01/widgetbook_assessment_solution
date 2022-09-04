// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

/// Class to catch all errors and exceptions in order to present them eto the
/// user
class Failure {
  ///
  Failure(
    this.message,
  );

  ///
  final String message;

  @override
  String toString() => 'Failure(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
