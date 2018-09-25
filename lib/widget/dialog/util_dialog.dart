import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:live/widget/dialog/custom_dialog.dart';

///进行统一管理
class DialogUtil {
  static showSimpleDialog(
    BuildContext context, {
    @required String title,
    @required String content,
    PhoneType phoneType = PhoneType.android,
    DialogType dialogType = DialogType.custom,
    DialogCallBack callback,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return new CustomDialog(
            title: new Text(title),
            content: new Text(content),
            isPhoneType: phoneType,
            dialogType: dialogType,
            dialogCallBack: callback,
          );
        });
  }
}
