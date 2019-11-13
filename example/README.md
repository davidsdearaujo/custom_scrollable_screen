## Simple example
```dart
CustomScrollableScreen(
  headerHeight: 250,
  headerBuilder: (context) => Container(color: Colors.amber),
  childreen: <Widget>[
    Container(height: 300, color: Colors.green),
    Container(height: 250, color: Colors.red),
    Container(height: 470, color: Colors.purple),
  ],
);
```

## Circular example
```dart
CustomScrollableScreen(
  headerHeight: 250,
  headerBuilder: (context) => Container(
    color: Colors.amber,
    alignment: Alignment.center,
    child: Text(
      "Custom Screen",
      style: Theme.of(context).primaryTextTheme.headline,
    ),
  ),
  childreen: <Widget>[
    ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      child: Container(
        height: 300,
        color: Colors.green,
      ),
    ),
    Container(
      height: 250,
      color: Colors.red,
    ),
    ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      child: Container(
        height: 470,
        color: Colors.purple,
      ),
    ),
  ],
),
```

# Complete example
```dart
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
        headerHeight: 250,
        headerBuilder: (context) => Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Text(
            "Custom Screen",
            style: Theme.of(context).primaryTextTheme.headline,
          ),
        ),
        childreen: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Container(
              height: 300,
              color: Colors.green,
            ),
          ),
          Container(
            height: 250,
            color: Colors.red,
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            child: Container(
              height: 470,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
```