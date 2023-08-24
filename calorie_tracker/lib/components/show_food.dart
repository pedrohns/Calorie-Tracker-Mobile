import 'package:flutter/material.dart';

class ShowFood extends StatelessWidget {
  final List<dynamic> foodData;
  const ShowFood({Key? key, required this.foodData}) : super(key: key);

  Widget buildSubtitle(List<dynamic> food, int idx) {
    print('ShowFood - buildSubtitle - ${food[idx].runtimeType}');
    final data = food[idx];
    return Text('${data.quantity_cal} cal, ${data.sizePortion} ${data.legend}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: foodData.length,
        itemBuilder: (ctx, idx) {
          return ListTile(
            title: Text(foodData[idx].name),
            subtitle: buildSubtitle(foodData, idx),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          );
        });
  }
}
