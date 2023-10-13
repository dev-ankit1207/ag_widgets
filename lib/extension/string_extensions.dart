import 'dart:math';

import 'package:ag_widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtension on String {
  ///This extension function is used to create an Image widget from a URL (if the string starts with "http") or from an asset path.
  ///If the string is a URL (starts with "http"), it creates an Image.network widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  // If the string is not a URL, it assumes it's an asset path and creates an Image.asset widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  Image iconImage({
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
  }) {
    if (this.startsWith("http")) {
      return Image.network(
        this,
        height: height ?? 24,
        width: width ?? 24,
        fit: fit ?? BoxFit.contain,
        color: color,
        errorBuilder: (context, error, stackTrace) => Placeholder(
          color: imagePlaceholderColor[Random().nextInt(imagePlaceholderColor.length)],
          fallbackHeight: height ?? 24,
          fallbackWidth: width ?? 24,
          strokeWidth: 1,
          child: SizedBox(
            height: height ?? 24,
            width: width ?? 24,
          ),
        ),
      );
    }
    return Image.asset(
      this,
      height: height ?? 24,
      width: width ?? 24,
      fit: fit ?? BoxFit.cover,
      color: color,
      errorBuilder: (context, error, stackTrace) => Placeholder(
        color: imagePlaceholderColor[Random().nextInt(imagePlaceholderColor.length)],
        fallbackHeight: height ?? 24,
        fallbackWidth: width ?? 24,
        strokeWidth: 1,
        child: SizedBox(
          height: height ?? 24,
          width: width ?? 24,
        ),
      ),
    );
  }

  /// This extension function is used to create an SvgPicture widget from a URL (if the string starts with "http") or from an asset path.
  ///If the string is a URL (starts with "http"), it creates an SvgPicture.network widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  // If the string is not a URL, it assumes it's an asset path and creates an SvgPicture.asset widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  SvgPicture svgIconImage({
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
  }) {
    if (this.startsWith("http")) {
      return SvgPicture.network(
        this,
        height: height ?? 24,
        width: width ?? 24,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (context) => Placeholder(
          color: imagePlaceholderColor[Random().nextInt(imagePlaceholderColor.length)],
          fallbackHeight: height ?? 24,
          fallbackWidth: width ?? 24,
          strokeWidth: 1,
          child: SizedBox(
            height: height ?? 24,
            width: width ?? 24,
          ),
        ),
      );
    }
    return SvgPicture.asset(
      this,
      height: height ?? 24,
      width: width ?? 24,
      fit: fit ?? BoxFit.cover,
      placeholderBuilder: (context) {
        return Placeholder(
          color: imagePlaceholderColor[Random().nextInt(imagePlaceholderColor.length)],
          fallbackHeight: height ?? 24,
          fallbackWidth: width ?? 24,
          strokeWidth: 1,
          child: SizedBox(
            height: height ?? 24,
            width: width ?? 24,
          ),
        );
      },
    );
  }
}
