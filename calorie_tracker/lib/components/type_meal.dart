import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/app_routes.dart';

class TypeMeal extends StatelessWidget {
  final String title;
  final bool hasButton;
  final String secondTitle;
  const TypeMeal({
    Key? key,
    required this.title,
    required this.hasButton,
    required this.secondTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return hasButton == false
        ? Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.white38,
                width: 1,
              )),
            ),
            height: mediaQueryHeight * 0.065,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall!),
                  Text('590'),
                ],
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.white38,
                width: 1,
              )),
            ),
            height: mediaQueryHeight * 0.065,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 4.0, right: 12.0, top: 6.0, bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.food, arguments: secondTitle);
                    },
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
