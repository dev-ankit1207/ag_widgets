

# OVERVIEW

## ag_widgets
**ag_widgets** is a comprehensive package that offers a treasure trove of versatile, user-friendly smart widgets designed for daily use in your development projects. Elevate your apps and streamline your workflow with a rich array of customizable widgets for various tasks and functionalities.

### Getting Started

To get started with **ag_widgets**, follow these simple steps:

1. Add the package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     ag_widgets: ^0.0.0  # Replace with the latest version
   ```

### Importing the Package

To start using the **ag_widgets** package in your Dart code, simply import it as follows:

```dart
import 'package:ag_widgets/ag_widgets.dart';
```

### Start using the smart widgets in your project!

### Icon Image
The `IconImage` method allows you to set icons that are loaded from either local assets or a network source. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".iconImage(),
```

------------

### SVG Icon Image

The `svgIconImage` method allows you to set icons that are loaded from either local assets or a network source which are SVG. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".svgIconImage(),
```

------------

### CustomDivider Widget

The `CustomDivider` widget is a customizable divider in Flutter that can be used to separate content with various styles. It offers different divider styles such as plain line, gradient line, dotted line, and gradient dotted line. This widget allows you to control the weight, color, endIndent, indent, colorList (for gradients), spacing (for dotted lines), and stroke cap of the divider.
#### `style` (DividerStyle)

The style of the divider. It can be one of the following values:
- `DividerStyle.plainLine`: A plain solid line.
- `DividerStyle.gradientLine`: A gradient solid line.
- `DividerStyle.dottedLine`: A dotted line.
- `DividerStyle.gradientDottedLine`: A gradient dotted line.


#### Example
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


------------

### ViewAllButton

The `ViewAllButton` widget is a customizable Flutter widget designed to display a title and an optional `View All` button. It is often used to navigate to a list or view with more details. This widget provides flexibility in customizing the title, text size, text color, and the behavior of the `View All` button.
All" text. (Default is false)

1. Displaying a `View All` button below a section title.
2. Navigating to a new screen or performing an action when the `View All` button is tapped.
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
------------

### CircleWidget

The `CircleWidget` class is a custom Flutter widget that provides a circular container with various customization options. It can be used as a decoration or background for other widgets. This documentation outlines the usage and properties of the `CircleWidget` class.

#### Example

```dart
CircleWidget({
   this.size = 50.0,
   this.backgroundColor = Colors.transparent,
   this.borderColor,
   this.borderWidth = 0.0,
   this.child,
   this.shadows,
});
```

------------


### Wrap With Bracket Icon Image

The `wrapWithBracket` function is a utility function that takes an argument of the `BracketType` enum and wraps the string it's called on with brackets or quotes based on the specified `BracketType`. It provides a simple way to format strings within brackets or quotes as needed.

#### Example

```dart
String text = "Hello, World!";
String wrappedText = text.wrapWithBracket(BracketType.SingleQuote);
print(wrappedText); // Outputs: 'Hello, World!'
```

------------


#### Enums

##### App Theme
- *Light, Dark, SystemDefault*

##### Screen Orientation
- *Portrait, Landscape, Auto*

##### User Account Status
- *Active, Inactive, Banned*

##### Sorting Order
- *Ascending, Descending*

##### Task Priority
- *Low, Medium, High, Urgent*

##### Reminder Frequency
- *Daily, Weekly, Monthly, Yearly*

##### Gender
- *Male, Female, Other, PreferNotToSay*

##### Payment Status
- *Paid, Pending, Failed, Refunded*

##### Review Ratings
- *OneStar, TwoStars, ThreeStars, FourStars, FiveStars*

##### Weather Conditions
- *Sunny, Rainy, Cloudy, Snowy*

##### Language Skill Levels
- *Beginner, Intermediate, Advanced, Fluent*

##### Temperature Units
- *Celsius, Fahrenheit*

##### Traffic Light Colors
- *Red, Yellow, Green*

##### Food Categories
- *Breakfast, Lunch, Dinner, Snack, Dessert*


## Please hit a like👍 if this package made your life 🚀

# Thank You! ❤️

I appreciate your time and attention. If you have any further questions or need assistance, feel free to [reach out](mailto:dev.ankitgada@gmail.com). Have a great day!
