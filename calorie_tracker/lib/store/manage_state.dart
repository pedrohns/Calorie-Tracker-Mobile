import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/components/api_research.dart';

part 'manage_state.g.dart';

class ManageState = _ManageState with _$ManageState;

abstract class _ManageState with Store {
  @observable
  bool isSearching = false;

  @observable
  bool canLoad = false;

  @action
  void createSearch() {
    isSearching = true;
    print('createSearch: isSearching: $isSearching');
  }

  @action
  void cancelSearch() {
    isSearching = false;
    print('cancelSearch: isSearching $isSearching');
  }

  @action
  void setLoad(bool isReady) {
    canLoad = isReady;
    print('setLoad: canLoad: $canLoad');
  }

  @action
  Future<void> fetchData(String search, Map<String, dynamic> generalController) async {
    createSearch();
    try{
      await ApiResearch(controller: generalController).getFoodData(search);
      setLoad(true);
    } catch (e) {
      print('Deu erro na requisição. ${e.toString()}');
    } finally {
      cancelSearch();
    }
  }

}
