import 'package:mobx/mobx.dart';

part 'manage_state.g.dart';

class ManageState = _ManageState with _$ManageState;

abstract class _ManageState with Store {
  @observable
  bool isSearching = false;

  @action
  void createSearch() {
    // print('Como veio primeiro: $isSearching');
    isSearching = true;
  }

  @action
  void cancelSearch() {
    isSearching = false;
  }
}
