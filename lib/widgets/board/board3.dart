import 'package:flutter/material.dart';

class Board3 extends StatelessWidget {
  const Board3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/board3.jpeg"),
              fit: BoxFit.cover)),

    );
  }
}
