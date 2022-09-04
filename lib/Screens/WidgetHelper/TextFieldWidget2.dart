import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldHelper2 extends StatefulWidget {
  TextEditingController controller;
  // MultiValidator validator;
  final String hintText;
  final String labelField;
  final String helperText;
  final String labelText;
  final ValueChanged<String> onChanged;
  final Function(String) validator;
  final Widget prefixIcon;
  final double width;
  final bool isDouble;
  final bool isInt;
  bool isDate = false;
  bool isText = false;
  bool typePassword = false;
  bool enabled = true;
  bool yap = false;
  String initialValue = "true";

  TextFieldHelper2(
      {Key key,
      this.controller,
      this.hintText,
      this.labelField,
      this.helperText,
      this.labelText,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.width,
      this.isDouble,
      this.isInt,
      this.isDate,
      this.typePassword,
      this.isText,
      this.enabled,
      this.initialValue,
      this.yap})
      : super(key: key);

  @override
  _TextFieldHelperState createState() => _TextFieldHelperState();
}

class _TextFieldHelperState extends State<TextFieldHelper2> {
  FocusNode myFocusNode = new FocusNode();

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  bool checkEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 500,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.labelField == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      widget.labelField,
                      style: TextStyle(
                          fontFamily: "Neometric",
                          color: Color(0xFF57565e),
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
            Theme(
              data: ThemeData(
                  textSelectionTheme: TextSelectionThemeData(
                selectionColor: Colors.black38,
              )),
              child: Container(
                height: 60,
                child: widget.isDate == true
                    ? Theme(
                        data: ThemeData(
                          primarySwatch: buildMaterialColor(
                            Color(0xFF06464b),
                          ),
                        ),
                        child: DateTimePicker(
                          initialDatePickerMode: DatePickerMode.year,
                          controller: widget.controller,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.7),
                                  borderSide: new BorderSide(
                                    width: 1.0,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Color(0xFFe0d4e4))),
                              helperText: "",
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFe0d4e4))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFe0d4e4))),
                              labelStyle: TextStyle(
                                  color: Color.fromRGBO(153, 153, 153, 1))),
                          firstDate: DateTime(1900),
                          initialDate: DateTime(2000),
                          lastDate: DateTime(2000),
                          dateLabelText: 'Date',
                          onChanged: widget.onChanged,
                          validator: (val) {
                            print(val);
                            return null;
                          },
                          onSaved: (val) => print(val),
                        ),
                      )
                    : widget.yap == true
                        ? TextFormField(
                            initialValue: widget.initialValue ?? "",
                            enabled: widget.enabled == true ? false : true,
                            obscureText:
                                widget.typePassword == true ? true : false,
                            enableSuggestions:
                                widget.typePassword == true ? true : false,
                            autocorrect:
                                widget.typePassword == true ? true : false,
                            style: TextStyle(
                                color: widget.enabled == true
                                    ? Colors.black45
                                    : Colors.black87),
                            onChanged: (val) {
                              widget.onChanged(val);
                              val == ""
                                  ? setState(() {
                                      checkEmpty = true;
                                    })
                                  : setState(() {
                                      checkEmpty = false;
                                    });
                            },
                            validator: widget.validator,
                            cursorColor: Color.fromRGBO(153, 153, 153, 1),
                            inputFormatters: widget.isText == true
                                ? []
                                : [
                                    // widget.isDouble == false
                                    // ? FilteringTextInputFormatter(
                                    //     RegExp(r"^\d+\.?\d*$"),
                                    //     allow: widget.isDouble == true
                                    //         ? true
                                    //         : false ?? false)
                                    // : null
                                    widget.isDouble == true
                                        ? FilteringTextInputFormatter.allow(
                                            RegExp(r'(^\d*\.?\d*)'))
                                        : FilteringTextInputFormatter.allow(
                                            RegExp(r'^[a-zA-Z0-9]+$')),

                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'(^\d*\.?\d*)'))
                                  ],
                            keyboardType: widget.isDouble == true
                                ? TextInputType.numberWithOptions(decimal: true)
                                : widget.isInt == true
                                    ? TextInputType.number
                                    : null,
                            decoration: InputDecoration(
                                suffixIcon: checkEmpty == false
                                    ? null
                                    : InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          widget.controller.clear();
                                        },
                                        child: Icon(Icons.close,
                                            size: 20.0, color: Colors.black)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.7),
                                    borderSide: new BorderSide(
                                      width: 1.0,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                hintText: widget.hintText,
                                helperText: "",
                                labelText: widget.hintText,
                                prefixIcon: widget.prefixIcon,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),

                                //  Icon(
                                //   Icons.email,
                                //   color: Color(0xFFa694ac),
                                // ),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Color(0xFFe0d4e4)
                                        : Color.fromRGBO(153, 153, 153, 1))),
                          )
                        : TextFormField(
                            enabled: widget.enabled == true ? false : true,
                            obscureText:
                                widget.typePassword == true ? true : false,
                            enableSuggestions:
                                widget.typePassword == true ? true : false,
                            autocorrect:
                                widget.typePassword == true ? true : false,
                            style: TextStyle(
                                color: widget.enabled == true
                                    ? Colors.black45
                                    : Colors.black87),
                            onChanged: (val) {
                              widget.onChanged(val);
                              val == ""
                                  ? setState(() {
                                      checkEmpty = true;
                                    })
                                  : setState(() {
                                      checkEmpty = false;
                                    });
                            },
                            validator: widget.validator,
                            controller: widget.controller,
                            cursorColor: Color.fromRGBO(153, 153, 153, 1),
                            inputFormatters: widget.isText == true
                                ? []
                                : [
                                    // widget.isDouble == false
                                    // ? FilteringTextInputFormatter(
                                    //     RegExp(r"^\d+\.?\d*$"),
                                    //     allow: widget.isDouble == true
                                    //         ? true
                                    //         : false ?? false)
                                    // : null
                                    widget.isDouble == true
                                        ? FilteringTextInputFormatter.allow(
                                            RegExp(r'(^\d*\.?\d*)'))
                                        : FilteringTextInputFormatter.allow(
                                            RegExp(r'^[a-zA-Z0-9]+$')),

                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'(^\d*\.?\d*)'))
                                  ],
                            keyboardType: widget.isDouble == true
                                ? TextInputType.numberWithOptions(decimal: true)
                                : widget.isInt == true
                                    ? TextInputType.number
                                    : null,
                            decoration: InputDecoration(
                                suffixIcon: checkEmpty == false
                                    ? null
                                    : InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          widget.controller.clear();
                                        },
                                        child: Icon(Icons.close,
                                            size: 20.0, color: Colors.black)),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.7),
                                    borderSide: new BorderSide(
                                      width: 1.0,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                hintText: widget.hintText,
                                helperText: "",
                                labelText: widget.hintText,
                                prefixIcon: widget.prefixIcon,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),

                                //  Icon(
                                //   Icons.email,
                                //   color: Color(0xFFa694ac),
                                // ),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFe0d4e4))),
                                labelStyle: TextStyle(
                                    color: myFocusNode.hasFocus
                                        ? Color(0xFFe0d4e4)
                                        : Color.fromRGBO(153, 153, 153, 1))),
                          ),
              ),
            ),
          ],
        ));
  }
}
