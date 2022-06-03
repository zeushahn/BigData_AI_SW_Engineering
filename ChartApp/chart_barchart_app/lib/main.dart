import 'package:chart_barchart_app/developer_chart.dart';
import 'package:chart_barchart_app/developer_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts; // ********

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DeveloperSeries> data = [];

  @override
  void initState() {
    super.initState();
    data.add(DeveloperSeries(
      year: 2017,
      developers: 19000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ));
    data.add(DeveloperSeries(
      year: 2018,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ));
    data.add(DeveloperSeries(
      year: 2019,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ));
    data.add(DeveloperSeries(
      year: 2020,
      developers: 37000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ));
    data.add(DeveloperSeries(
      year: 2021,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
      ),
      body: Center(
        child: DeveloperChart(data: data),
      ),
    );
  }
}
