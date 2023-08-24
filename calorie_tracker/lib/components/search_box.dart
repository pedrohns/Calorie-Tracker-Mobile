import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/api_research.dart';
import 'package:calorie_tracker/components/search_text_field.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  final Function(bool) loadingData;
  const SearchBox({Key? key, required this.loadingData}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  String inputText = '';
  // final TextEditingController _controller = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final controllerFoods = Provider.of<FoodList>(context);
    final controllerFoodsDetails = Provider.of<FoodDetailsList>(context);
    Map<String, dynamic> generalController = {
      'Foods': controllerFoods,
      'FoodsDetails': controllerFoodsDetails,
    };
    Future<void> fetchData(String search) async {
    bool isReady = await ApiResearch(controller: generalController).getFoodData(search);
    widget.loadingData(isReady);
    // setState(() {
    //   canLoadData = isReady;
    // });
    // return isReady;
  }

    final availableHeight = MediaQuery.of(context).size.height;
    return Container(
      height: availableHeight * 0.15,
      color: Colors.red,
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
