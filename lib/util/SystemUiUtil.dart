import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class SystemUiUtil{
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  ///设置状态栏没有阴影
  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }
}