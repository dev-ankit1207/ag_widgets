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
  final bool
      isCircle; // Indicates whether the widget should have a circular shape.
  final int? textSize; // The text size for the initials.

  // Constructor for the AgNameInitialWidget class
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
    // Get initials from the name
    String initials = _getInitials(name);
    // Return container widget displaying the initials
    return Container(
      width: height,
      // Set width of the container
      height: width,
      // Set height of the container
      padding: EdgeInsets.all(4),
      // Set padding for the container
      decoration: BoxDecoration(
        // Define decoration for the container
        color: backgroundColor != null
            ? backgroundColor![Random.secure().nextInt(backgroundColor!.length)]
            : imagePlaceholderColor[
                Random.secure().nextInt(lightColors.length)],
        shape: isCircle
            ? BoxShape.circle
            : BoxShape.rectangle, // Define shape of the container
        border: Border.all(
            color: Colors.white, width: 1), // Define border properties
        borderRadius: isCircle ? null : radius(), // Define border radius
      ),
      // Display the initials at the center of the container
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth, // Define fit for the text
          child: Text(
            initials, // Display initials
            style: boldTextStyle(
                color: textColor,
                weight: FontWeight.bold,
                size: textSize), // Define text style
          ),
        ),
      ),
    );
  }

  // Function to get initials from the name
  String _getInitials(String name) {
    List<String> nameParts = name.split(' '); // Split name into parts
    String initials = '';

    // Iterate through name parts to get initials
    for (String part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0]
            .toUpperCase(); // Append first character of each part to initials
        if (initials.length >= maxInitials) {
          break; // Break loop if maximum initials limit reached
        }
      }
    }

    return initials; // Return generated initials
  }
}
