import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracking_app/controller.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  final Controller controller = Get.put(Controller());


  final List<DateTime> dates = [
    DateTime(2023, 6, 20),
    DateTime(2023, 6, 21),
    DateTime(2023, 6, 22),
    DateTime(2023, 6, 23),
    DateTime(2023, 6, 24),
    DateTime(2023, 6, 25),
    DateTime(2023, 6, 26),
  ];

  FlTitlesData get titlesData => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles(),
    ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(interval: 1,reservedSize:25,showTitles: true),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
  );

  @override
  Widget build(BuildContext context) {
    controller.maxWeigth();
    controller.minWeigth();


    return Scaffold(
      appBar: AppBar(
        title: Text("GRAPH"),
        centerTitle: true,
      ),
      body: Obx(
            () => controller.recordList.length<2
            ? Center(
                child: Text("EN AZ 2 KİLO KAYDI GİRİLİNCE GRAFİK GÖSTERİLECEK"),
            )
            : SizedBox(
              width: double.infinity,
              height: 250,
              child: Container(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: LineChart(
                    LineChartData(
                      maxX: (controller.recordList.length-1).toDouble(),
                      maxY: controller.maxWeigth().toDouble() ,
                      minX: 0,
                      minY: controller.minWeigth().toDouble(),
                      lineBarsData: [
                        LineChartBarData(
                            spots: List.generate(
                              controller.recordList.length,
                                  (index) => FlSpot(
                                    index.toDouble(),
                                controller.recordList[index].weight.toDouble(),
                              ),
                            ),
                            isCurved: true,
                            color: Colors.yellow,
                            barWidth: 3,
                            // belowBarData: BarAreaData(
                            //   show: true,
                            //   color: Colors.yellow,
                            // )
                        ),
                      ],
                      titlesData: titlesData,
                      // titlesData: FlTitlesData(
                      //   bottomTitles: AxisTitles(
                      //     sideTitles: bottomSide,
                      //   ),
                      //   leftTitles: AxisTitles(
                      //     sideTitles: SideTitles(interval: 1,reservedSize:25,showTitles: true),
                      //   ),
                      //   rightTitles: AxisTitles(
                      //     sideTitles: SideTitles(showTitles: false),
                      //   ),
                      //   topTitles: AxisTitles(
                      //     sideTitles: SideTitles(showTitles: false),
                      //   ),
                      // ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border(
                            bottom: BorderSide(color: Colors.green,width: 2),
                          left: BorderSide(color: Colors.green,width: 2),

                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        getDrawingHorizontalLine: (value){
                          return FlLine(
                            color: Colors.green,
                            strokeWidth: 2,
                          );
                        },
                        drawVerticalLine: false,
                        // getDrawingVerticalLine: (value){
                        //   return FlLine(
                        //     color: Colors.green,
                        //     strokeWidth: 1,
                        //   );
                        // }
                      ),


                    ),
                  ),
                ),
          ),
            ),
      ),
    );
  }

  Widget bottomTitlesWidget(double value,TitleMeta meta) {
    const style = TextStyle(color: Colors.pink);
    // String text;
    DateTime date;
    print("value = "+value.toString());
    switch(value.toInt()){
      case 0:
        // text = "one";
        date = controller.recordList[0].dateTime;
        break;
      case 1:
        // text = "two";
        date = controller.recordList[1].dateTime;
        break;
      case 2:
        // text = "three";
        date = controller.recordList[2].dateTime;
        break;
      case 3 :
        // text = "four";
        date = controller.recordList[3].dateTime;
        break;
      default :
        date = controller.recordList[0].dateTime;
        break;
    }
    return Text(DateFormat('MMM,d').format(date),style: TextStyle(fontSize: 15,color: Colors.pink),);
    // return Text(text,style: style,);

  }

SideTitles bottomTitles() => SideTitles(
  getTitlesWidget: bottomTitlesWidget,
  showTitles: true,
  interval: 1,
  reservedSize: 20,
);

}



