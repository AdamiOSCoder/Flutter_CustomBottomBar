import 'package:flutter/material.dart';
import 'package:release_info/bottom_bar.dart';
import 'package:release_info/pages/home_page.dart';
import 'package:release_info/pages/mine_page.dart';
import 'package:release_info/pages/release_page.dart';

void main() {
  runApp(ReleaseInfo());
}

class ReleaseInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(title: '首页'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget tabBody = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomBar(
        changeIndex: (int index) {
          if (index == 0) {
            setState(() {
              widget.title = '首页';
              tabBody = HomePage();
            });
          } else {
            setState(() {
              widget.title = '我的';
              tabBody = MinePage();
            });
          }
        },
      ),
      body: tabBody,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _releasePageJump),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _releasePageJump() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
          return ReleasePage(title: '跳转页面',);
    }));
  }
}
