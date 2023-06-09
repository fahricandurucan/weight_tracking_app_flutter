
import 'package:get/get.dart';

import 'model/record_model.dart';

class Controller extends GetxController{

  int weight = 0;

  var recordList = <Record>[
    // Record(weight: 70, dateTime: DateTime.now(),note: "fahrşcan"),
    // Record(weight: 80, dateTime: DateTime.now(),note: "fahrşcan"),
    // Record(weight: 50, dateTime: DateTime.now(),note: "fahrşcan"),
    // Record(weight: 60, dateTime: DateTime.now(),note: "fahrşcan"),

  ].obs;

  void addNewRecord(int weight,DateTime dateTime){
    var newRecord = Record(weight: weight, dateTime: dateTime);
    print("************** ${newRecord.id}");
    recordList.add(newRecord);
  }

  void deleteRecord(String id){
    for(int i = 0;i<recordList.length;i++){
      if(recordList[i].id == id){
        recordList.removeAt(i);
      }
    }
  }


}