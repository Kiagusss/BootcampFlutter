import 'package:flutter/material.dart';

class CatLandingAnimation extends StatefulWidget {
  const CatLandingAnimation({super.key});

  @override
  _CatLandingAnimationState createState() => _CatLandingAnimationState();
}

class _CatLandingAnimationState extends State<CatLandingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -100,
      end: 100.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0.0, _animation.value),
                child: const Center(
                  child: Icon(
                    Icons.pest_control_outlined,
                    size: 100,
                  ),
                ),
              );
            }));
  }
}
