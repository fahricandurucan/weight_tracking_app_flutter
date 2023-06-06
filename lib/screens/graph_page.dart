import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GRAPH"),
        centerTitle: true,
      ),
      body: Center(child: Text("Graph Page"),),
    );
  }
}
