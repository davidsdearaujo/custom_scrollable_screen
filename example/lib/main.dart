import 'package:flutter/material.dart';
import "package:custom_scrollable_screen/custom_scrollable_screen.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Scrollable Screen Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CustomScrollableScreen(
        separatorBuilder: (_, i) => Divider(height: 0),
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
        headerHeight: 250,
        headerBuilder: (context) => Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text(
            "Custom Screen",
            style: Theme.of(context).primaryTextTheme.headline,
          ),
        ),
      ),
    );
  }
}
