import 'dart:math';

import 'package:deepcaregraph/extensions/e_datetime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../modals/info.dart';
import '../dotted_line.dart';

class GraphTile extends StatefulWidget {
  final double width;
  final Info info;

  const GraphTile({
    Key? key,
    required this.info,
    this.width = 200.0,
  }) : super(key: key);

  @override
  State<GraphTile> createState() => _GraphTileState();
}

class _GraphTileState extends State<GraphTile> {
  bool _isOnScreen = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.info),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0) {
          setState(() {
            _isOnScreen = true;
          });
        }
      },
      child: Container(
        height: double.infinity,
        width: widget.width,
        color: Theme.of(context).primaryColor.withOpacity(0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.info.date.toFormat() + ','),
            Text(widget.info.date.toFormat(patten: 'MM.dd.')),
            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              // color: Theme.of(context).primaryColor.withOpacity(0.4),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    width: widget.width,
                    alignment: Alignment.center,
                    child: Container(
                      // color: Theme.of(context).primaryColor.withOpacity(0.4),
                      height: _graphSize,
                      width: widget.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height:
                                !_isOnScreen ? 0 : _barValue(widget.info.green),
                            width: _graphBarWidth,
                            decoration: BoxDecoration(
                              gradient: _gradient(MColor.green),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height:
                                !_isOnScreen ? 0 : _barValue(widget.info.pink),
                            width: _graphBarWidth,
                            decoration: BoxDecoration(
                              gradient: _gradient(MColor.pink),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height:
                                !_isOnScreen ? 0 : _barValue(widget.info.blue),
                            width: _graphBarWidth,
                            decoration: BoxDecoration(
                              gradient: _gradient(MColor.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70 / 100 * _graphSize,
                    child: DottedLine(
                      totalWidth: widget.width,
                      dashColor: Colors.white,
                      dashHeight: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 2.0, color: Colors.white, width: double.infinity),
            const SizedBox(height: 24.0),
            Text(widget.info.met.toString()),
            const SizedBox(height: 12.0),
            Text(widget.info.jogging.toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }

  double _barValue(num value) => value / 100 * _graphSize;

  double get _graphSize => min(MediaQuery.of(context).size.height * 0.5, 400.0);

  double get _graphBarWidth => widget.width * 0.5 * 0.3;

  LinearGradient _gradient(MColor mColor) {
    List<Color> _colors = [];
    if (mColor == MColor.blue) {
      _colors = [
        const Color(0xff5945ed),
        const Color(0xff55a2d1),
      ];
    } else if (mColor == MColor.green) {
      _colors = [
        const Color(0xff18726f),
        const Color(0xff34c4a0),
      ];
    } else {
      _colors = [
        const Color(0xffd23f8c),
        const Color(0xffff8087),
      ];
    }
    return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: _colors,
    );
  }
}

enum MColor { green, pink, blue }
