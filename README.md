# ag_widgets

**ag_widgets** is a comprehensive package that offers a treasure trove of versatile, user-friendly smart widgets designed for daily use in your development projects. Elevate your apps and streamline your workflow with a rich array of customizable widgets for various tasks and functionalities.

## Getting Started

To get started with **ag_widgets**, follow these simple steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     ag_widgets: ^1.0.0  # Replace with the latest version
   ```

## Importing the Package

To start using the **ag_widgets** package in your Dart code, simply import it as follows:

```dart
import 'package:ag_widgets/ag_widgets.dart';
```

## Start using the smart widgets in your project!

### IconImage

The `IconImage` method allows you to set icons that are loaded from either local assets or a network source. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".iconImage(),
```

# CustomDivider Widget

The `CustomDivider` widget is a customizable divider in Flutter that can be used to separate content with various styles. It offers different divider styles such as plain line, gradient line, dotted line, and gradient dotted line. This widget allows you to control the weight, color, endIndent, indent, colorList (for gradients), spacing (for dotted lines), and stroke cap of the divider.

## Widget Properties

### `weight` (double)

The thickness of the divider. Defaults to `1.0`.

### `color` (Color)

The color of the divider. Defaults to `Colors.black`.

### `style` (DividerStyle)

The style of the divider. It can be one of the following values:
- `DividerStyle.plainLine`: A plain solid line.
- `DividerStyle.gradientLine`: A gradient solid line.
- `DividerStyle.dottedLine`: A dotted line.
- `DividerStyle.gradientDottedLine`: A gradient dotted line.

### `endIndent` (double)

The indent at the end of the divider. Defaults to `0`.

### `indent` (double)

The indent at the beginning of the divider. Defaults to `0`.

### `colorList` (List<Color>?)

A list of colors used for gradient dividers. It is only applicable when `style` is set to `DividerStyle.gradientLine` or `DividerStyle.gradientDottedLine`.

### `spacing` (int?)

The spacing between dots in a dotted line. It is only applicable when `style` is set to `DividerStyle.dottedLine` or `DividerStyle.gradientDottedLine`. Defaults to `6`.

### `strokeCap` (StrokeCap)

The stroke cap of the divider. It can be one of the following values:
- `StrokeCap.butt`
- `StrokeCap.round`
- `StrokeCap.square`

## Example Usage

```dart
CustomDivider(
  weight: 2.0,
  color: Colors.blue,
  style: DividerStyle.gradientLine,
  colorList: [Colors.blue, Colors.green],
  endIndent: 16.0,
  indent: 16.0,
  strokeCap: StrokeCap.round,
)
```