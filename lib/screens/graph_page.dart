import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracking_app/controller.dart';


class GraphPage extends StatefulWidget {


  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GRAPH"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        child: LineChart(
          LineChartData(
              maxX: 15,
              maxY: 15,
              minX: 0,
              minY: 0,
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(controller.recordList.length, (index) =>
                      FlSpot(
                          index.toDouble(),
                          controller.recordList[index].weight.toDouble())),
                  // spots: [
                  //   FlSpot(0, 0),
                  //   FlSpot(1, 4),
                  //   FlSpot(2, 6),
                  //   FlSpot(3, 5),
                  //   FlSpot(4, 8),
                  //   FlSpot(5, 12),
                  //   FlSpot(6, 9),
                  //   FlSpot(7, 8),
                  //   FlSpot(8, 7),
                  // ],
                  isCurved: true,
                  barWidth: 3,
                )
              ]
          ),
        ),
      ),
    );
  }
}
