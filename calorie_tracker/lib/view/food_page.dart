import 'package:calorie_tracker/components/FoodPage/search_box.dart';
import 'package:calorie_tracker/components/FoodPage/show_food.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int counter = 0;

  Widget showData(ManageState controller) {
    print(
        'canLoad: ${controller.canLoad}, isSearching: ${controller.isSearching}');
    if (controller.canLoad == true && controller.isSearching == false) {
      return ShowFood(key: ValueKey<int>(counter));
    } else if (controller.canLoad == false && controller.isSearching == true) {
      return Loading(whichScreen: 'ShowData');
    } else {
      return Center(child: Text('Não possui dados!'));
    }
  }

  @override
  Widget build(BuildContext context) {
    ManageState controller = Provider.of<ManageState>(context, listen: true);
    final String titulo = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 51, 60, 0.763),
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Container(
        child: Column(
          children: [
            SearchBox(
              destroySearch: (num) {
                setState(() => counter = num);
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) => Expanded(
                child: showData(controller),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
