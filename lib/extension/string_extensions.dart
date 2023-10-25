import 'dart:math';

import 'package:ag_widgets/utils.dart';
import 'package:ag_widgets/utils/enmus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtension on String {
  ///This extension function is used to create an Image widget from a URL (if the string starts with "http") or from an asset path.
  ///If the string is a URL (starts with "http"), it creates an Image.network widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  /// If the string is not a URL, it assumes it's an asset path and creates an Image.asset widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
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
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) =>
                Placeholder(
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

  /// This extension function is used to create an SvgPicture widget from a URL (if the string starts with "http") or from an asset path.
  ///If the string is a URL (starts with "http"), it creates an SvgPicture.network widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
  /// If the string is not a URL, it assumes it's an asset path and creates an SvgPicture.asset widget with the specified attributes. If there is an error loading the image, it shows a placeholder with a random color.
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
        colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
        placeholderBuilder: (context) => Placeholder(
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
    return SvgPicture.asset(
      this,
      height: height ?? 24,
      width: width ?? 24,
      fit: fit ?? BoxFit.cover,
      colorFilter: ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),
      placeholderBuilder: (context) {
        return Placeholder(
          color: imagePlaceholderColor[
              Random().nextInt(imagePlaceholderColor.length)],
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

// Wraps a string with brackets based on the specified BracketType and returns the result.

  String wrapWithBracket(BracketType type) {
    switch (type) {
      // Wrap with round brackets.
      case BracketType.Rounded:
        return "($this)";

      // Wrap with square brackets.
      case BracketType.Square:
        return "[$this]";

      // Wrap with curly brackets.
      case BracketType.Curly:
        return "{$this}";

      // Wrap with angle brackets.
      case BracketType.Angle:
        return "<$this>";

      // Wrap with single quotes.
      case BracketType.SingleQuote:
        return "'$this'";

      // Wrap with double quotes.
      case BracketType.DoubleQuote:
        return "\"$this\"";
    }
  }

  // Combines words in a string with a special character and returns the result in lowercase.
  String combineWordsWithSpecialChar(String specialCharacter) {
    // Split the input string into a list of words.
    final List<String> words = this.split(' ');

    // Join the words in the list using the provided special character.
    final String result = words.join(specialCharacter);

    // Convert the result to lowercase and return it.
    return result;
  }
}
