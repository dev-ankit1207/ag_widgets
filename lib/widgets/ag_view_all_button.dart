// Import necessary packages
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Define the ViewAllButton widget
class AgViewAllButton extends StatelessWidget {
  // Declare variables
  final String title; // Title text for the button
  final String? viewAllText; // Text for "View All" option
  final Widget? titleWidget; // Widget to display as title
  final int textSize; // Text size for the title
  final Color? textColor; // Text color for the title
  final TextStyle? titleTextStyle; // Text style for the title
  final Function() onTap; // Function to execute on tap
  final bool showViewAll; // Whether to show "View All" option
  final EdgeInsets? padding; // Padding for the button
  final bool hideViewAllIcon; // Whether to hide the arrow icon for "View All"

  // Constructor for the AgViewAllButton class
  const AgViewAllButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.titleTextStyle,
    this.textSize = 18,
    this.viewAllText,
    this.titleWidget,
    this.textColor,
    this.padding,
    this.showViewAll = true,
    this.hideViewAllIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return a padding widget containing a row with the button elements
    return Padding(
      // Use provided padding or default to 16 on all sides
      padding: padding ?? const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Align elements horizontally at the center
        crossAxisAlignment: CrossAxisAlignment.center, // Align elements vertically at the center
        children: [
          Expanded(
            child: titleWidget ??
                Text(
                  // Display the title, validating for null or empty string
                  title.validate(),
                  style: titleTextStyle ?? boldTextStyle(size: textSize, color: textColor),
                ),
          ),
          if (showViewAll) // If "View All" option is enabled
            GestureDetector(
              // Respond to the user's tap on this widget
              onTap: onTap,
              child: Row(
                children: [
                  // Display "View All" text with provided style or default
                  Text(viewAllText ?? "View All", style: secondaryTextStyle(size: 12)),
                  if (!hideViewAllIcon)
                    // Optionally display an arrow icon (if not hidden)
                    Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
