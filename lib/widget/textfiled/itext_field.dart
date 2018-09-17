import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///自带删除的ITextField
typedef void ITextFieldCallBack(String content);

enum ITextInputType {
  text,
  multiline,
  number,
  phone,
  datetime,
  emailAddress,
  url,
  password
}

class ITextField extends StatefulWidget {
  final ITextInputType keyboardType;
  final int maxLines;
  final int maxLength;
  final String hintText;
  final TextStyle hintStyle;
  final ITextFieldCallBack fieldCallBack;
  final Icon deleteIcon;
  final InputBorder inputBorder;
  final Widget prefixIcon;

  ITextField(
      {Key key,
      ITextInputType keyboardType: ITextInputType.text,
      this.maxLines = 1,
      this.maxLength,
      this.hintText,
      this.hintStyle,
      this.fieldCallBack,
      this.deleteIcon,
      this.inputBorder,
      this.prefixIcon})
      : assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = maxLines == 1 ? keyboardType : ITextInputType.multiline,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _ITextFieldState();
}

class _ITextFieldState extends State<ITextField> {
  String _inputText = "";
  String _showText = "";
  bool _hasdeleteIcon = false;
  bool _isNumber = false;
  bool _isPassword = false;

  ///输入类型
  TextInputType _getTextInputType() {
    switch (widget.keyboardType) {
      case ITextInputType.text:
        return TextInputType.text;
      case ITextInputType.multiline:
        return TextInputType.multiline;
      case ITextInputType.number:
        _isNumber = true;
        return TextInputType.number;
      case ITextInputType.phone:
        _isNumber = true;
        return TextInputType.phone;
      case ITextInputType.datetime:
        return TextInputType.datetime;
      case ITextInputType.emailAddress:
        return TextInputType.emailAddress;
      case ITextInputType.url:
        return TextInputType.url;
      case ITextInputType.password:
        _isPassword = true;
        return TextInputType.text;
    }
  }

  ///输入范围
  List<TextInputFormatter> _getTextInputFormatter() {
    return _isNumber
        ? <TextInputFormatter>[
            WhitelistingTextInputFormatter.digitsOnly,
          ]
        : null;
  }

  @override
  Widget build(BuildContext context) {
    TextField textField = new TextField(
      controller: new TextEditingController.fromValue(TextEditingValue(
          text: _showText,
          selection: new TextSelection.fromPosition(TextPosition(
              affinity: TextAffinity.downstream, offset: _showText.length)))),
      decoration: InputDecoration(
        hintStyle: widget.hintStyle,
        hintText: widget.hintText,
        border: widget.inputBorder == null
            ? widget.inputBorder
            : UnderlineInputBorder(),
        fillColor: Colors.transparent,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _hasdeleteIcon
            ? new Container(
                width: 20.0,
                height: 20.0,
                child: new IconButton(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(0.0),
                  iconSize: 18.0,
                  icon: widget.deleteIcon != null
                      ? widget.deleteIcon
                      : Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      _inputText = "";
                      _showText = "";
                    });
                  },
                ),
              )
            : new Text(""),
      ),
      onChanged: (str) {
        setState(() {
          if(_isPassword){
            if (str.length > _showText.length) {
              _inputText+=str[str.length-1];
              _showText += "*";
            }else{
              _inputText.substring(0,_inputText.length-1);
              _showText=_showText.substring(0,_showText.length-1);
            }
          }else{
            _inputText = str;
            _showText=str;
          }
          _hasdeleteIcon = (_inputText.isNotEmpty);
          widget.fieldCallBack(_inputText);
        });
      },
      onSubmitted: (text) {
        FocusScope.of(context).reparentIfNeeded(FocusNode());
      },
      keyboardType: _getTextInputType(),
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      inputFormatters: _getTextInputFormatter(),
    );
    return textField;
  }

  String getInputValue() {
    return _inputText;
  }
}
