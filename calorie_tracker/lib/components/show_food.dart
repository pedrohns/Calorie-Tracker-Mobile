import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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

    return Observer(
      builder: (_) => AnimationLimiter(
        child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (ctx, idx) {
              return AnimationConfiguration.staggeredList(
                position: idx,
                duration: const Duration(milliseconds: 650),
                child: SlideAnimation(
                  verticalOffset: 150.0,
                  child: FadeInAnimation(
                    child: Card(
                      // color: Color.fromARGB(255, 29, 28, 28),
                      elevation: 5,
                      color: Theme.of(context).colorScheme.secondary,
                      margin: EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          foods[idx].name,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        subtitle: buildSubtitle(foods, idx, foodsDetails),
                        trailing: IconButton(
                          onPressed: () {
                            print('ShowFood - Clique do onPressed');
                          },
                          // color: Theme.of(context).colorScheme.secondary,
                          color: Colors.white,
                          icon: Icon(Icons.add),
                        ),
                        onTap: () {
                          print('ShowFood - Clique do onTap');
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
