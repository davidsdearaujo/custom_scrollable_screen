library custom_scrollable_screen;

import 'package:flutter/material.dart';

class CustomScrollableScreen extends StatefulWidget {
  final double headerHeight;
  final WidgetBuilder headerBuilder;
  final ScrollPhysics scrollPhysics;
  final List<Widget> childreen;

  const CustomScrollableScreen({
    Key key,
    this.headerHeight = 250,
    @required this.headerBuilder,
    this.childreen,
    this.scrollPhysics = const ClampingScrollPhysics(),
  })  : assert(childreen != null),
        assert(headerBuilder != null),
        super(key: key);

  @override
  _CustomScrollableScreenState createState() => _CustomScrollableScreenState();
}

class _CustomScrollableScreenState extends State<CustomScrollableScreen> {
  double get headerHeight =>
      widget.headerHeight + MediaQuery.of(context).padding.top;

  double get scrollOffset =>
      scrollController.positions.isEmpty ? 0 : scrollController.offset;

  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: headerHeight,
              width: double.infinity,
              child: ClipRRect(
                child: widget.headerBuilder(context),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, headerHeight - 50, 15, 25),
              child: Column(
                children: widget.childreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
