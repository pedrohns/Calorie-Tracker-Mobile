import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/FoodPage/search_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:calorie_tracker/store/manage_state.dart';

class SearchBox extends StatefulWidget {
  final Function(int) destroySearch;
  const SearchBox({
    Key? key,
    required this.destroySearch,
  }) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final controllerFoods = GetIt.I.get<FoodList>();
    final controllerFoodsDetails =
        GetIt.I.get<FoodDetailsList>();
    ManageState states = GetIt.I.get<ManageState>();
    Map<String, dynamic> generalController = {
      'Foods': controllerFoods,
      'FoodsDetails': controllerFoodsDetails,
    };

    final availableHeight = MediaQuery.of(context).size.height;
    return Container(
      height: availableHeight * 0.08,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 39, right: 34),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    onTextChanged: (text) {
                      states.fetchData(text, generalController);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
