// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, public_member_api_docs

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, String> de = {
    "appTitle": "WidgetBook Bewertung",
    "send": "Senden",
    "enterName": "Namen hier eingeben",
    "name": "Name",
    "fieldCannotBeEmpty": "Feld darf nicht leer sein",
    "nameShouldOnlyContainAlphabets":
        "Der Name sollte nur Buchstaben enthalten",
    "hello": "Hallo",
    "anErrorOccurred": "ein Fehler ist aufgetreten"
  };
  static const Map<String, String> en = {
    "appTitle": "WidgetBook Assessment",
    "send": "Send",
    "enterName": "Enter name here",
    "name": "Name",
    "fieldCannotBeEmpty": "Field cannot be empty",
    "nameShouldOnlyContainAlphabets": "Name should only contain alphabet",
    "hello": "Hello",
    "anErrorOccurred": "An error occurred"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "de": de,
    "en": en
  };
}
