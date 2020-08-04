import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:release_info/pages/home_page.dart';
import 'package:release_info/pages/mine_page.dart';

class BottomBar extends StatefulWidget {
  final Function(int index) changeIndex;

  BottomBar({this.changeIndex});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int  _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.changeIndex(0);
              setState(() {
                _currentIndex = 0;
              });
            },
            child: _item(context, '首页', 0),
          ),
          SizedBox(), //中间位置空出
          GestureDetector(
            onTap: () {
              widget.changeIndex(1);
              setState(() {
                _currentIndex = 1;
              });
            },
            child: _item(context, '我的', 1),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间,
      ),
    );
  }

  Widget _item(BuildContext context, String title, int index) {
    Color _titleColor = index == _currentIndex ? Colors.blue : Colors.black;


    return Container(
      height: 50,
      width: 50,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5)),
          _returnIcon(index),
          Text(title, style: TextStyle(color: _titleColor, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _returnIcon(int index) {
    Color _iconColor  = index == _currentIndex ? Colors.blue : Colors.black;
    if (index == 0) {
     return  Icon(Icons.home, color: _iconColor);
    } else {
      return  Icon(Icons.person, color: _iconColor);
    }
  }
}