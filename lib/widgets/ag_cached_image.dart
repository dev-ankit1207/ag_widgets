// Import necessary packages
import 'package:ag_widgets/widgets/ag_name_initial_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// Define a StatefulWidget for the cached image
class AgCachedImage extends StatefulWidget {
  // Declare variables
  final String? imageUrl; // URL of the image
  final double? height; // Height of the image
  final double? width; // Width of the image
  final String? fullName; // Full name associated with the image
  final BoxFit? boxFit; // BoxFit for the image
  final bool isCircle; // Whether the image should be circular
  final bool isShowName; // Whether to show the name initials
  final Widget? placeHolder; // Placeholder widget for the image
  final Widget? placeHoldChild; // Placeholder child widget
  final int? textSize; // Text size for name initials

  // Constructor for the AgCachedImage class
  AgCachedImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.textSize,
    this.fullName,
    this.isCircle = true,
    this.isShowName = false,
    this.boxFit,
    this.placeHolder,
    this.placeHoldChild,
  }) : super(key: key);

  @override
  State<AgCachedImage> createState() =>
      _AgCachedImageState(); // Create state for the widget
}

// Define the state for the AgCachedImage widget
class _AgCachedImageState extends State<AgCachedImage> {
  @override
  Widget build(BuildContext context) {
    // Determine border radius based on whether image is circular
    final double borderRadius = widget.isCircle ? 250 : 0;

    // Determine height and width of the image
    final double sizeHeight = widget.height ?? 50;
    final double sizeWidth = widget.width ?? 50;

    // Define background color for the placeholder
    final Color backgroundColor = Color(0xFFe4e9f0);

    // Define placeholder widget
    Widget placeHolderWidget = widget.placeHolder ??
        PlaceHolderWidget(
          height: sizeHeight,
          width: sizeWidth,
          color: backgroundColor,
          child: widget.placeHoldChild,
          borderRadius: widget.isCircle ? null : radius(borderRadius),
          shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
        );

    // Return ExtendedImage widget with network image
    return ExtendedImage.network(
      widget.imageUrl.validate(), // Validate and get the image URL
      height: sizeHeight,
      // Set height of the image
      width: sizeWidth,
      // Set width of the image
      fit: widget.boxFit ?? BoxFit.cover,
      // Set BoxFit for the image
      cache: true,
      // Enable caching of the image
      borderRadius: radius(borderRadius),
      // Set border radius for the image
      cacheHeight: sizeHeight.toInt(),
      // Set cached height of the image
      cacheWidth: sizeWidth.toInt(),
      // Set cached width of the image
      handleLoadingProgress: true,
      // Handle loading progress of the image
      enableLoadState: false,
      // Disable load state
      // Define loadStateChanged function to handle different load states
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading: // When image is in loading state
            return PlaceHolderWidget(
              height: sizeHeight,
              width: sizeWidth,
              color: backgroundColor,
              shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
            );
          case LoadState.completed: // When image loading is completed
            if (state.wasSynchronouslyLoaded) {
              return state.completedWidget; // Return completed widget
            }
          case LoadState.failed: // When image loading failed
            if (widget.isShowName) {
              // If show name initials is enabled
              return AgNameInitialWidget(
                name: widget.fullName.validate(value: ""),
                // Get validated full name
                isCircle: widget.isCircle,
                // Pass circle parameter
                height: sizeHeight,
                // Pass height parameter
                width: sizeWidth,
                // Pass width parameter
                maxInitials: 2,
                // Set maximum initials to display
                textSize: widget.textSize,
                // Pass text size parameter
                backgroundColor: [
                  backgroundColor
                ], // Set background color for initials
              );
            }
            return placeHolderWidget; // Return placeholder widget if show name initials is disabled
        }
        return null;
      },
      shape: widget.isCircle
          ? BoxShape.circle
          : BoxShape.rectangle, // Define shape of the image
    );
  }
}
