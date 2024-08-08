import 'package:ag_widgets/widgets/ag_name_initial_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AgCachedImage extends StatefulWidget {
  final String? imageUrl; // URL of the image
  final double? height; // Height of the image
  final double? width; // Width of the image
  final String? fullName; // Full name associated with the image
  final BoxFit? boxFit; // BoxFit for the image
  final bool isCircle; // Whether the image should be circular
  final bool isShowName; // Whether to show the name initials
  final Widget? placeHolder; // Placeholder widget for the image
  final Widget? placeHoldChild; // Placeholder child widget
  final double? textSize; // Text size for name initials
  final double? radius;
  final List<Color>? backgroundColorList;
  final Color? backgroundColor;

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
    this.radius,
    this.placeHoldChild,
    this.backgroundColorList,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<AgCachedImage> createState() => _CommonCachedImageState();
}

class _CommonCachedImageState extends State<AgCachedImage> {
  @override
  Widget build(BuildContext context) {
    final double borderRadius = widget.isCircle ? 250 : (widget.radius ?? 0);

    final double sizeHeight = widget.height ?? 50;
    final double sizeWidth = widget.width ?? 50;

    final Color backgroundColor = widget.backgroundColor ?? (widget.backgroundColorList!.first);

    Widget placeHolderWidget = widget.placeHolder ??
        PlaceHolderWidget(
          height: sizeHeight,
          width: sizeWidth,
          color: backgroundColor,
          child: widget.placeHoldChild,
          borderRadius: widget.isCircle ? null : radius(borderRadius),
          shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
    return ExtendedImage.network(
      widget.imageUrl.validate(),
      height: sizeHeight,
      width: sizeWidth,
      fit: widget.boxFit ?? BoxFit.cover,
      cache: true,
      borderRadius: radius(borderRadius),
      handleLoadingProgress: true,
      enableLoadState: false,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return PlaceHolderWidget(
              height: sizeHeight,
              width: sizeWidth,
              color: backgroundColor,
              shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
            );
          case LoadState.completed:
            if (state.wasSynchronouslyLoaded) {
              return state.completedWidget; // Return completed widget
            }
          case LoadState.failed: // When image loading failed
            if (widget.isShowName) {
              // If show name initials is enabled
              return AgNameInitialWidget(
                name: widget.fullName.validate(value: ""),
                isCircle: widget.isCircle,
                height: sizeHeight,
                width: sizeWidth,
                maxInitials: 2,
                textSize: widget.textSize,
                textColor: Colors.white,
                backgroundColor: widget.backgroundColorList ?? (widget.backgroundColor != null ? [widget.backgroundColor!] : null),
              );
            }
            return placeHolderWidget;
        }
        return null;
      },
      shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
    );
  }
}
