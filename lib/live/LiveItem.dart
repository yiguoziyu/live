import 'package:flutter/material.dart';
import 'package:live/live/AnchorBean.dart';

class LiveItem extends StatelessWidget {
  final AnchorBean anchorBean;
  final VoidCallback onPressed;

  LiveItem({Key key,this.anchorBean, this.onPressed}):super(key:key);

  @override
  Widget build(BuildContext context) {
    print("id----"+anchorBean.id);
    return MergeSemantics(
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Hero(
                tag: anchorBean.id,
                child: new Image.network(anchorBean.img, fit: BoxFit.fill),
              ),
            ),
            new Material(
              type: MaterialType.transparency,
              child: new InkWell(onTap: onPressed),
            ),
          ],
        ),
      ),
    );
  }
}
