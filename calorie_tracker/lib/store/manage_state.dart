import 'package:calorie_tracker/model/user.dart';
import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/components/api_research.dart';

part 'manage_state.g.dart';

class ManageState = _ManageState with _$ManageState;

abstract class _ManageState with Store {
  @observable
  bool isSearching = false;

  @observable
  bool canLoad = false;

  @observable
  String mealTitle = '';

  @observable
  String idUser = '';

  @action
  void setSearch(bool isReady) {
    isSearching = isReady;
    // print('createSearch: isSearching: $isSearching');
  }

  @action
  void setLoad(bool isReady) {
    canLoad = isReady;
    // print('setLoad: canLoad: $canLoad');
  }

  @action
  Future<void> fetchData(
      String search, Map<String, dynamic> generalController) async {
    setLoad(false);
    setSearch(true);
    try {
      await ApiResearch(controller: generalController).getFoodData(search);
      setLoad(true);
    } catch (e) {
      print('Deu erro na requisição. ${e.toString()}');
    } finally {
      setSearch(false);
    }
  }

  @action
  void whichMeal(String which) {
    mealTitle = which;
    print('ManageState - whichMeal - $mealTitle');
  }

  @action
  Future<void> setUserData(String rowid) async  {
    idUser = rowid;
  }
}
