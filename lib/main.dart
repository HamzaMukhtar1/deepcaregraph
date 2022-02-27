
import 'package:deepcaregraph/pages/graph_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Care Graph',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GraphPage(),
    );
  }
}

