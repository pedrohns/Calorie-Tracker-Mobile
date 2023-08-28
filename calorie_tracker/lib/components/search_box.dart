import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/components/api_research.dart';
import 'package:calorie_tracker/components/search_text_field.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  final Function(bool) loadingData;
  final Function(int) destroySearch;
  final Function() rebuild;
  const SearchBox(
      {Key? key,
      required this.loadingData,
      required this.destroySearch,
      required this.rebuild})
      : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  // String inputText = '';
  // final TextEditingController _controller = TextEditingController();
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final controllerFoods = Provider.of<FoodList>(context, listen: false);
    final controllerFoodsDetails =
        Provider.of<FoodDetailsList>(context, listen: false);
    Map<String, dynamic> generalController = {
      'Foods': controllerFoods,
      'FoodsDetails': controllerFoodsDetails,
    };
    Future<void> fetchData(String search) async {
      widget.rebuild();
      bool isReady =
          await ApiResearch(controller: generalController).getFoodData(search);
      print('SearchBox - isReady: ${isReady}');
      setState(() {
        counter++;
      });
      await widget.loadingData(isReady);
      await widget.destroySearch(counter);
    }

    final availableHeight = MediaQuery.of(context).size.height;
    return Container(
      height: availableHeight * 0.08,
      // color: Colors.red,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 39, right: 34),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchTextField(
                    onTextChanged: (text) {
                      // setState(() => inputText = text);
                      fetchData(text);
                    },
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                // CircleAvatar(
                //   backgroundColor: Theme.of(context).colorScheme.secondary,
                //   child: IconButton(
                //       icon: Icon(Icons.cancel),
                //       // color: Theme.of(context).colorScheme.secondary,
                //       onPressed: () {}),
                // ),
              ],
            ),
            // Center(
            //   child: Text(inputText),
            // ),
          ],
        ),
      ),
    );
  }
}
