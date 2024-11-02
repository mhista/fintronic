import 'package:fintronic/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class PCircularImage extends StatelessWidget {
  const PCircularImage({
    super.key,
    required this.imageUrl,
    this.width = 56,
    this.height = 56,
    this.padding = PSizes.sm,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.overLayColor,
    this.useGradient = false,
    this.borderRadius = 100,
    this.applyImageRadius = true,
  });

  final String imageUrl;
  final double width, height, padding;
  final bool isNetworkImage, useGradient;
  final Color? backgroundColor;
  final BoxFit? fit;
  final Color? overLayColor;
  final double borderRadius;
  final bool applyImageRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      useContainerGradient: useGradient,
      radius: 100,
      backgroundColor:
          backgroundColor ?? (isDark ? PColors.black : PColors.white),
      child: Center(
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              color: overLayColor),
        ),
      ),
    );
  }
}
