import 'dart:async';

import 'package:flutter/material.dart';
import 'package:live/banner/BannerBean.dart';
import 'package:live/live/AnchorBean.dart';
import 'package:live/live/AnchorDetailPage.dart';
import 'package:live/live/ISliverGridDelegate.dart';
import 'package:live/live/LiveItem.dart';
import 'package:live/live/LiveTheme.dart';
import 'package:live/util/RouteUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///home page
class HomePage extends StatefulWidget {
//  final GlobalKey<ScaffoldState> scaffoldKey;
//  final Widget body;
//  final Widget floatingActionButton;
//  final List<AnchorBean> anchorBeans;
//
//
//  HomePage({Key key,
//    @required this.scaffoldKey,
//    @required this.body,
//    this.floatingActionButton,
//    this.anchorBeans
//  })
//      :assert(body != null),
//        assert(scaffoldKey != null),
//        super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

final List<AnchorBean> _datas = <AnchorBean>[
  AnchorBean(
      id: "1",
      nickName: "tome",
      img: "http://img.juimg.com/tuku/yulantu/130505/240399-1305050T54323.jpg"),
  AnchorBean(
      id: "2",
      nickName: "tome",
      img: "http://pic28.photophoto.cn/20130806/0036036810294180_b.jpg"),
  AnchorBean(
      id: "3",
      nickName: "tome",
      img:
          "http://image.tianjimedia.com/uploadImages/2015/069/45/3C412CQZ6D7V.jpg"),
  AnchorBean(
      id: "4",
      nickName: "tome",
      img:
          "http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=4c4625411a38534398c28f62fb7ada0b/faf2b2119313b07eb3ec862506d7912397dd8c4e.jpg"),
  AnchorBean(
      id: "5",
      nickName: "tome",
      img:
          "http://img005.hc360.cn/m2/M00/0C/14/wKhQclQ0cMiEAe1VAAAAAPZJjqU452.jpg"),
  AnchorBean(
      id: "6",
      nickName: "tome",
      img:
          "http://cartoon.zwbk.org/ImageUploadTK/6349014293312637507404930554.jpg"),
  AnchorBean(
      id: "7",
      nickName: "tome",
      img:
          "http://02.imgmini.eastday.com/mobile/20180728/20180728232326_d41d8cd98f00b204e9800998ecf8427e_1.jpeg"),
  AnchorBean(
      id: "8",
      nickName: "tome",
      img: "http://img.juimg.com/tuku/yulantu/130505/240399-1305050T54323.jpg"),
  AnchorBean(
      id: "9",
      nickName: "tome",
      img:
          "http://02.imgmini.eastday.com/mobile/20180728/20180728232326_d41d8cd98f00b204e9800998ecf8427e_1.jpeg"),
  AnchorBean(
      id: "10",
      nickName: "tome",
      img: "http://img.juimg.com/tuku/yulantu/130505/240399-1305050T54323.jpg"),
  AnchorBean(
      id: "11",
      nickName: "tome",
      img:
          "http://02.imgmini.eastday.com/mobile/20180728/20180728232326_d41d8cd98f00b204e9800998ecf8427e_1.jpeg"),
  AnchorBean(
      id: "12",
      nickName: "tome",
      img: "http://img.juimg.com/tuku/yulantu/130505/240399-1305050T54323.jpg"),
];

final List<BannerBean> bannerBeanList = [
  BannerBean(
      id: "1",
      img: "http://img.zcool.cn/community/038497757a940710000012e7ea0c6ce.jpg"),
  BannerBean(
      id: "2",
      img:
          "http://attachments.gfan.com/forum/201605/31/234941i5wc5mii0juw3iat.jpg"),
  BannerBean(
      id: "3", img: "http://img2.niutuku.com/desk/1207/1018/ntk123974.jpg"),
  BannerBean(
      id: "4",
      img: "http://img2.niutuku.com/desk/130126/04/04-niutuku.com-3753.jpg"),
];

class _HomePageState extends State<HomePage> {
  Future<Null> _pushPage(AnchorBean bean) async {
    RouteUtil.simplePush(context, new AnchorDetailPage(bean: bean));
  }

  static final ISliverGridDelegate gridDelegate = new ISliverGridDelegate(
      dataCount: _datas.length,
      rowCount: 2,
      kSpacing: 1.0,
      titleHeight: 120.0,
      isSquare: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('我的',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: 130.0,
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return new Image.network(
                    bannerBeanList[index].img,
                    fit: BoxFit.cover,
                  );
                },
                itemCount: bannerBeanList.length,
                autoplay: true,
                pagination: new SwiperPagination(),
              ),
            ),
          ),
          SliverSafeArea(
            top: false,
            minimum: EdgeInsets.all(1.0),
            sliver: SliverGrid(
              gridDelegate: gridDelegate,
              delegate: SliverChildListDelegate(_datas.map((AnchorBean bean) {
                return new LiveItem(
                  anchorBean: bean,
                  onPressed: () {
                    _pushPage(bean);
                  },
                );
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MergeSemantics(
      child: SizedBox(
//        height: screenSize.width > screenSize.height
//            ? (screenSize.height - kToolbarHeight) * 0.85
//            : (screenSize.height - kToolbarHeight) * 0.70,
        height: 120.0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: InkWell(
            child: Text("banner"),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
