import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
late double height;
late double width;
Color? baseColor;
Color? highlightColor;
    EdgeInsetsDirectional? margin;
BoxDecoration? decoration;

  ShimmerLoadingWidget(
      {required this.height,
        required this.width,
         this.baseColor,
        this.highlightColor,
        this.margin,
        this.decoration});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(

      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: Container(
        clipBehavior: Clip.hardEdge,

        margin: margin ?? EdgeInsets.all(0),
        width: width, // Adjust the size based on your preference
        height: height,

        decoration: decoration ??
            const BoxDecoration(
              color: Colors.white,
            ),

      ),);
  }
}
