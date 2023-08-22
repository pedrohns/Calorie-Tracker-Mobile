import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/api_research.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String inputText = '';
  final TextEditingController _controller = TextEditingController();

  Future<String> fetchData(String search) async {
    await ApiResearch(controller: 'teste').getFoodData(search);
    return 'oi';
  }

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height;
    return Container(
      height: availableHeight * 0.15,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 39, right: 34),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (text) {
                      if (text.length > 3) {
                        setState(() {
                          inputText = text;
                        });
                        fetchData(text);
                      }
                    },
                    onSubmitted: (_) {
                      setState(() {
                        inputText = '';
                      });
                      _controller.clear();
                    },
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
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.black,
                      onPressed: () {}),
                ),
              ],
            ),
            Center(
              child: Text(inputText),
            ),
          ],
        ),
      ),
    );
  }
}
