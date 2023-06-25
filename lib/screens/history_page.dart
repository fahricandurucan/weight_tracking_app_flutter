import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracking_app/widgets/history_container.dart';

import '../controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HİSTORY"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
              },
              icon: Icon(Icons.favorite)),
        ],
      ),
      body: Obx(() => c.recordList.length == 0 ?
      Center(child: Text("Lütfen Kilo Kaydınızı Giriniz",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),) :
      Container(
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            for(int i = 0;i<c.recordList.length;i++)
              HistoryContainer(record: c.recordList[i],),
          ],
        ),
      ),),
    );
  }
}
