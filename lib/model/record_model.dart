import 'package:uuid/uuid.dart';

class Record{
  String id = Uuid().v1();
  int weight;
  DateTime dateTime;
  String? note;
  String? photoPath;

  Record({required this.weight,required this.dateTime, this.note,this.photoPath});




}