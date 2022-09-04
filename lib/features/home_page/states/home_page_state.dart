// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:widgetbook_challenge/core/utilities/view_state.dart';

/// A class for the `HomePage` states
class HomePageState {
  const HomePageState._({required this.viewState});

  final ViewState viewState;

  factory HomePageState.initial() =>
      const HomePageState._(viewState: ViewState.idle);

  HomePageState copyWith({ViewState? viewState}) => HomePageState._(
        viewState: viewState ?? this.viewState,
      );
}
