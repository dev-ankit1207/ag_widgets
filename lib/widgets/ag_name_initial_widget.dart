import 'dart:math';

import 'package:ag_widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// The `AgNameInitialWidget` is a Flutter widget that displays the initials of a person's name within a container.
/// It is often used as a placeholder for user avatars or profile pictures. The widget allows customization of
/// the background color, text color, shape (circle or rectangle), and the maximum number of initials displayed.
class AgNameInitialWidget extends StatelessWidget {
  final String name; // The name used to generate initials.
  final double height; // The height of the widget.
  final double width; // The width of the widget.
  final int maxInitials; // The maximum number of initials to display.
  final List<Color>? backgroundColor; // List of background colors (optional).
  final Color textColor; // The text color for the initials.
  final bool isCircle; // Indicates whether the widget should have a circular shape.
  final double? textSize;

  AgNameInitialWidget({
    Key? key,
    required this.name,
    this.height = 48.0,
    this.width = 48.0,
    this.maxInitials = 1,
    this.backgroundColor,
    this.textSize,
    this.textColor = Colors.white,
    this.isCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initials = _getInitials(name);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor![Random.secure().nextInt(backgroundColor!.length)] : imagePlaceholderColor[Random.secure().nextInt(lightColors.length)],
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : radius(),
      ),
      child: Center(
        child: Text(
          initials,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: textSize),
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
