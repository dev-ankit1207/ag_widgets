import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Custom Flutter widget for a circular container with various customization options
class CircleWidget extends StatelessWidget {
  final double size; // Diameter of the circular widget
  final Color? backgroundColor; // Background color of the circular widget
  final Color? borderColor; // Color of the border around the circular widget
  final double borderWidth; // Width of the border around the circular widget
  final Widget? child; // Child widget inside the circular container
  final List<BoxShadow>? shadows; // List of box shadows for the circular widget

  // Constructor for the CircleWidget class
  CircleWidget({
    this.size = 50.0, // Default size is 50.0
    this.backgroundColor =
        Colors.transparent, // Default background color is transparent
    this.borderColor, // Border color (default is null)
    this.borderWidth = 0.0, // Default border width is 0.0
    this.child, // Child widget (default is null)
    this.shadows, // List of shadows (default is null)
  });

  @override
  Widget build(BuildContext context) {
    // Build and return the circular widget
    return DecoratedBox(
      decoration: ShapeDecoration(
        color: backgroundColor,
        shadows: shadows,
        shape: OvalBorder(
            side: BorderSide(
                width: borderWidth,
                color: borderColor ?? context.dividerColor)),
      ),
      child: child,
    ).withSize(width: size, height: size);
  }
}
