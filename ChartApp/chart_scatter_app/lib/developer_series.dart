import 'package:charts_flutter/flutter.dart' as charts;

class DeveloperSeries {
  late int year;
  late int developers;
  late charts.Color barColor;

  DeveloperSeries({
    required this.year,
    required this.developers,
    required this.barColor,
  });
}
