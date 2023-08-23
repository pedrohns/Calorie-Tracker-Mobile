import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/api_research.dart';
import 'package:calorie_tracker/components/search_text_field.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String inputText = '';
  final TextEditingController _controller = TextEditingController();

  Future<String> fetchData(String search) async {
    await ApiResearch().getFoodData(search);
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
                  child: SearchTextField(
                    onTextChanged: (text) {
                      setState(() => inputText = text);
                      fetchData(text);
                    },
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
