import 'package:flutter/material.dart';

// using staggered animation
class SlideAnimation extends StatefulWidget {
  const SlideAnimation(
      {super.key,
      required this.child,
      this.curve,
      this.duration,
      this.begin,
      this.end});

  final Widget child;
  final Curve? curve;
  final Duration? duration;
  final Offset? begin, end;
  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  // late Offset offset =;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 1500),
    );

    // slideAnimation = ;

    slideAnimation = Tween<Offset>(
      begin: widget.begin ?? const Offset(0, 1),
      end: widget.end ?? Offset.zero,
    ).animate(CurvedAnimation(
        parent: controller, curve: widget.curve ?? Curves.easeIn));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: widget.child,
    );
  }
}
