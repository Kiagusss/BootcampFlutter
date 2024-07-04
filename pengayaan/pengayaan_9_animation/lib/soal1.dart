import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _width = 100;
  double _height = 100;

  void _animateContainer() {
    setState(() {
      _width = Random().nextInt(300).toDouble();
      _height = Random().nextInt(300).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              width: _width,
              height: _height,
              color: Colors.blue,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: _animateContainer, child: const Text("Push me"))
        ],
      ),
    );
  }
}
