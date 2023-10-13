import 'dart:math';

import 'package:ag_widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class NameInitialWidget extends StatelessWidget {
  final String name;
  final double height;
  final double width;
  final int maxInitials;
  final List<Color>? backgroundColor;
  final Color textColor;
  final bool isCircle;

  NameInitialWidget({
    Key? key,
    required this.name,
    this.height = 48.0,
    this.width = 48.0,
    this.maxInitials = 1,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initials = _getInitials(name);
    return Container(
      width: height,
      height: width,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor![Random.secure().nextInt(backgroundColor!.length)]
            : imagePlaceholderColor[
                Random.secure().nextInt(lightColors.length)],
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: isCircle ? null : radius(),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            initials,
            style: boldTextStyle(
              color: textColor,
              weight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';

    for (String part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
        if (initials.length >= maxInitials) {
          break;
        }
      }
    }

    return initials;
  }
}
