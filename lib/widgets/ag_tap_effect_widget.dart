// Import necessary packages
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Define the AgTapEffect widget
class AgTapEffect extends StatefulWidget {
  // Declare variables
  final Widget child; // Child widget on which tap effect is applied
  final bool enableRipple; // Enable/disable ripple effect
  final VoidCallback onTap; // Callback function for tap event
  final HitTestBehavior? behavior; // Behavior for hit testing
  final bool excludeFromSemantics; // Whether to exclude from semantics
  final DragStartBehavior dragStartBehavior; // Drag start behavior
  final bool
      trackpadScrollCausesScale; // Whether trackpad scroll causes scaling
  final Offset
      trackpadScrollToScaleFactor; // Factor for trackpad scroll to scale

  // Constructor for the AgTapEffect class
  const AgTapEffect({
    Key? key,
    required this.child,
    this.enableRipple = true,
    required this.onTap,
    this.behavior,
    this.excludeFromSemantics = false,
    this.dragStartBehavior = DragStartBehavior.start,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
  }) : super(key: key);

  @override
  _AgTapEffectState createState() =>
      _AgTapEffectState(); // Create state for the widget
}

// Define the state for the AgTapEffect widget
class _AgTapEffectState extends State<AgTapEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _controller; // Animation controller for ripple effect

  @override
  void initState() {
    super.initState();
    _init(); // Initialize the animation controller
  }

  // Initialize the animation controller
  void _init() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(
        () {
          if (mounted) {
            setState(() {});
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector for handling tap events with optional customization
    return GestureDetector(
      behavior: widget.behavior,
      excludeFromSemantics: widget.excludeFromSemantics,
      dragStartBehavior: widget.dragStartBehavior,
      trackpadScrollCausesScale: widget.trackpadScrollCausesScale,
      trackpadScrollToScaleFactor: widget.trackpadScrollToScaleFactor,
      onTap: _handleTap,
      // Handle onTap event
      child: widget.enableRipple ? _buildRippleWidget() : _buildChild(),
    );
  }

  // Builds the ripple effect widget using Listener
  Widget _buildRippleWidget() {
    return Listener(
      onPointerDown: (_) =>
          _controller.forward(), // Animate ripple effect on pointer down
      onPointerUp: (_) =>
          _controller.reverse(), // Reverse animation on pointer up
      child: _buildChild(), // Build child widget
    );
  }

  // Builds the child widget with optional scaling transformation
  Widget _buildChild() {
    return Transform.scale(
      scale: 1 - _controller.value, // Scale based on animation value
      child: widget.child, // Display child widget
    );
  }

  // Handle onTap event by invoking the provided callback
  void _handleTap() {
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose animation controller
    super.dispose();
  }
}
