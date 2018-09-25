import 'package:flutter/material.dart';

///公用LinearLayout
class ILinearLayout extends StatefulWidget {
  Widget rightWidget;
  String leftImgUrl;
  String title;

  ILinearLayout({Key key, this.rightWidget, this.leftImgUrl, this.title})
      : assert(leftImgUrl != null),
        assert(title != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ILinearLayoutState();
}

class _ILinearLayoutState extends State<ILinearLayout> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Padding(padding: new EdgeInsets.only(left: 15.0)),
        new Image.asset(widget.leftImgUrl),
        new Text(widget.title)
      ],
    );
  }
}
