import 'package:ag_widgets/ag_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NumberTickerController numberTickerController = NumberTickerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AG Widgets'),
          elevation: 8,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IconImage: This will help you to set the icon which are being loaded from assets or network.
              Divider(thickness: 3, height: 16, color: Colors.black),
              ...[
                Text("Example of IconImage()", style: boldTextStyle(size: 24)),
                SizedBox(height: 16),
                "assets/images/placeholder.jpg"
                    .iconImage(width: 140, height: 90, fit: BoxFit.fill),
              ],
              Divider(thickness: 3, height: 16, color: Colors.black),
              Divider(thickness: 3, height: 0, color: Colors.black),

              ...[
                SizedBox(height: 32),
                Text(
                  'Welcome to Custom Divider Example',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                AgCustomDivider(
                  weight: 2.0,
                  color: Colors.blue,
                  style: DividerStyle.gradientLine,
                  colorList: [Colors.blue, Colors.green],
                  endIndent: 16.0,
                  indent: 16.0,
                  strokeCap: StrokeCap.round,
                ),
                SizedBox(height: 20),
                Text(
                  'This is a custom divider with a gradient line!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                AgCustomDivider(
                  weight: 2.0,
                  color: Colors.blue,
                  style: DividerStyle.dottedLine,
                  colorList: [Colors.blue, Colors.green],
                  endIndent: 16.0,
                  indent: 16.0,
                  strokeCap: StrokeCap.round,
                ),
                SizedBox(height: 20),
                Text(
                  'This is a custom divider with a gradient line!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                AgCustomDivider(
                  weight: 2.0,
                  style: DividerStyle.gradientDottedLine,
                  colorList: [Colors.blue, Colors.green],
                  endIndent: 16.0,
                  indent: 16.0,
                  strokeCap: StrokeCap.round,
                ),
                SizedBox(height: 20),
                Text(
                  'This is a custom divider with a gradient line!',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                AgCustomDivider(
                  weight: 2.0,
                  color: Colors.blue,
                  style: DividerStyle.plainLine,
                  endIndent: 16.0,
                  indent: 16.0,
                  strokeCap: StrokeCap.round,
                ),
                SizedBox(height: 20),
                Text(
                  'This is a custom divider with a gradient line!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
              Divider(thickness: 3, height: 16, color: Colors.black),
              Divider(thickness: 3, height: 0, color: Colors.black),
              ...[
                Text(
                  'Number Ticket',
                  style: TextStyle(fontSize: 18),
                ),
                AgNumberTickerWidget(
                  controller: numberTickerController,
                  initialNumber: 20,
                ),
                TextButton(
                  onPressed: () {
                    numberTickerController.number =
                        numberTickerController.value + 1;
                  },
                  child: Text("Click me"),
                )
              ],

              Divider(thickness: 3, height: 16, color: Colors.black),
              Divider(thickness: 3, height: 0, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
