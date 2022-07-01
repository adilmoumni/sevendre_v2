import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CardDashboardWidget extends StatefulWidget {
  Color color; //Color(0xFFa5e1d8)
  String number;
  String text;
  IconData icon;
  CardDashboardWidget({Key key, this.color, this.number, this.text, this.icon})
      : super(key: key);

  @override
  State<CardDashboardWidget> createState() => _CardDashboardWidgetState();
}

class _CardDashboardWidgetState extends State<CardDashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,

      // height: 50,
      child: Card(
          color: widget.color ?? Color(0xFFa5e1d8),
          elevation: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.number ?? "0",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: AutoSizeText(widget.text ?? "Total clients",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.icon ?? Icons.account_circle_sharp,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
