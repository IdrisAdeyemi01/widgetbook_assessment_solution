import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/translations/locale_keys.g.dart';

/// An extension for the app's [TextField] validations.
extension ValidationExtension on BuildContext {
  /// A helper function for validating name input
  static String? validateName(String? value) {
    if (value == null) {
      return LocaleKeys.fieldCannotBeEmpty.tr();
    }

    if (value.isEmpty) {
      return LocaleKeys.fieldCannotBeEmpty.tr();
    }

    final isNameValid = RegExp(r'^[a-zA-Z]+$').hasMatch(value);
    if (!isNameValid) {
      return LocaleKeys.nameShouldOnlyContainAlphabets.tr();
    }
    return null;
  }
}
