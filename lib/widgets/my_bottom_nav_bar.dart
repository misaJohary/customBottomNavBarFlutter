import 'dart:math';

import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  @required
  List<IconData> icon;
  List<String> label;
  List<Color> colors;
  Color color;
  List<Map<String, Color>> colorTheme;
  Color backgroundColor;
  Color shadowColor;
  double height;
  double width;
  final Function callbackFunc;
  bool uniColor;
  bool isAnimated;
  bool dynColorShadow;
  bool randomizedColor;

  MyBottomNavBar({
    @required this.icon,
    @required this.label,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.height = 80,
    this.width = double.infinity,
    this.callbackFunc,
    this.uniColor = false,
    this.color = Colors.cyan,
    this.isAnimated = true,
    this.dynColorShadow = false,
    this.randomizedColor = false,
    this.colors = const [
      Colors.cyan,
      Colors.pink,
      Colors.orange,
      Colors.grey,
      Colors.purple,
      Colors.lime,
    ],
    this.colorTheme = const [
      {'primary': Colors.cyan, 'accent': Colors.cyanAccent},
      {'primary': Colors.pink, 'accent': Colors.pinkAccent},
      {'primary': Colors.orange, 'accent': Colors.orangeAccent},
      {'primary': Colors.grey, 'accent': Colors.blueGrey},
      {'primary': Colors.purple, 'accent': Colors.purpleAccent},
      {'primary': Colors.lime, 'accent': Colors.limeAccent},
    ],
  });

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int currentIndex = 0;
  Color shadowColor = Colors.grey;
  ThemeData _theme;
  Random random = new Random();
  int randomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: (widget.icon.length >= 4)
          ? const EdgeInsets.only(left: 10, right: 10)
          : const EdgeInsets.all(0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: shadowColor, blurRadius: 5, spreadRadius: 2),
      ], color: widget.backgroundColor),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: (widget.icon.length <= 4)
              ? List.generate(
                  widget.icon.length,
                  (index) => _MyCustomTile(
                    isAnimated: widget.isAnimated,
                    index: index,
                    currentIndex: currentIndex,
                    icon: widget.icon[index],
                    label: widget.label[index],
                    color: widget.uniColor
                        ? widget.color
                        : widget.randomizedColor
                            ? widget.colors[randomIndex]
                            : widget.colors[index],
                    voidCallBackFunc: () {
                      setState(() {
                        randomIndex = random.nextInt(6);
                        currentIndex = index;
                        widget.dynColorShadow
                            ? (widget.uniColor
                                ? shadowColor = widget.color
                                : widget.randomizedColor
                                    ? shadowColor = widget.colors[randomIndex]
                                    : shadowColor = widget.colors[index])
                            : shadowColor = Colors.grey;
                        _theme = ThemeData(
                          primaryColor: widget.randomizedColor
                              ? widget.colorTheme[randomIndex]['primary']
                              : widget.colorTheme[index]['primary'],
                          accentColor: widget.randomizedColor
                              ? widget.colorTheme[randomIndex]['accent']
                              : widget.colorTheme[index]['accent'],
                          scaffoldBackgroundColor: Color(0xFFEFF3F6),
                          appBarTheme: AppBarTheme(
                            backgroundColor: widget.randomizedColor
                                ? widget.colorTheme[randomIndex]['primary']
                                : widget.colorTheme[index]['primary'],
                          ),
                        );
                        // shadowColor = widget.uniColor
                        //     ? Colors.grey
                        //     : widget.colors[index];
                        widget.callbackFunc(
                            widget.uniColor
                                ? widget.color
                                : widget.randomizedColor
                                    ? widget.colors[randomIndex]
                                    : widget.colors[index],
                            currentIndex,
                            _theme);
                      });
                    },
                  ),
                )
              : [
                  Expanded(
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) => _MyCustomTile(
                          index: index,
                          currentIndex: currentIndex,
                          icon: widget.icon[index],
                          label: widget.label[index],
                          isAnimated: widget.isAnimated,
                          color: widget.uniColor
                              ? widget.color
                              : widget.randomizedColor
                                  ? widget.colors[randomIndex]
                                  : widget.colors[index],
                          voidCallBackFunc: () {
                            setState(() {
                              randomIndex = random.nextInt(6);
                              currentIndex = index;
                              widget.dynColorShadow
                                  ? (widget.uniColor
                                      ? shadowColor = widget.color
                                      : widget.randomizedColor
                                          ? shadowColor =
                                              widget.colors[randomIndex]
                                          : shadowColor = widget.colors[index])
                                  : shadowColor = Colors.grey;
                              _theme = ThemeData(
                                primaryColor: widget.randomizedColor
                                    ? widget.colorTheme[randomIndex]['primary']
                                    : widget.colorTheme[index]['primary'],
                                accentColor: widget.randomizedColor
                                    ? widget.colorTheme[randomIndex]['accent']
                                    : widget.colorTheme[index]['accent'],
                                scaffoldBackgroundColor: Color(0xFFEFF3F6),
                                appBarTheme: AppBarTheme(
                                  backgroundColor: widget.randomizedColor
                                      ? widget.colorTheme[randomIndex]
                                          ['primary']
                                      : widget.colorTheme[index]['primary'],
                                ),
                              );
                              // shadowColor = widget.uniColor
                              //     ? Colors.grey
                              //     : widget.colors[index];
                              widget.callbackFunc(
                                  widget.uniColor
                                      ? widget.color
                                      : widget.randomizedColor
                                          ? widget.colors[randomIndex]
                                          : widget.colors[index],
                                  currentIndex,
                                  _theme);
                            });
                          },
                        ),
                        itemCount: widget.icon.length,
                      ),
                    ),
                  ),
                ].toList()),
    );
  }
}

class _MyCustomTile extends StatefulWidget {
  int currentIndex;
  final int index;
  // Duration duration;
  @required
  final IconData icon;
  final String label;
  final Color color;
  bool isAnimated;
  @required
  final Function voidCallBackFunc;

  _MyCustomTile(
      {this.index,
      this.currentIndex,
      this.icon,
      this.label,
      this.color,
      this.isAnimated = true,
      // this.duration,
      this.voidCallBackFunc});

  @override
  _MyCustomTileState createState() => _MyCustomTileState();
}

class _MyCustomTileState extends State<_MyCustomTile> {
  @override
  Widget build(BuildContext context) {
    return widget.isAnimated
        ? AnimatedContainer(
            // width: 120,
            // height: 20,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: widget.currentIndex == widget.index
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.color.withOpacity(0.3),
                  )
                : BoxDecoration(),
            child: GestureDetector(
              onTap: widget.voidCallBackFunc,
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: widget.currentIndex == widget.index
                        ? widget.color
                        : Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget.currentIndex == widget.index
                      ? Text(
                          widget.label,
                          style: TextStyle(
                            color: widget.color,
                          ),
                        )
                      : const Text(''),
                ],
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: widget.currentIndex == widget.index
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.color.withOpacity(0.3),
                  )
                : BoxDecoration(),
            child: GestureDetector(
              onTap: widget.voidCallBackFunc,
              child: Row(
                children: [
                  Icon(
                    widget.icon,
                    color: widget.currentIndex == widget.index
                        ? widget.color
                        : Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget.currentIndex == widget.index
                      ? Text(
                          widget.label,
                          style: TextStyle(
                            color: widget.color,
                          ),
                        )
                      : const Text(''),
                ],
              ),
            ),
          );
  }
}
