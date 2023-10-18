import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ViewAllButton extends StatelessWidget {
  final String title;
  final String? viewAllText;
  final Widget? titleWidget;
  final int textSize;
  final Color? textColor;

  final TextStyle? titleTextStyle;
  final Function() onTap;
  final bool showViewAll;
  final EdgeInsets? padding;
  final bool hideViewAllIcon;

  // Constructor for the ViewAllWidget
  const ViewAllButton({
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
    return Padding(
      // Use provided padding or default to 16 on all sides
      padding: padding ?? const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: titleWidget ??
                Text(
                  // Display the title, validating for null or empty string
                  title.validate(),
                  style: titleTextStyle ??
                      boldTextStyle(size: textSize, color: textColor),
                ),
          ),
          if (showViewAll)
            GestureDetector(
              // Respond to the user's tap on this widget
              onTap: onTap,
              child: Row(
                children: [
                  // Display "View All" text with provided style or default
                  Text(viewAllText ?? "View All",
                      style: secondaryTextStyle(size: 12)),
                  if (!hideViewAllIcon)
                    // Optionally display an arrow icon (if not hidden)
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: textSecondaryColorGlobal, size: 10),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
