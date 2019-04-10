import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fm/page/home_page.dart';
import 'package:fm/page/widget/home_drawer.dart';
import 'package:fm/page/widget/slide_container.dart';

/// 我的主页 -1 页
class MyHome extends StatefulWidget {
  static final String sName = "myhome";

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance => MediaQuery.of(context).size.width * 0.9;

  final GlobalKey<ContainerState> slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    height = MediaQuery.of(context).size.height - statusBarHeight;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: SlideStack(
        // Drawer Page
        drawer: HomeDrawer(),
        child: SlideContainer(
          key: slideKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height * (1 - position / 5),
            // Home Page
            child: new HomePage(tapDrawer:() {slideKey.currentState.openOrClose();}),
          ),
          slideDirection: SlideDirection.left,
          onSlide: onSlide,
          drawerSize: maxSlideDistance,
          transform:
          Matrix4.translationValues(0.0, height * position / 10, 0.0),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback tapDrawer;
  final double height;

  const CustomAppBar({Key key, this.title, this.tapDrawer, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      height: height,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: tapDrawer,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 20.0),
              child: Icon(
                Icons.dehaze,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
