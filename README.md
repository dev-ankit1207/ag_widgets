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


## Let's explore the package's functions!

### Widgets

### AgCustomDivider

The `AgCustomDivider` widget is a customizable divider in Flutter that can be used to separate content with various styles. It offers different divider styles such as plain line, gradient line, dotted line, and gradient dotted line. This widget allows you to control the weight, color, endIndent, indent, colorList (for gradients), spacing (for dotted lines), and stroke cap of the divider.

The style of the divider. It can be one of the following values:
- `DividerStyle.plainLine`: A plain solid line.
- `DividerStyle.gradientLine`: A gradient solid line.
- `DividerStyle.dottedLine`: A dotted line.
- `DividerStyle.gradientDottedLine`: A gradient dotted line.


#### Example
```dart
AgCustomDivider(
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

### AgViewAllButton

The `AgViewAllButton` widget is a customizable Flutter widget designed to display a title and an optional `View All` button. It is often used to navigate to a list or view with more details. This widget provides flexibility in customizing the title, text size, text color, and the behavior of the `View All` button.
All" text. (Default is false)

1. Displaying a `View All` button below a section title.
2. Navigating to a new screen or performing an action when the `View All` button is tapped.
3. Customizing the appearance of the title and button text.

#### Example

```dart
AgViewAllButton(
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


### AgCircleWidget

The `AgCircleWidget` class is a custom Flutter widget that provides a circular container with various customization options. It can be used as a decoration or background for other widgets. This documentation outlines the usage and properties of the `AgCircleWidget` class.

#### Example

```dart
AgCircleWidget({
   this.size = 50.0,
   this.backgroundColor = Colors.transparent,
   this.borderColor,
   this.borderWidth = 0.0,
   this.child,
   this.shadows,
});
```
------------
### AgNumberTickerWidget
The `wrapWithBracket` function is a utility function that takes an argument of the `BracketType` enum and wraps the string it's called on with brackets or quotes based on the specified `BracketType`. It provides a simple way to format strings within brackets or quotes as needed.
#### Example
```dart
/// Create a Controller
///Manages the overall number and allows real-time updates.
NumberTickerController controller = NumberTickerController();
```
```dart
AgNumberTickerWidget(
  controller: controller,
  initialNumber: 123.45,
  textStyle: TextStyle(fontSize: 24, color: Colors.blue),
  fractionDigits: 2,
)
```
------------

### AgCachedImage
The `AgCachedImage` widget is a customizable Flutter widget used for displaying cached network images with optional placeholder and initials for fallback. It allows developers to specify various parameters such as image URL, dimensions, placeholder, whether to display initials if the image fails to load, and more.

#### Example

```dart
AgCachedImage(
  imageUrl: 'https://example.com/image.jpg',
  height: 150,
  width: 150,
  fullName: 'John Doe',
  isCircle: true,
  isShowName: true,
  placeHolder: CircularProgressIndicator(), // Optional placeholder widget
  boxFit: BoxFit.cover, // Optional BoxFit for the image
  placeHoldChild: Icon(Icons.person), // Optional placeholder child widget
  textSize: 20, // Optional text size for name initials
)
```
> [!IMPORTANT]  
> The `AgCachedImage` widget internally uses the ExtendedImage widget from the extended_image package for network image loading and caching. It handles different load states such as loading, completed, and failed, and provides options for customization based on these states.

------------

### AgNameInitialWidget
The `AgNameInitialWidget` is a Flutter widget designed to display the initials of a person's name within a container. It's commonly used as a placeholder for user avatars or profile pictures. This widget offers customization options for background color, text color, shape (circle or rectangle), and the maximum number of initials to display.

#### Example

```dart
AgNameInitialWidget(
  name: 'John Doe',
  height: 60,
  width: 60,
  maxInitials: 2,
  backgroundColor: [Colors.blue, Colors.green, Colors.red], // Optional background colors
  textColor: Colors.white, // Optional text color
  isCircle: true, // Whether to display as a circle
  textSize: 24, // Optional text size for initials
)
```
------------

### AgTapEffect
The `AgTapEffect` widget provides a simple way to add a tap effect, such as a ripple effect, to any child widget. It allows developers to easily customize the behavior of tap events, including enabling or disabling the ripple effect, specifying hit testing behavior, and defining drag start behavior.

#### Example

```dart
AgTapEffect(
  child: Container(
    width: 200,
    height: 50,
    color: Colors.blue,
    child: Center(
      child: Text(
        'Tap Me',
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
  onTap: () {
    // Action to perform on tap
    print('Widget tapped!');
  },
  enableRipple: true, // Enable ripple effect
  behavior: HitTestBehavior.opaque, // Set hit testing behavior
);
```

### Extensions


#### IconImage() Extension on String
The `IconImage` method allows you to set icons that are loaded from either local assets or a network source. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.jpg".iconImage(),
```

------------

#### svgIconImage() Extension on String

The `svgIconImage` method allows you to set icons that are loaded from either local assets or a network source which are SVG. It's a handy utility for displaying images with ease. Here's an example usage:

```dart
"assets/images/placeholder.svg".svgIconImage(),
```

------------

### wrapWithBracket() Extension on String

The `wrapWithBracket` function is a utility function that takes an argument of the `BracketType` enum and wraps the string it's called on with brackets or quotes based on the specified `BracketType`. It provides a simple way to format strings within brackets or quotes as needed.

The style of the brackets. It can be one of the following values:
- `BracketType.Rounded`: ()
- `BracketType.Square`: [].
- `BracketType.Curly`: {}.
- `BracketType.Angle`: <>.
- `BracketType.SingleQuote`: ''.
- `BracketType.DoubleQuote`: "".
#### Example

```dart
String text = "Hello, World!";
String wrappedText = text.wrapWithBracket(BracketType.SingleQuote);
print(wrappedText); // Outputs: 'Hello, World!'
```

------------
### Extesnsion on `num`, `double` & `int`.

#### 1. `asPercentageInDecimal()`
Converts a numeric value to its percentage in decimal form
#### Example
```dart
double value = 50;
double percentageInDecimal = value.asPercentageInDecimal();
// Output: 0.5
```
#### 2. `calculatePercentageOf(double percentage)`
Calculates a specified percentage of a numeric value
#### Example
```dart
double value = 50;
double result = value.calculatePercentageOf(20);
// Output: 10.0
```
------------

#### Enums
| Name | Values |
|-------------|--------------|
| AppTheme   | Light, Dark, SystemDefault |
| ScreenOrientation | Portrait, Landscape, Auto |
| UserAccountStatus | Active, Inactive, Banned |
| SortingOrder | Ascending, Descending |
| TaskPriority | Low, Medium, High, Urgent |
| ReminderFrequency | Daily, Weekly, Monthly, Yearly |
| Gender | Male, Female, Other, PreferNotToSay |
| PaymentStatus | Paid, Pending, Failed, Refunded |
| ReviewRatings | OneStar, TwoStars, ThreeStars, FourStars, FiveStars |
| Weather Conditions | Sunny, Rainy, Cloudy, Snowy |
| LanguageSkillLevels | Beginner, Intermediate, Advanced, Fluent |
| TemperatureUnits | Celsius, Fahrenheit |
| TrafficLightColors | Red, Yellow, Green |
| FoodCategories | Breakfast, Lunch, Dinner, Snack, Dessert |


## Please hit a like👍 if this package made your life 🚀

# Thank You! ❤️

I appreciate your time and attention. If you have any further questions or need assistance, feel free to [reach out](mailto:dev.ankitgada@gmail.com). Have a great day!