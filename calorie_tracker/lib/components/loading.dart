import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatelessWidget {
  final String whichScreen;
  const Loading({
    required this.whichScreen,
  });

  Widget getSkeleton(
      String screen, double mediaQuery, double mediaQueryHeight) {
    if (screen == 'ShowData') {
      // double containerWidth = 220.0;
      // double containerHeight = 51.0;
      return ListView.builder(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 83, 82, 82),
            highlightColor: Color.fromARGB(97, 255, 255, 255),
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: mediaQuery * 0.88,
                        height: mediaQuery * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.red,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Expanded(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: mediaQuery * 0.25,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: mediaQuery * 0.85,
                            height: 51.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double mediaQuery = MediaQuery.of(context).size.width;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return getSkeleton(whichScreen, mediaQuery, mediaQueryHeight);
  }
}
