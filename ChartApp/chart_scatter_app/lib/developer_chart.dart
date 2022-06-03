import 'package:chart_scatter_app/developer_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
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
          radiusPxFn: (DeveloperSeries series, _) => series.developers / 3000,
          // x-axis
          domainFn: (DeveloperSeries series, _) => series.year,
          // y-axis
          measureFn: (DeveloperSeries series, _) => series.developers + 1000,
          // individual color
          colorFn: (DeveloperSeries series, _) => series.barColor),
    ];
    // return charts.BarChart(series, animate: true); // Version 1
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
                  child: charts.ScatterPlotChart(
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
