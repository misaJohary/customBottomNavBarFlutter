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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
              margin: EdgeInsets.only(bottom: 10),
              duration: Duration(milliseconds: 500),
              height: 150,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Hey Flutter\'s Lover',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.format_quote_rounded,
                    color: Colors.white,
                    size: 60,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Card(
                  elevation: 11,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SwitchListTile(
                            activeColor: themeColor,
                            title: Text('Random Color'),
                            value: _isRandomColor,
                            onChanged: (bool value) {
                              setState(() =>
                                  _isUniColor ? null : _isRandomColor = value);
                            }),
                        SwitchListTile(
                            activeColor: themeColor,
                            title: Text('Single Color'),
                            value: _isUniColor,
                            onChanged: (bool value) {
                              setState(() =>
                                  _isRandomColor ? null : _isUniColor = value);
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
                            // tileColor: Colors.purple,
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
                      ],
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
          tileSize: 15,
          tileAspectRatio: 1.75,
          height: 70,
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
