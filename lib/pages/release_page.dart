import 'package:flutter/material.dart';

class ReleasePage extends StatefulWidget {
  final String title;

  ReleasePage({this.title});

  @override
  _ReleasePageState createState() => _ReleasePageState();
}

class _ReleasePageState extends State<ReleasePage> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('跳转的页面'),
      ),
    );
  }
}
