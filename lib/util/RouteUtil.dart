import 'package:flutter/material.dart';

///路由工具类
class RouteUtil {

  static void simplePush(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  static void simplePop(BuildContext context) {
    Navigator.pop(context);
  }

  static void simplePushAndRemoveUntil(BuildContext context, Widget widget,predicate) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget),
        predicate==null?((Route route) => route == null):ModalRoute.withName(predicate));
  }
  
}
