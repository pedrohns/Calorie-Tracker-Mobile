import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';

class ShowFood extends StatelessWidget {
  const ShowFood({Key? key}) : super(key: key);

  Widget buildSubtitle(List<Food> food, int idx, List<FoodDetails> foodDetail) {
    // print('ShowFood - buildSubtitle - ${food[idx].runtimeType}');
    final data = food[idx];
    return Text(
        '${foodDetail[idx].quantityCal} cal, ${data.sizePortion} ${data.legend}');
  }

  @override
  Widget build(BuildContext context) {
    List<Food> foods = Provider.of<FoodList>(context, listen: false).foods;
    List<FoodDetails> foodsDetails =
        Provider.of<FoodDetailsList>(context, listen: false).foodsDetails;

    return ListView.builder(
        itemCount: foods.length,
        itemBuilder: (ctx, idx) {
          return ListTile(
            title: Text(foods[idx].name),
            subtitle: buildSubtitle(foods, idx, foodsDetails),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          );
        });
  }
}
