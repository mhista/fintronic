import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class PRoundedImage extends StatelessWidget {
  const PRoundedImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.applyImageRadius = true,
      this.isNetworkImage = false,
      this.backgroundColor = PColors.light,
      this.fit = BoxFit.fill,
      this.padding,
      this.onPressed,
      this.border,
      this.borderRadius = PSizes.md,
      this.usePadding = true,
      this.imageHeight,
      this.imageWidth});
  final String imageUrl;
  final double? width, height, imageHeight, imageWidth;
  final bool applyImageRadius, isNetworkImage, usePadding;
  final Color backgroundColor;
  final BoxFit? fit;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: usePadding
            ? const EdgeInsets.symmetric(horizontal: PSizes.sm)
            : const EdgeInsets.all(0),
        child: Container(
          padding: padding,
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Image(
              height: imageHeight,
              width: imageWidth,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider,
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
