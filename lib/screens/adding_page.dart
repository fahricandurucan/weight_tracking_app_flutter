import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

import '../controller.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {

  final Controller controller = Get.put(Controller());

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding Weight"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.all(15),
            elevation: 3,
            child: weightCard(),
          ),
          Card(
            child: Text("datetime"),
          ),
          Card(
            child: Text("note"),
          ),

        ],
      ),
    );
  }

  Widget weightCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              NumberPicker(
                axis: Axis.horizontal,
                itemCount: 3,
                minValue: 0,
                maxValue: 200,
                value: controller.weight,
                onChanged: (value){
                  setState(() {
                    controller.weight = value;
                  });
                },
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.green),
                ),
              ),
              Icon(Icons.arrow_drop_up),
            ],
          ),
        ],
      ),
    );
  }
}
