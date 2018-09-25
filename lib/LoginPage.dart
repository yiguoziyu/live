import 'package:flutter/material.dart';
import 'package:live/access/access_image.dart';
import 'package:live/base/base_state.dart';
import 'package:live/homePage.dart';
import 'package:live/main_page.dart';
import 'package:live/util/RouteUtil.dart';
import 'package:live/widget/dialog/custom_dialog.dart';
import 'package:live/widget/dialog/util_dialog.dart';
import 'package:live/widget/textfiled/itext_field.dart';

class LoginPage extends BaseStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseState<LoginPage> {
  String _phoneNumber = "";
  String _authNumber = "";

  @override
  Widget build(BuildContext context) {
    ITextField _phoneCode = new ITextField(
      keyboardType: ITextInputType.text,
      hintText: '请输入手机号',
      hintStyle: TextStyle(color: Colors.white),
      textStyle: TextStyle(color: Colors.white),
      fieldCallBack: (content) {
        _phoneNumber = content;
        print(_phoneNumber);
      },
    );
    ITextField _authCode = new ITextField(
      keyboardType: ITextInputType.password,
      hintText: '请输入验证码',
      hintStyle: TextStyle(color: Colors.white),
      textStyle: TextStyle(color: Colors.white),
      fieldCallBack: (content) {
        _authNumber = content;
      },
    );
    return Scaffold(
      body: new DropdownButtonHideUnderline(
          child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(AccessImages.access_login_bg, fit: BoxFit.cover),
          new Container(
              padding:
                  const EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
              child: new ListView(
                children: <Widget>[
                  new Container(
                    child: _phoneCode,
                  ),
                  new Container(
                    child: _authCode,
                  ),
                  new Container(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 10.0, right: 10.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      splashColor: Colors.blue,
                      disabledColor: Colors.red,
                      onPressed: () {
                        if (_phoneNumber == "" && _authNumber == "") {
                          RouteUtil.simplePushAndRemoveUntil(
                              context, new MainPage(), null);
                        } else {
                          DialogUtil.showSimpleDialog(context,title: '提示',content: '密码错误',callback: (action){
                            if(action==DialogAction.agree){
                              RouteUtil.simplePushAndRemoveUntil(
                                  context, new MainPage(), null);
                            }
                          });
                        }
                      },
                      child: new Text(
                        '登入',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
                controller: new ScrollController(),
              ))
        ],
      )),
    );
  }
}
