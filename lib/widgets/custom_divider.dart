import 'dart:ui';

import 'package:ag_widgets/utils/enmus.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// The `CustomDivider` widget is a customizable divider in Flutter that can be used to separate content with various styles.
/// It offers different divider styles such as plain line, gradient line, dotted line, and gradient dotted line.
/// This widget allows you to control the weight, color, endIndent, indent, colorList (for gradients), spacing (for dotted lines),
/// and stroke cap of the divider.
class CustomDivider extends StatelessWidget {
  final double weight; // The thickness of the divider line.
  final Color color; // The color of the divider line.
  final DividerStyle
      style; // The style of the divider (plain line, gradient line, dotted line, gradient dotted line).
  final double endIndent; // The end indent of the divider.
  final double indent; // The start indent of the divider.
  final List<Color>?
      colorList; // List of colors for gradient dividers (optional).
  final int? spacing; // Spacing between dots for dotted dividers (optional).
  final StrokeCap strokeCap; // The stroke cap style for the divider.

  CustomDivider({
    this.weight = 1.0,
    this.color = Colors.black,
    this.style = DividerStyle.plainLine,
    this.colorList,
    this.spacing = 6,
    this.endIndent = 0,
    this.indent = 0,
    this.strokeCap = StrokeCap.square,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: endIndent, left: indent),
      height: weight,
      width: context.width(),
      child: CustomPaint(
        painter: _DividerPainter(
            color,
            style,
            LinearGradient(colors: colorList.validate()),
            weight,
            spacing,
            strokeCap),
      ),
    );
  }
}

class _DividerPainter extends CustomPainter {
  final Paint _paint;
  final DividerStyle _style;
  final Gradient? _gradient;
  final double? _weight;
  final int? _spacing;
  final StrokeCap _strokeCap;

  _DividerPainter(Color color, this._style, this._gradient, this._weight,
      this._spacing, this._strokeCap)
      : _paint = Paint()
          ..color = color
          ..strokeCap = _strokeCap
          ..strokeWidth = _weight ?? 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (_style == DividerStyle.plainLine) {
      _drawPlainLine(canvas, size, _weight, _strokeCap);
    } else if (_style == DividerStyle.gradientLine) {
      _drawGradientLine(canvas, size);
    } else if (_style == DividerStyle.dottedLine) {
      _drawDottedLine(canvas, size);
    } else if (_style == DividerStyle.gradientDottedLine) {
      _drawGradientDottedLine(canvas, size);
    }
  }

  void _drawPlainLine(
      Canvas canvas, Size size, double? weight, StrokeCap _strokeCap) {
    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, _paint);
  }

  void _drawGradientLine(Canvas canvas, Size size) {
    if (_gradient == null) return;

    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);
    final gradientShader = _gradient!.createShader(
      Rect.fromPoints(startPoint, endPoint),
    );

    _paint.shader = gradientShader;
    canvas.drawLine(startPoint, endPoint, _paint);
    _paint.shader = null; // Reset the shader after drawing.
  }

  void _drawDottedLine(Canvas canvas, Size size) {
    final space = _spacing ?? 6;
    for (double i = 0; i < size.width; i += space * 2) {
      final startPoint = Offset(i, size.height / 2);
      final endPoint = Offset(i + space, size.height / 2);
      canvas.drawLine(startPoint, endPoint, _paint);
    }
  }

  void _drawGradientDottedLine(Canvas canvas, Size size) {
    if (_gradient == null) return;

    final space = _spacing ?? 6;

    final gradientShader = _gradient!.createShader(
      Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)),
    );

    _paint.shader = gradientShader;

    final points = <Offset>[];
    for (double i = 0; i < size.width; i += space * 2) {
      final startPoint = Offset(i, size.height / 2);
      final endPoint = Offset(i + space, size.height / 2);
      points.add(startPoint);
      points.add(endPoint);
    }

    canvas.drawPoints(PointMode.lines, points, _paint);

    _paint.shader = null; // Reset the shader after drawing.
  }

  @override
  bool shouldRepaint(_DividerPainter oldDelegate) {
    return oldDelegate._style != _style || oldDelegate._gradient != _gradient;
  }
}
