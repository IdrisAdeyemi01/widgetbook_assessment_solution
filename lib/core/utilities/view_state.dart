// ignore_for_file: public_member_api_docs

enum ViewState { idle, loading, error }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;
  bool get isIdle => this == ViewState.idle;
  bool get isError => this == ViewState.error;
}
