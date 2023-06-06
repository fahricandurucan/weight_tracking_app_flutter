import 'package:flutter/material.dart';
import 'package:weight_tracking_app/widgets/history_container.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HİSTORY"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
            HistoryContainer(),
          ],
        ),
      ),
    );
  }
}
