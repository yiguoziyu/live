import 'package:flutter/material.dart';
import 'package:live/banner/BannerBean.dart';
import 'package:infinity_page_view/infinity_page_view.dart';

class IBanner extends StatefulWidget {
  ///item
  final IndexedWidgetBuilder itemBuilder;

  ///自动播放的间隔millisecond
  final int autoplayDely;

  ///切换的间隔millisecond
  final int duration;

  ///页数
  final int itemCount;

  /// horizontal/vertical
  final Axis scrollDirection;

  ///transition curve
  final Curve curve;

  IBanner(
      {@required this.itemBuilder,
      @required this.itemCount,
      this.autoplayDely = 3000,
      this.duration = 500});

  @override
  State<StatefulWidget> createState() => _IBannerState();
}

class _IBannerState extends State<IBanner> {
  @override
  Widget build(BuildContext context) {
    double bannerWidth=MediaQuery.of(context).size.width;

    List<Widget> list = [];
    if (widget.itemCount > 0) {
      list.add(new NotificationListener<ScrollNotification>(
        child: createPageView(context, widget.itemBuilder),
        onNotification: _handleScrollNotification,
      ));
    }
    return Container(
      width: bannerWidth,
     height: 140.0,
     child: Stack(
       children: list,
     ),
    );
  }

  Widget createPageView(
      BuildContext context, IndexedWidgetBuilder itemBuilder) {
    InfinityPageView infinityPageView = new InfinityPageView(
      key: Key("banner"),
      itemBuilder: itemBuilder,
      itemCount: widget.itemCount,
    );
    return infinityPageView;
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth != 0) return false;
    if (notification is ScrollStartNotification) {
    } else if (notification is ScrollEndNotification) {}
  }
}
