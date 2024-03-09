import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TapEffectWidget extends StatefulWidget {
  final Widget child;
  final bool enableRipple;
  final VoidCallback onTap;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;
  final DragStartBehavior dragStartBehavior;
  final bool trackpadScrollCausesScale;
  final Offset trackpadScrollToScaleFactor;

  // Constructor with optional parameters for customization
  const TapEffectWidget({
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
  _TapEffectWidgetState createState() => _TapEffectWidgetState();
}

class _TapEffectWidgetState extends State<TapEffectWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _init();
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
      onTap: _handleTap, // Handle onTap event
      child: widget.enableRipple ? _buildRippleWidget() : _buildChild(),
    );
  }

  // Builds the ripple effect widget using Listener
  Widget _buildRippleWidget() {
    return Listener(
      onPointerDown: (_) => _controller.forward(),
      onPointerUp: (_) => _controller.reverse(),
      child: _buildChild(),
    );
  }

  // Builds the child widget with optional scaling transformation
  Widget _buildChild() {
    return Transform.scale(
      scale: 1 - _controller.value,
      child: widget.child,
    );
  }

  // Handle onTap event by invoking the provided callback
  void _handleTap() {
    widget.onTap();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
