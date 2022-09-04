// ignore_for_file: use_key_in_widget_constructors, public_member_api_docs

import 'package:flutter/material.dart';

/// A class for creating the app's spacing using [Material] conforming sizes
class AppSpacing extends StatelessWidget {
  const AppSpacing.empty()
      : width = 0,
        height = 0;
  const AppSpacing.largeWidth() : this.width(32);
  const AppSpacing.bigWidth() : this.width(24);
  const AppSpacing.mediumWidth() : this.width(16);
  const AppSpacing.smallWidth() : this.width(8);

  const AppSpacing.tinyWidth() : this.width(4);

  const AppSpacing.width(this.width) : height = 0;
  const AppSpacing.largeHeight() : this.height(32);
  const AppSpacing.bigHeight() : this.height(24);
  const AppSpacing.mediumHeight() : this.height(16);
  const AppSpacing.smallHeight() : this.height(8);

  const AppSpacing.tinyHeight() : this.height(4);

  const AppSpacing.height(this.height) : width = 0;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
