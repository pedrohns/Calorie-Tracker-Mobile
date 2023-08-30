// import 'package:calorie_tracker/components/line_chart_box.dart';
import 'package:calorie_tracker/data/dummy_data.dart';
import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeightReview extends StatelessWidget {
  const WeightReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: 200,
        width: widthQuery * 1,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SfCartesianChart(
          title: ChartTitle(
              text: 'Peso',
              textStyle: Theme.of(context).textTheme.titleLarge!,
              alignment: ChartAlignment.near),
          series: <ChartSeries>[
            LineSeries<WeightData, double>(
              dataSource: weightData,
              xValueMapper: (WeightData weights, _) => weights.day,
              yValueMapper: (WeightData weights, _) => weights.weight,
              markerSettings: MarkerSettings(isVisible: true),
              // dataLabelSettings: DataLabelSettings(isVisible: true),
            )
          ],
          primaryXAxis: NumericAxis(
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: NumericAxis(majorGridLines: MajorGridLines(width: 0)),
        ),
        // child: Text(
        //   'Box 4',
        //   style: TextStyle(
        //     color: Theme.of(context).textTheme.titleLarge!.color,
        //     fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
        //   ),
        // ),
      ),
    );
  }
}
