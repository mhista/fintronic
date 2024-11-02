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
    this.showBorder = false,
    this.borderWidth = 0.5,
    this.useContainerGradient = true,
    this.backgroundColor,
  });
  final double width, height, radius;
  final Widget child;
  final bool showBorder, useContainerGradient;
  final double borderWidth;
  final Color? backgroundColor;

  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: TRoundedContainer(
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        radius: radius,
        gradient: useContainerGradient ? PColors.generalGradient : null,
        showBorder: showBorder,
        borderWidth: borderWidth,
        useContainerGradient: false,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
