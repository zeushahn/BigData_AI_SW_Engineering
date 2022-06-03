import 'package:chart_multi_linechart_app/developer_series.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ************
import 'package:flutter/material.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;
  final List<DeveloperSeries> data2; // <<<<<<<<<<<<<<
  const DeveloperChart(
      {Key? key, required this.data, required this.data2}) // <<<<<<<<<<<<<<
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // data
    List<charts.Series<DeveloperSeries, num>> series = [
      // data
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor),

      // data2 // <<<<<<<<<<<<<<
      charts.Series(
          id: "developers2",
          data: data2,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor)
    ];

    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const Text(
                  'Yearly Growth in the Flutter Community',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animationDuration: const Duration(seconds: 3),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(2016.0, 2022.0),
                    ),
                    animate: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
