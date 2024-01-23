import 'package:flutter/material.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: widthQuery * 1,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 45),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          height: 200,
          width: widthQuery * 1,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
