

import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
  late TextEditingController startPriceController;
  late TextEditingController endPriceController;
  PriceRangeSlider(this.startPriceController, this.endPriceController);
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _startValue =0;
  double _endValue = 1200;
  RangeValues _selectedRange = RangeValues(0, 700);


  // late TextEditingController startPriceController;
  // late TextEditingController endPriceController;


  void _onRangeChanged(RangeValues values) {
    setState(() {
      _startValue = values.start;
      _endValue = values.end;
      widget.startPriceController.text = '${_startValue}\$'; // Set the initial value here
widget.endPriceController.text = '${_endValue}\$';

    });
  }



  void _onStartPointTap() {
    // Handle start point tap event
    print('Start point tapped');
  }

  void _onEndPointTap() {
    // Handle end point tap event
    print('End point tapped');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        // Calculate the relative position of the tap within the slider
        final RenderBox box = context.findRenderObject() as RenderBox;
        final double tapPosition = box.globalToLocal(details.globalPosition).dx;

        // Calculate the percentage of the tap position within the slider
        final double percentage = tapPosition / box.size.width;

        // Calculate the actual value based on the percentage and the range
        final double value = _startValue + (_endValue - _startValue) * percentage;

        // Determine if the tap was closer to the start or end point and handle accordingly
        if ((value - _startValue).abs() < (value - _endValue).abs()) {
          setState(() {
           // _startValue = value;
          });
          _onStartPointTap();
        } else {
          setState(() {
          //  _endValue = value;
          });
          _onEndPointTap();
        }
      },
      child: SliderTheme(
        data: SliderThemeData(
          thumbColor: Colors.white,
           overlayColor: primaryColor,
          overlappingShapeStrokeColor: primaryColor,



        ),
        child: Column(
          children: [

            RangeSlider(

              values:  RangeValues( double.parse('${extractSubstring(widget.startPriceController.text)}'), double.parse('${extractSubstring(widget.endPriceController.text)}')),
              min: 0,
              max: 1200,
              onChanged: _onRangeChanged,
              divisions: 30,
              labels: RangeLabels(
                _startValue.toStringAsFixed(2),
                _endValue.toStringAsFixed(2),
              ),
              //activeColor: primaryColor,
              //inactiveColor: Color(0xFF999999),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(child: TextField(
controller: widget.startPriceController,

                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('_'),
                  ),
                  Expanded(child:TextField(
                    controller: widget.endPriceController,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String extractSubstring(String text) {
    final dollarIndex = text.indexOf('\$');
    if (dollarIndex != -1) {
      return text.substring(0, dollarIndex);
    }
    return text;
  }

}
