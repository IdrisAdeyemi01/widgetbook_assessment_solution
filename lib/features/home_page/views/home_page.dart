import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetbook_challenge/core/utilities/validation_extension.dart';
import 'package:widgetbook_challenge/core/utilities/view_state.dart';
import 'package:widgetbook_challenge/features/home_page/notifiers/home_page_notifier.dart';
import 'package:widgetbook_challenge/features/home_page/views/widgets/custom_elevated_button.dart';
import 'package:widgetbook_challenge/features/home_page/views/widgets/custom_text_field.dart';
import 'package:widgetbook_challenge/shared_widgets/app_spacing.dart';
import 'package:widgetbook_challenge/translations/locale_keys.g.dart';

/// Page that shows the name [TextField] and [CustomElevatedButton] to make
/// request to the `Widgetbook API`

class HomePage extends StatefulWidget {
  /// Creates a new instance of [HomePage]
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.appTitle.tr()),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Consumer(
              builder: (context, ref, child) {
                final homePageState = ref.watch(homePageProvider);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: nameController,
                      hintText: LocaleKeys.enterName.tr(),
                      label: LocaleKeys.name.tr(),
                      validator: ValidationExtension.validateName,
                    ),
                    const AppSpacing.bigHeight(),
                    CustomElevatedButton(
                      isLoading: homePageState.viewState.isLoading,
                      label: LocaleKeys.send.tr(),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref
                              .read(homePageProvider.notifier)
                              .getMessage(name: nameController.text);
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
