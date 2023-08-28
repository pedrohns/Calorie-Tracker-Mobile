import 'package:calorie_tracker/components/search_box.dart';
import 'package:calorie_tracker/components/show_food.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/loading.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool canLoad = false;
  int counter = 0;

  Widget showTypeMeals(isSearching) {
    if (canLoad == true && isSearching == false) {
      return ShowFood(key: ValueKey<int>(counter));
    } else if (canLoad == false && isSearching == true) {
      return Loading(whichScreen: 'ShowData');
    } else {
      return Center(child: Text(''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ManageState>(context);
    final String teste = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 51, 60, 0.763),
      appBar: AppBar(
        title: Text(teste),
      ),
      body: Container(
        child: Column(
          children: [
            SearchBox(
              rebuild: () {
                setState(() {
                  controller.createSearch();
                });
              },
              loadingData: (isReady) {
                setState(() => canLoad = isReady);
                controller.cancelSearch();
              },
              destroySearch: (num) {
                ;
                setState(() => counter = num);
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: showTypeMeals(controller.isSearching),
            ),
          ],
        ),
      ),
    );
  }
}
