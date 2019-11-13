library custom_scrollable_screen;

import 'package:flutter/material.dart';

class CustomScrollableScreen extends StatefulWidget {
  final double headerHeight;
  final WidgetBuilder headerBuilder;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final ScrollPhysics scrollPhysics;

  const CustomScrollableScreen({
    Key key,
    this.headerHeight = 250,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.headerBuilder,
    this.separatorBuilder,
    this.scrollPhysics = const ClampingScrollPhysics(),
  })  : assert(itemCount != null),
        assert(itemBuilder != null),
        assert(headerBuilder != null),
        super(key: key);

  factory CustomScrollableScreen.childreen({
    double headerHeight,
    WidgetBuilder headerBuilder,
    List<Widget> childreen,
  }) {
    return CustomScrollableScreen(
      headerHeight: headerHeight,
      headerBuilder: headerBuilder,
      itemCount: childreen.length,
      itemBuilder: (context, index) => childreen[index],
    );
  }

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
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: scrollController,
            builder: (context, snapshot) {
              return Transform.translate(
                offset: Offset(0, -scrollOffset),
                child: SizedBox(
                  height: headerHeight,
                  width: double.infinity,
                  child: ClipRRect(
                    child: widget.headerBuilder(context),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                  ),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
              physics: widget.scrollPhysics,
              controller: scrollController,
              padding: EdgeInsets.only(top: headerHeight - 50),
              itemCount: widget.itemCount,
              separatorBuilder:
                  widget.separatorBuilder ?? (context, index) => Container(),
              itemBuilder: (context, index) {
                return Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: (index == 0) ? Radius.circular(25) : Radius.zero,
                      bottom: (index == widget.itemCount - 1)
                          ? Radius.circular(25)
                          : Radius.zero,
                    ),
                    child: Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: widget.itemBuilder(context, index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
