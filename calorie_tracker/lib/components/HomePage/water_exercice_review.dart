import 'package:flutter/material.dart';
import 'package:calorie_tracker/model/boxes_text.dart';

class WaterExeciceReview extends StatelessWidget {
  final String whichBoxes; //  Water, Exercice
  const WaterExeciceReview({key, required this.whichBoxes});

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    final selectedBox = BoxesText(whatBox: whichBoxes);
    final time = whichBoxes == 'Water'
        ? '00:00'
        : '${selectedBox.getValues()['value2'].hour.toString()}:${selectedBox.getValues()['value2'].minute.toString().padLeft(2, '0')}';
    return Container(
      height: 150,
      // width: 175,
      width: widthQuery * 0.44,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                selectedBox.getTitle(),
                style: Theme.of(context).textTheme.titleSmall!,
              ),
              IconButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              selectedBox.getIcons()['icon1']!,
              SizedBox(width: 5),
              Text(
                '${selectedBox.getValues()['value1'].toString()} ${selectedBox.posFixString()[0]}',
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              selectedBox.getIcons()['icon2']!,
              SizedBox(width: 5),
              Text(
                whichBoxes == 'Water'
                    ? '${selectedBox.getValues()['value1'].toString()} ${selectedBox.posFixString()[0]}'
                    : '$time ${selectedBox.posFixString()[1]}',
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
