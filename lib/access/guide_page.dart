import 'dart:async';

import 'package:flutter/material.dart';
import 'package:live/LoginPage.dart';
import 'package:live/access/access_image.dart';
import 'package:live/util/RouteUtil.dart';
import 'package:live/util/SystemUiUtil.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  Timer _timer;
  int _maxTime = 5;

  _GuidePageState() {
    if (_timer == null) {
      _timer = new Timer.periodic(Duration(milliseconds: 1000), (ticker) {
        if (_maxTime == 0) {
          _timer.cancel();
          _countdown();
        } else {
          setState(() {
            _maxTime--;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _countdown() {
    RouteUtil.simplePushAndRemoveUntil(context, new LoginPage(), null);
  }

  @override
  void initState() {
    super.initState();
    SystemUiUtil.appUIStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            new Image.asset(
              AccessImages.access_guide_bg,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: new RaisedButton(
                color: Colors.white10,
                onPressed: _countdown,
                child: Text(
                  '$_maxTime s 跳过',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              width: 80.0,
              height: 30.0,
              top: 30.0,
              right: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
