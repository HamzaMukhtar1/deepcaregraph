import 'dart:math';

import 'package:deepcaregraph/modals/info.dart';
import 'package:deepcaregraph/widgets/graph_header.dart';
import 'package:deepcaregraph/widgets/tiles/graph_tile.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<Info> _userData = [];

  @override
  void initState() {
    super.initState();
    _userData = [
      Info(
          date: _dateByIndex(0),
          green: 75,
          pink: 45,
          blue: 78,
          met: 230,
          jogging: 2.7),
      Info(
          date: _dateByIndex(1),
          green: 74,
          pink: 75,
          blue: 86,
          met: 234,
          jogging: 4.7),
      Info(
          date: _dateByIndex(2),
          green: 80,
          pink: 67,
          blue: 67,
          met: 222,
          jogging: 3.7),
      Info(
          date: _dateByIndex(3),
          green: 75,
          pink: 66,
          blue: 85,
          met: 244,
          jogging: 4.3),
      Info(
          date: _dateByIndex(4),
          green: 76,
          pink: 64,
          blue: 88,
          met: 230,
          jogging: 4.2),
      Info(
          date: _dateByIndex(5),
          green: 56,
          pink: 60,
          blue: 77,
          met: 244,
          jogging: 3.7),
      Info(
          date: _dateByIndex(6),
          green: 67,
          pink: 59,
          blue: 74,
          met: 245,
          jogging: 3.7),
      Info(
          date: _dateByIndex(7),
          green: 67,
          pink: 56,
          blue: 70,
          met: 230,
          jogging: 4.7),
      Info(
          date: _dateByIndex(8),
          green: 78,
          pink: 64,
          blue: 76,
          met: 235,
          jogging: 3.7),
      Info(
          date: _dateByIndex(9),
          green: 56,
          pink: 67,
          blue: 77,
          met: 230,
          jogging: 3.7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        reverse: true,
        itemCount: _userData.length + 2,
        itemBuilder: (context, i) {
          if (i == 0) return const GraphHeader();
          if (i == _userData.length + 1) {
            return Container(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                alignment: Alignment.center,
                child: TextButton(
                  child: const Text('Load\nMore'),
                  onPressed: _loadMoreItems,
                ));
          }
          return GraphTile(
            info: _userData[i - 1],
            width: 150.0,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  void _loadMoreItems() {
    for (int i = 0; i < 10; i++) {
      _userData.add(
        Info(
            date: _dateByIndex(_userData.length + 1),
            green: _randomInt(60, 80),
            pink: _randomInt(40, 70),
            blue: _randomInt(60, 80),
            met: _randomInt(200, 230),
            jogging: _randomDouble(2, 4)),
      );
    }
    setState(() {});
  }

  int _randomInt(min, max) {
    return min + Random().nextInt(max - min);
  }

  double _randomDouble(min, max) {
    int value = min + Random().nextInt(max - min);
    return value * 1.2;
  }

  DateTime _dateByIndex(int index) {
    return DateTime.now().subtract(Duration(days: index));
  }
}
