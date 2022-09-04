// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:widgetbook_challenge/core/constants/constants.dart';
import 'package:widgetbook_challenge/core/utilities/screen_util.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.isLoading = false,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.resolveWith(
          (states) => Size(ScreenUtil.screenWidth(context) * 0.7, 50),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (isLoading) {
            return AppColors.textFieldBorderColor;
          } else {
            return AppColors.primaryColor;
          }
        }),
      ),
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            )
          : FittedBox(
              child: Text(label),
            ),
    );
  }
}
