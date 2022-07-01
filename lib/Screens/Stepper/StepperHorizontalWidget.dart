import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class StepperHorizontalWidget extends StatefulWidget {
  StepperHorizontalWidget({
    Key key,
    this.maxStepper,
    this.listForms,
    this.steppe,
    this.scrollToIndex,
  }) : super(key: key);
  int maxStepper = 0;
  int steppe = 0;
  List<String> listForms;
  Future<dynamic> scrollToIndex;

  @override
  _StepperHorizontalWidgetState createState() =>
      _StepperHorizontalWidgetState();
}

class _StepperHorizontalWidgetState extends State<StepperHorizontalWidget> {
  AutoScrollController controller;
  final scrollDirection = Axis.horizontal;

  @override
  void initState() {
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(MediaQuery.of(context).padding.left, 0, 0, 0),
        axis: scrollDirection);
    super.initState();
  }

  Future _scrollToIndex() async {
    await controller.scrollToIndex(5, preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);
    return Container(
      child: Center(
        child: SingleChildScrollView(
          controller: model.controller,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.maxStepper; i++)
                AutoScrollTag(
                  key: ValueKey(i),
                  controller: model.controller,
                  index: i,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${widget.listForms[i]}",
                          textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: i <= model.getterSteppe
                                      ? Colors.white
                                      : Colors.grey[400])),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: 22,
                              height: 22,
                              child: Center(
                                  child: i < model.getterSteppe
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.black,
                                          size: 15,
                                        )
                                      : Container()),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: i <= model.getterSteppe
                                          ? Colors.white
                                          : Colors.grey[400]),
                                  shape: BoxShape.circle,
                                  color: i < model.getterSteppe
                                      ? Colors.white
                                      : Colors.transparent),
                            ),
                          ),
                          // i + 1 == widget.maxStepper
                          //     ? Container()
                          //     : Container(
                          //         height: 1.0,
                          //         width: 30.0,
                          //         color: Colors.black,
                          //         margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          //       ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
