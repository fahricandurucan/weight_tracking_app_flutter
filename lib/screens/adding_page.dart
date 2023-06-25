import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import '../controller.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {

  final Controller controller = Get.put(Controller());



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.setWeight(0);
    controller.dateTime.value = DateTime.now();

  }


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
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Card(
              margin: EdgeInsets.all(15),
              elevation: 3,
              child: weightCard(),
            ),
          ),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: GestureDetector(
              onTap: () async {
                DateTime? temp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                );

                if(temp != null){
                  controller.dateTime.value = temp;
                }

              },
              child: Card(
                elevation: 3,
                margin: EdgeInsets.all(15),
                child: datePickerCard(),
              ),
            ),
          ),
          Card(
            elevation: 3,
            margin: EdgeInsets.all(15),
            child: Text("note"),
          ),

          saveButton(),

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
                value: controller.weight.value,
                onChanged: (value){
                  setState(() {
                    controller.setWeight(value);   // weight  getx e bağlanamadı
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

  Widget datePickerCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(DateFormat('EEE,MMM,d').format(controller.dateTime.value),style: TextStyle(fontSize: 15),),)
        ],
      ),
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      onPressed: (){
          controller.addNewRecord(controller.weight.value, controller.dateTime.value);
          Get.snackbar("Kayıt", "Kilo kaydınız kaydedildi",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            margin: EdgeInsets.all(15),
            icon: Icon(Icons.thumb_up,color: Colors.white,),
          );
        },
      child: Container(
        child: Text("Save"),
      ),
    );
  }
}
