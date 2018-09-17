import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live/access/access_image.dart';
import 'package:live/base/base_state.dart';
import 'package:live/widget/textfiled/itext_field.dart';

class LoginPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DropdownButtonHideUnderline(
          child: new SafeArea(
              top: false,
              bottom: false,
              child: new Container(
                padding: const EdgeInsets.only(top: 100.0),
                child: new ListView(
                  children: <Widget>[
                    new Container(
                      child: new ITextField(
                        keyboardType: ITextInputType.text,
                        hintText: '请输入手机号',
                        fieldCallBack: (content) {
                          print('锁定的值为$content');
                        },
                      ),
                      padding: new EdgeInsets.only(left: 40.0, right: 40.0),
                    ),
                      new Container(
                        child: new ITextField(
                          keyboardType: ITextInputType.password,
                          hintText: '请输入验证码',
                          fieldCallBack: (content) {
                            print('锁定的值为$content');
                          },
                        ),
                        padding: new EdgeInsets.only(left: 40.0, right: 40.0),
                      ),
                  ],
                  controller: new ScrollController(),
                ),

              ))),
    );
  }
}
