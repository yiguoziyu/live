import 'package:flutter/material.dart';
import 'package:live/base/base_image.dart';
import 'package:live/base/base_state.dart';
import 'package:live/homePage.dart';
import 'package:live/widget/common/ilinear_layout.dart';

class MainPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

List<Widget> _pages = [
  HomePage(),
  HomePage(),
  HomePage(),
  HomePage(),
];
List<String> _pagesTitles = ['活跃', '女神', '新人', '萝莉'];

class _MainPageState extends BaseState<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _pages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color _titleColor = Colors.white;
    String _accountName = '一锅子鱼';
    String _signtrue = "还没有设置个性签名";
    String _img =
        "http://a0.att.hudong.com/54/49/01300542891809141879496908378.jpg";
    String _bgimg =BaseImage.drawer_bg;
    Drawer _drawer = new Drawer(
      child: new Column(
        children: <Widget>[
          Semantics(
            container: true,
            label: MaterialLocalizations.of(context).signedInLabel,
            child: DrawerHeader(
              decoration: BoxDecoration(
                image: new DecorationImage(image: AssetImage(_bgimg),fit: BoxFit.cover),
              ),
              padding: const EdgeInsetsDirectional.only(top: 25.0, start: 16.0),
              child: new SafeArea(
                bottom: false,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          PositionedDirectional(
                              child: new Container(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(_img),
                                ),
                                padding: const EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                height: 70.0,
                                width: 70.0,
                              )),
                        ],
                      ),
                    new Padding(padding: const EdgeInsets.only(top: 10.0)),
                    Text(_accountName,style: TextStyle(color: _titleColor,fontSize: 18.0),),
                    Text(_signtrue,style: TextStyle(color: _titleColor)),
                  ],
                ),
              ),
            ),
          ),
          new ILinearLayout(leftImgUrl: '',title: '我的消息',),
        ],
      ),
    );
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: _titleColor,
          ),
        ),
        title: new Center(
          child: new Container(
            width: 250.0,
            child: new TabBar(
                indicatorColor: _titleColor,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _controller,
                tabs: _pagesTitles
                    .map((String title) => new Tab(
                          child: Text(
                            title,
                            style: TextStyle(color: _titleColor),
                          ),
                        ))
                    .toList()),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: _titleColor,
            ),
          )
        ],
      ),
      body: new TabBarView(
        children: _pages,
        controller: _controller,
      ),
      drawer: _drawer,
    );
  }
}
