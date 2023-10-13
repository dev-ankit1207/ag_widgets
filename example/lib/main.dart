import 'package:ag_widgets/ag_widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// IconImage: This will help you to set the icon which are being loaded from assets or network.
              Text("Example of IconImage()"),
              SizedBox(height: 16),
              "assets/images/placeholder.jpg".iconImage(),

              SizedBox(height: 32),
              Text(
                'Welcome to Custom Divider Example',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              CustomDivider(
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
            ],
          ),
        ),
      ),
    );
  }
}
