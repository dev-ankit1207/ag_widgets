import 'dart:math';

import 'package:ag_widgets/utils.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
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
          color: imagePlaceholderColor[
              Random().nextInt(imagePlaceholderColor.length)],
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
        color: imagePlaceholderColor[
            Random().nextInt(imagePlaceholderColor.length)],
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
}
