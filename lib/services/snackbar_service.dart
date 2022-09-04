import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/constants/constants.dart';

/// A class that helps with all the app's [SnackBar] activities
class SnackbarService {
  /// A global [ScaffoldMessenger] key
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// A method to show a [SnackBar] for successful activity
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: AppColors.green,
        content: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  /// A method to show a [SnackBar] for successful activity
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    String text,
  ) {
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

/// Provides the [SnackbarService]

final snackbarService = Provider(
  (ref) => SnackbarService(),
);
