import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/record_model.dart';

class HistoryContainer extends StatefulWidget {

  Record record;

  HistoryContainer({required this.record});


  @override
  State<HistoryContainer> createState() => _HistoryContainerState();
}

class _HistoryContainerState extends State<HistoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Text(DateFormat('EEE,MMM,d').format(widget.record.dateTime),style: TextStyle(fontSize: 16,),),
        title: Center(child: Text(widget.record.weight.toString(),style: TextStyle(fontSize: 16),)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.edit,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
          ],
        ),
      ),
    );
  }
}
