import 'package:flutter/material.dart';

class SwipeLeftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Left Demo'),
      ),
      body: SwipeLeftDetector(
        onSwipeLeft: () {
          // Send message when swiped left
          sendMessage();
        },
        child: Center(
          child: Text('Swipe left on the screen'),
        ),
      ),
    );
  }

  void sendMessage() {
    // Implement your logic to send a message here
    print('Message sent!');
  }
}

class SwipeLeftDetector extends StatelessWidget {
  final VoidCallback onSwipeLeft;
  final Widget child;

  SwipeLeftDetector({required this.onSwipeLeft, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // Swiped left
          onSwipeLeft();
        }
      },
      child: child,
    );
  }
}
