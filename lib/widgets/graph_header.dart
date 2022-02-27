import 'dart:math';
import 'package:flutter/material.dart';

class GraphHeader extends StatelessWidget {
  const GraphHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 150.0,
      color: Theme.of(context).primaryColor.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Day'),
          const Text('Date'),
          const SizedBox(height: 24.0),
          Container(
            width: double.infinity,
            // color: Theme.of(context).primaryColor.withOpacity(0.4),
            height: min(MediaQuery.of(context).size.height * 0.5, 400.0),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 70 /
                      100 *
                      min(MediaQuery.of(context).size.height * 0.5, 400.0),
                  child: Center(child: Text('Ziel')),
                ),
              ],
            ),
          ),
          Container(height: 2.0, color: Colors.white, width: double.infinity),
          const SizedBox(height: 24.0),
          const Text('MET'),
          const SizedBox(height: 12.0),
          const Text('km joggen'),
        ],
      ),
    );
  }
}

enum MColor { green, pink, blue }
