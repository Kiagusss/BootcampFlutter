import 'package:flutter/material.dart';

class InfiniteLoopAnimation extends StatefulWidget {
  const InfiniteLoopAnimation({super.key});

  @override
  _InfiniteLoopAnimationState createState() => _InfiniteLoopAnimationState();
}

class _InfiniteLoopAnimationState extends State<InfiniteLoopAnimation> {
  bool _toggle = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _toggle = !_toggle;
      });
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        child: _toggle
            ? const Icon(Icons.star,
                key: ValueKey(1), size: 50, color: Colors.yellow)
            : const Icon(Icons.star_border,
                key: ValueKey(2), size: 50, color: Colors.grey),
      ),
    );
  }
}
