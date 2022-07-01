import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  Widget child;
  int milliSecondsDuration;
  double opacityEndValue;
  double translateEndValue;
  double translateStartValue;
  double dirctionAxisX;
  double dirctionAxisY;
  FadeAnimation({
    required this.milliSecondsDuration,
    required this.child,
    this.opacityEndValue = 1,
    this.translateEndValue = 0,
    this.translateStartValue = 0,
    this.dirctionAxisX = 1.0,
    this.dirctionAxisY = 1.0,
  });

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _opacityAnimation;
  late Animation _trenslateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.milliSecondsDuration));

    _opacityAnimation = Tween(begin: 0.0, end: widget.opacityEndValue)
        .animate(_animationController)
      ..addListener(() {});
    _trenslateAnimation =
        Tween(begin: widget.translateStartValue, end: widget.translateEndValue)
            .animate(_animationController)
          ..addListener(() {});
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (contex, widget) {
          return Container(
            transform: Matrix4.identity()
              ..translate(
                  (_trenslateAnimation.value * this.widget.dirctionAxisX),
                  (_trenslateAnimation.value * this.widget.dirctionAxisY)),
            child: Opacity(
                opacity: (_opacityAnimation.value * 1.0),
                child: this.widget.child),
          );
        });
  }
}
