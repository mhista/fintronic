import 'package:flutter/material.dart';
import 'package:fintronic/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fintronic/utils/constants/colors.dart';

import '../containers/rounded_container.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.width = 319,
    this.height = 61,
    this.radius = 20,
    required this.child,
    required this.onPressed,
  });
  final double width, height, radius;
  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        width: width,
        height: height,
        radius: radius,
        gradient: PColors.generalGradient,
        useContainerGradient: false,
        child: Center(
         child: child,),
      ),
    );
  }
}
