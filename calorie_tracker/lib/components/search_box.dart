import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height;
    return Container(
      height: availableHeight * 0.15,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 39, right: 34),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: 'Pesquisar por alimento',
                  labelStyle: Theme.of(context).textTheme.titleSmall!,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              // child: TextFormField(
              //   decoration: InputDecoration(
              //     contentPadding:
              //         EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              //     labelText: 'Pesquisar por alimento',
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Theme.of(context).colorScheme.secondary,
              //       ),
              //     ),
              //   ),
              // ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: IconButton(
                  icon: Icon(Icons.add), color: Colors.black, onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
