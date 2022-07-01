import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class TextFieldHelper extends StatefulWidget {
  TextEditingController controller;
  MultiValidator validator;
  String hintText;
  String helperText;
  String labelText;
  ValueChanged<String> fct;
  TextFieldHelper({
    Key key,
    this.controller,
    this.validator,
    this.hintText,
    this.helperText,
    this.labelText,
    this.fct,
  }) : super(key: key);

  @override
  _TextFieldHelperState createState() => _TextFieldHelperState();
}

class _TextFieldHelperState extends State<TextFieldHelper> {
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: TextFormField(

          onChanged : widget.fct,
          // validator: widget.validator,
          controller: widget.controller,
          
          cursorColor: Color.fromRGBO(153, 153, 153, 1),
          decoration: InputDecoration(
              // fillColor: Colors.white,
              // filled: true,
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe0e0e0))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF3a6259),
              )),
              hintText: widget.hintText,
              helperText: widget.helperText,
              labelText: widget.labelText,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe0e0e0))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFe0e0e0))),
              labelStyle: TextStyle(
                  color: myFocusNode.hasFocus
                       ?Color(0xFF3a6259)
                      : Color.fromRGBO(153, 153, 153, 1))),
        ));
  }
}
