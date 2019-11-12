
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