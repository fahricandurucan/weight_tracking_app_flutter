import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weight_tracking_app/screens/adding_page.dart';
import 'package:weight_tracking_app/screens/graph_page.dart';
import 'package:weight_tracking_app/screens/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var icons = [Icons.auto_graph,Icons.home];


  int a  = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: a == 0 ? GraphPage() : HistoryPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add,size: 30,color: a == 3 ? Colors.yellow : Colors.white,),
        onPressed: (){
          Get.to(AddingPage());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height/10, //ekranın 10 da 1 i büyüklüğünde
          icons: icons,
          iconSize: 30,
          activeIndex: a,
          onTap: (index){ setState(() {a = index;});},
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          backgroundColor: Colors.green,
          activeColor: Colors.yellow,
          inactiveColor: Colors.white,
      ),
    );
  }
}
