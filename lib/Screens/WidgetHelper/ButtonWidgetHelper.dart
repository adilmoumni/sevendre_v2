import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidgetHelper extends StatefulWidget {
  final void Function() onTap;
  final String textButton;
  final double width;
  final double height;
  final Widget icon;
  const ButtonWidgetHelper(
      {Key key,
      this.onTap,
      this.textButton,
      this.width,
      this.height,
      this.icon})
      : super(key: key);

  @override
  _ButtonWidgetHelperState createState() => _ButtonWidgetHelperState();
}

class _ButtonWidgetHelperState extends State<ButtonWidgetHelper> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: widget.width ?? 100,
        height: widget.height ?? 40.0,
        decoration: new BoxDecoration(
          color: Color(0xFF045258),
          borderRadius: new BorderRadius.circular(50.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 30, right: 30),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  widget.textButton ?? "test",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
                widget.icon
              ],
            ),
          ),
        ),
      ),
    );
  }
}
