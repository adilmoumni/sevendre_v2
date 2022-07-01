import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:provider/provider.dart';

class StepperVericalWidget extends StatefulWidget {
  StepperVericalWidget({
    Key key,
    this.maxStepper,
    this.listForms,
  }) : super(key: key);
  int maxStepper = 0;

  List<String> listForms;
  Future<dynamic> scrollToIndex;

  @override
  _StepperVericalWidgetState createState() => _StepperVericalWidgetState();
}

class _StepperVericalWidgetState extends State<StepperVericalWidget> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: model.controller,
            // scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:SvgPicture.asset(
            "assets/images/Logo_Sevendre.svg",
            height: 30,
            color: Colors.white,
          ),),
                ),
                SizedBox(
                  height: 30,
                ),
                for (int i = 0;
                    // i < 2
                    i < widget.maxStepper;
                    i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // alignment: Alignment.centerLeft,

                        child: Wrap(
                          //  alignment = WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                width: 20,
                                height: 20,
                                child: i < model.getterSteppe
                                    ? Icon(
                                        Icons.check,
                                        size: 15,
                                        color: Colors.black,
                                      )
                                    : Container(),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: i <= model.getterSteppe
                                            ? Colors.white
                                            : Colors.black87),
                                    shape: BoxShape.circle,
                                    color: i < model.getterSteppe
                                        ? Colors.white
                                        : Colors.transparent),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: 250,
                                  // color: Colors.orange,
                                  child: Text(
                                    "${widget.listForms[i]}",
                                    style: TextStyle(
                                        color: i < model.getterSteppe
                                            ? Colors.white
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                            Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: i == model.getterSteppe
                                      ? Colors.white
                                      : Color(0xFF06464b),
                                ),
                                shape: BoxShape.circle,
                                color: i == model.getterSteppe
                                    ? Colors.white
                                    : Color(0xFF06464b),
                              ),
                            )
                          ],
                        ),
                      ),
                      // i + 1 == widget.maxStepper
                      //     ? Container()
                      //     :
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                color: Colors.transparent,
                                width: 20,
                              ),
                              i + 1 == widget.maxStepper
                                  ? Container(
                                      width: 1.0,
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                    )
                                  : Container(
                                      height: 20.0,
                                      width: 1.0,
                                      color: i < model.getterSteppe
                                          ? Colors.white
                                          : Colors.black,
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                    ),
                            ]),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
