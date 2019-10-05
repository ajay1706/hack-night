import 'package:flutter/material.dart';
import 'package:mad_demo/bottomTabs/homeTab.dart';
import 'package:mad_demo/bottomTabs/messageTab.dart';
import 'package:mad_demo/bottomTabs/profileTab.dart';
import 'package:mad_demo/bottomTabs/settingsTab.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.greenAccent, primaryColorDark: Colors.green),
      home: HomeScreenMain(
        title: 'HomeScreen',
      ),
    );
  }
}

class HomeScreenMain extends StatefulWidget {
  HomeScreenMain({Key key, this.title}) : super(key: key);

  final String title;

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMain> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('M.A.D with Flutter'),
      ),
      body: new PageView(
        children: <Widget>[
          new HomeTab(),
          new MessageTab(),
          new ProfileTab(),
          new SettingsTab(),
        ],
        onPageChanged: _onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // this will be set when a new tab is tapped
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text('Settings'))
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItemSelected,
        fixedColor: Colors.blue,
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      this._selectedIndex = page;
    });
  }

  void _onTabItemSelected(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
