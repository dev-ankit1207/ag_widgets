# ag_widgets
**ag_widgets** is a comprehensive package that offers a treasure trove of versatile, user-friendly smart widgets designed for daily use in your development projects. Elevate your apps and streamline your workflow with a rich array of customizable widgets for various tasks and functionalities.

## Getting Started

To get started with **ag_widgets**, follow these simple steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     ag_widgets: ^0.0.6  # Replace with the latest version
   ```

## Importing the Package

To start using the **ag_widgets** package in your Dart code, simply import it as follows:

```dart
import 'package:ag_widgets/ag_widgets.dart';
```

## Start using the smart widgets in your project!

### Icon Image
The `IconImage` method allows you to set icons that are loaded from either local assets or a network source. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".iconImage(),
```

### SVG Icon Image

The `svgIconImage` method allows you to set icons that are loaded from either local assets or a network source which are SVG. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".svgIconImage(),
```

### CustomDivider Widget

The `CustomDivider` widget is a customizable divider in Flutter that can be used to separate content with various styles. It offers different divider styles such as plain line, gradient line, dotted line, and gradient dotted line. This widget allows you to control the weight, color, endIndent, indent, colorList (for gradients), spacing (for dotted lines), and stroke cap of the divider.
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

### `style` (DividerStyle)

The style of the divider. It can be one of the following values:
- `DividerStyle.plainLine`: A plain solid line.
- `DividerStyle.gradientLine`: A gradient solid line.
- `DividerStyle.dottedLine`: A dotted line.
- `DividerStyle.gradientDottedLine`: A gradient dotted line.

### ViewAllButton

The `ViewAllButton` widget is a customizable Flutter widget designed to display a title and an optional "View All" button. It is often used to navigate to a list or view with more details. This widget provides flexibility in customizing the title, text size, text color, and the behavior of the "View All" button.
All" text. (Default is false)

##### Use Cases

1. Displaying a "View All" button below a section title.
2. Navigating to a new screen or performing an action when the "View All" button is tapped.
3. Customizing the appearance of the title and button text.

#### Example

```dart
ViewAllButton(
  title: "Recent Articles",
  onTap: () {
    // Navigate to the list of recent articles
    Navigator.push(context, MaterialPageRoute(builder: (context) => RecentArticlesScreen()));
  },
  titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  textSize: 20,
  viewAllText: "See All Articles",
  textColor: Colors.blue,
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  showViewAll: true,
  hideViewAllIcon: false,
)
```

In this example, the `ViewAllButton` widget is used to display a custom title "Recent Articles" with a larger font size and blue text color. When the "See All Articles" button is tapped, it navigates to the `RecentArticlesScreen`. The padding, visibility of the "View All" button, and the visibility of the arrow icon are also customized.

#### CircleWidget

The `CircleWidget` class is a custom Flutter widget that provides a circular container with various customization options. It can be used as a decoration or background for other widgets. This documentation outlines the usage and properties of the `CircleWidget` class.

### Example

```dart
CircleWidget({
  this.size = 50.0,
  this.backgroundColor = Colors.transparent,
  this.borderColor,
  this.borderWidth = 0.0,
  this.child,
  this.shadows,
});
