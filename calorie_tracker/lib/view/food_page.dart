import 'package:calorie_tracker/components/search_box.dart';
import 'package:calorie_tracker/components/show_food.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool canLoad = false;
  @override
  Widget build(BuildContext context) {
    final String teste = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 51, 60, 0.763),
      appBar: AppBar(
        title: Text(teste),
      ),
      body: Container(
        // color: Color.fromRGBO(139, 74, 145, 0.859),
        // child: SearchBox(),
        child: Column(
          children: [
            SearchBox(
              loadingData: (isReady) {
                print('FoodPage - Callback LoadingData - ${isReady}');
                setState(() => canLoad = isReady);
              },
            ),
            SizedBox(height: 20),
            canLoad
                ? Expanded(
                    child: ShowFood(),
                  )
                : Text('Teste'),
            //Agora é necessário colocar os dados aqui, chamando o widget criado ShowFood, mas
            //tem que puxar os dados do provider
          ],
        ),
      ),
    );
  }
}
