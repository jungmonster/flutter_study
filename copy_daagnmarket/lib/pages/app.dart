import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late int _currentPageIndex;
  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItam(
      String iconName, String labelName) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_off.svg",
          width: 22,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SvgPicture.asset(
          "assets/svg/${iconName}_on.svg",
          width: 22,
        ),
      ),
      label: labelName,
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.red),
      selectedFontSize: 12,
      onTap: (int index) {
        // print(index);
        setState(() {
          _currentPageIndex = index;
        });
      },
      currentIndex: _currentPageIndex,
      items: [
        _bottomNavigationBarItam("home", "Home"),
        _bottomNavigationBarItam("notes", "notes"),
        _bottomNavigationBarItam("location", "location"),
        _bottomNavigationBarItam("chat", "chat"),
        _bottomNavigationBarItam("user", "user"),
      ],
    );
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        return Home();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return Container();
    }
  }
}
