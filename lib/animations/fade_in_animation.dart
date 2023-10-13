import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Define an enum to represent animation properties
enum AniProps { opacity, translateY }

/// Info: that animates the opacity and vertical translation (Y-axis) of a child widget. It uses the simple_animations
///  package to create a fade-in effect with a specified delay. This widget can be used to animate the appearance of child widgets in a Flutter application.

// Create a custom Flutter widget for a fade-in animation
class FadeInAnimation extends StatelessWidget {
  final double delay; // The delay for the animation
  final Widget child; // The child widget to be animated

  // Constructor for the FadeInAnimation widget
  const FadeInAnimation({Key? key, required this.delay, required this.child}) : super(key: key);

  // Build method to create the animation widget
  @override
  Widget build(BuildContext context) {
    // Create a tween with animation properties
    final tween = MovieTween()
      ..tween<double>(
        AniProps.opacity,
        Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween<double>(
        AniProps.translateY,
        Tween<double>(begin: -30.0, end: 0.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );

    // Return a PlayAnimationBuilder widget to control the animation
    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      // Apply a delay to the animation
      duration: tween.duration,
      tween: tween,
      child: child,
      // The child widget to be animated
      builder: (_, Movie value, Widget? child) {
        return Opacity(
          opacity: value.get<double>(AniProps.opacity), // Apply opacity animation
          child: Transform.translate(
            offset: Offset(0, value.get<double>(AniProps.translateY)), // Apply translation animation
            child: child,
          ),
        );
      },
    );
  }
}
