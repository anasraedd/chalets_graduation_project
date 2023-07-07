import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoveableWidget extends StatefulWidget {
  @override
  _MoveableWidgetState createState() => _MoveableWidgetState();
}

class _MoveableWidgetState extends State<MoveableWidget> {
  double x = 0.0; // X position of the widget
  double y = 0.0; // Y position of the widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              // Update the position based on the drag gesture
             // x += details.delta.dx;
              y += details.delta.dy;
            });
          },
          child: Container(

            child: Text('Drag Me'),
            padding: EdgeInsets.all(16),
            color: Colors.blue,
            margin: EdgeInsets.only( top: y),
          ),
        ),
      ),
    );
  }
}
