import 'package:flutter/material.dart';
class DashedLine extends StatelessWidget {
  final int width;

  DashedLine({this.width = 9});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < width; i++)
            Container(
              height: 1.0,
              width: 10.0,
              margin: EdgeInsets.symmetric(horizontal: 2.0),

              color: Colors.black,
            ),
        ],
      ),
    );
  }
}