import 'package:chart_linechart_app/developer_series.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ************
import 'package:flutter/material.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;
  const DeveloperChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, num>> series = [
      charts.Series(
          id: "developers",
          data: data,
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
