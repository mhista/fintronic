import 'package:flutter/material.dart';

// using staggered animation
class ListSlideAnimation extends StatefulWidget {
  const ListSlideAnimation(
      {super.key,
      required this.index,
      required this.itemCount,
      required this.child,
      this.curve,
      this.duration});

  final int index, itemCount;
  final Widget child;
  final Curve? curve;
  final Duration? duration;
  @override
  State<ListSlideAnimation> createState() => _ListSlideAnimationState();
}

class _ListSlideAnimationState extends State<ListSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late List<Animation<Offset>> listAnimation = [];
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 1500),
    );

    // slideAnimation = ;

    listAnimation = List.generate(
      widget.itemCount,
      (index) => Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(index * (1 / widget.itemCount), 1,
                curve: widget.curve ?? Curves.easeIn)),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: listAnimation[widget.index],
      child: widget.child,
    );
  }
}
