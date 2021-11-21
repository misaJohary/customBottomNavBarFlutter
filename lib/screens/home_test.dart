import 'package:downgrade/providers/theme_provider.dart';
import 'package:downgrade/widgets/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTest extends StatefulWidget {
  static String routeName = './hometest';

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  int _currentIndex = 0;

  Color themeColor = Colors.grey;
  ThemeData _theme = new ThemeData();
  bool _isRandomColor = true;
  bool _isUniColor = false;
  bool _isAnimated = false;
  bool _isDynShadowColor = true;
  double _tileSize = 15;
  double _tileAspectRatio = 1.75;
  double _height = 70;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
              margin: EdgeInsets.only(bottom: 10),
              duration: Duration(milliseconds: 500),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeColor,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(130)),
                boxShadow: [
                  BoxShadow(
                      color: themeColor,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 2),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.format_quote_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Custom Bottom Nav Bar and dynamique theme',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.,
                        // softWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 11,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SwitchListTile(
                              activeColor: themeColor,
                              title: Text('Random Color'),
                              value: _isRandomColor,
                              onChanged: (bool value) {
                                setState(() => _isUniColor
                                    ? null
                                    : _isRandomColor = value);
                              }),
                          SwitchListTile(
                              activeColor: themeColor,
                              title: Text('Single Color'),
                              value: _isUniColor,
                              onChanged: (bool value) {
                                setState(() => _isRandomColor
                                    ? null
                                    : _isUniColor = value);
                              }),
                          SwitchListTile(
                              activeColor: themeColor,
                              title: Text('Multi Colors'),
                              value: !_isUniColor,
                              onChanged: (bool value) {
                                setState(() => !value
                                    ? _isRandomColor
                                        ? null
                                        : _isUniColor = !value
                                    : _isUniColor = !value);
                              }),
                          SwitchListTile(
                              activeColor: themeColor,
                              title: Text('Animation'),
                              value: _isAnimated,
                              onChanged: (bool value) {
                                setState(() => _isAnimated = value);
                              }),
                          SwitchListTile(
                              activeColor: themeColor,
                              title: Text('Dynamique Shadow Color'),
                              value: _isDynShadowColor,
                              onChanged: (bool value) {
                                setState(() => _isDynShadowColor = value);
                              }),
                          Padding(
                            padding: const EdgeInsets.only(left: 17.0, top: 10),
                            child: Text('Label\'s Size',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 15)),
                          ),
                          Slider(
                              activeColor: themeColor,
                              // divisions: 9,
                              // label: 'Size of label',
                              min: 10,
                              max: 20,
                              value: _tileSize,
                              onChanged: (double value) {
                                setState(() {
                                  _tileSize = value;
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.only(left: 17.0, top: 10),
                            child: Text('Label\'s Aspect Ratio',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 15)),
                          ),
                          Slider(
                              activeColor: themeColor,
                              // divisions: 9,
                              // label: 'Size of label',
                              min: 1.5,
                              max: 2,
                              // divisions: 3,
                              value: _tileAspectRatio,
                              onChanged: (double value) {
                                setState(() {
                                  _tileAspectRatio = value;
                                });
                              }),
                              Padding(
                            padding: const EdgeInsets.only(left: 17.0, top: 10),
                            child: Text('Bottom Nav Bar Height',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(fontSize: 15)),
                          ),
                          Slider(
                              activeColor: themeColor,
                              // divisions: 9,
                              // label: 'Size of label',
                              min: 65,
                              max: 150,
                              // divisions: 3,
                              value: _height,
                              onChanged: (double value) {
                                setState(() {
                                  _height = value;
                                });
                              }),
                              
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: themeColor,
        //   hoverColor: _theme.primaryColor,
        //   elevation: 5,
        //   onPressed: () {},
        //   child: Icon(Icons.android_sharp),
        // ),
        // IconButton(onPressed: (){}, icon: Icon(Icons.add)),

        bottomNavigationBar: MyBottomNavBar(
          tileSize: _tileSize,
          tileAspectRatio: _tileAspectRatio,
          height: _height,
          dynColorShadow: _isDynShadowColor,
          randomizedColor: _isRandomColor,
          uniColor: _isUniColor,
          isAnimated: _isAnimated,
          icon: [
            Icons.home_rounded,
            Icons.favorite_rounded,
            Icons.shopping_cart_rounded,
            Icons.settings_rounded,
            Icons.api_rounded,
            Icons.app_registration
          ],
          label: [
            'home',
            'favorites',
            'shopping',
            'setting',
            'AI mode',
            'registration'
          ],
          color: Colors.purple,
          callbackFunc: (Color color, int currentIndex, ThemeData theme) {
            setState(() {
              themeColor = color;
              _currentIndex = currentIndex;
              // Provider.of<ThemeNotifier>(context, listen: false).setThemes(currentIndex);
              // Provider.of<ThemeNotifier>(context, listen: false).setRandomThemes();
              Provider.of<ThemeNotifier>(context, listen: false)
                  .setTheme(theme);
              _theme = theme;
            });
          },
        ),
      ),
    );
  }
}
