import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum DialogAction {
  cancel,
  discard,
  disagree,
  agree,
}
enum PhoneType { ios, android }

enum DialogType { hint, custom }

typedef void DialogCallBack(DialogAction action);

///通用dialog
class CustomDialog extends StatefulWidget {
  final Widget title;
  final Widget content;
  final PhoneType isPhoneType;
  final Widget leftText;
  final Widget rightText;
  final DialogType dialogType;
  final DialogCallBack dialogCallBack;

  CustomDialog(
      {Key key,
      this.title,
      @required this.content,
      this.isPhoneType = PhoneType.android,
      this.leftText,
      this.rightText,
      this.dialogType = DialogType.custom,
      this.dialogCallBack})
      : assert(content != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  Widget _leftButton() {
    return widget.leftText == null ? Text('取消') : widget.leftText;
  }

  Widget _rightButton() {
    return widget.rightText == null ? Text('确定') : widget.rightText;
  }

  Widget _androidDialog() {
    List<Widget> _actionWidget = [
      new FlatButton(
          child: _rightButton(),
          onPressed: () {
            Navigator.pop(context, DialogAction.agree);
            if (widget.dialogCallBack != null) {
              widget.dialogCallBack(DialogAction.agree);
            }
          })
    ];
    if (widget.dialogType != DialogType.hint) {
      _actionWidget.add(
        new FlatButton(
            child: _leftButton(),
            onPressed: () {
              Navigator.pop(context, DialogAction.cancel);
              if (widget.dialogCallBack != null) {
                widget.dialogCallBack(DialogAction.cancel);
              }
            }),
      );
    }
    return new AlertDialog(
        title: widget.title, content: widget.content, actions: _actionWidget);
  }

  Widget _iosDialog() {
    List<Widget> _actionWidget = [
      new CupertinoDialogAction(
          child: _rightButton(),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context, DialogAction.agree);
            if (widget.dialogCallBack != null) {
              widget.dialogCallBack(DialogAction.agree);
            }
          })
    ];
    if (widget.dialogType != DialogType.hint) {
      _actionWidget.add(new CupertinoDialogAction(
          child: _leftButton(),
          isDestructiveAction: false,
          onPressed: () {
            Navigator.pop(context, DialogAction.cancel);
            if (widget.dialogCallBack != null) {
              widget.dialogCallBack(DialogAction.cancel);
            }
          }));
    }
    return new CupertinoAlertDialog(
      title: widget.title,
      content: widget.content,
      actions: _actionWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPhoneType == PhoneType.ios) {
      return _iosDialog();
    } else {
      return _androidDialog();
    }
  }
}
