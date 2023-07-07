import 'package:flutter/material.dart';

class Board4 extends StatelessWidget {
  const Board4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/board4.jpeg"),
              fit: BoxFit.cover)),

    );
  }
}
