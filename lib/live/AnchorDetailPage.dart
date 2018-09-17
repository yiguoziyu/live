import 'package:flutter/material.dart';
import 'package:live/live/AnchorBean.dart';

class AnchorDetailPage extends StatefulWidget {
  final AnchorBean bean;

  AnchorDetailPage({this.bean});

  @override
  State<StatefulWidget> createState() => _AnchorDetailPageState();
}

class _AnchorDetailPageState extends State<AnchorDetailPage> {
  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();
    scaffoldKey = new GlobalKey<ScaffoldState>(
        debugLabel: 'anchor detail ${widget.bean}');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: scaffoldKey,
        appBar: new AppBar(
          centerTitle: true,
          title: Text('我的'),
        ),
        body: new SizedBox.expand(
          child: new Hero(
            tag: widget.bean,
            child: Text('我的 '),
          ),
        ));
  }
}
