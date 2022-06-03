import 'package:chart_piechart_app/developer_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  const DeveloperChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          labelAccessorFn: (DeveloperSeries series, _) =>
              series.year.toString(),
          domainFn: (DeveloperSeries series, _) => series.year.toString(),
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
                  child: charts.PieChart<String>(
                    // ********
                    series,
                    animationDuration: const Duration(seconds: 3),
                    defaultRenderer: charts.ArcRendererConfig(
                        customRendererId: 'novoId',
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ]),
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
