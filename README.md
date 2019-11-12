# Custom Scrollable Screen

Create a custom scrollable screen.

<img src="https://github.com/davidsdearaujo/custom_scrollable_screen/blob/master/screenshots/Screenshot_1.png?raw=true" width="50%" />

## pubspec.yaml
```yaml
  custom_scrollable_screen:
    git:
      url: git://github.com/davidsdearaujo/custom_scrollable_screen.git
```

## Import
```dart
import "package:custom_scrollable_screen/custom_scrollable_screen.dart";
```

## Builder example
```dart
CustomScrollableScreen(
  headerHeight: 250,
  headerBuilder: (context) => Container(color: Colors.amber),
  separatorBuilder: (_, i) => Divider(height: 0),
  itemCount: 50,
  itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
);
```

## Childreen example
```dart
CustomScrollableScreen.childreen(
  headerHeight: 250,
  headerBuilder: (context) => Container(color: Colors.amber),
  childreen: <Widget>[
    Container(
      height: 300,
      padding: EdgeInsets.only(top: 25),
      color: Colors.green,
    ),
    Container(
      height: 250,
      padding: EdgeInsets.only(top: 25),
      color: Colors.red,
    ),
    Container(
      height: 470,
      padding: EdgeInsets.only(top: 25),
      color: Colors.purple,
    ),
  ],
);
```

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
