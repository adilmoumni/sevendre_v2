import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';

import 'package:plan_de_financement/Screens/Stepper/ButtonNavigationStepperWidget.dart';
import 'package:plan_de_financement/Screens/Stepper/StepperHorizontalWidget.dart';
import 'package:plan_de_financement/Screens/Stepper/StepperVericalWidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FormChargesMensuel.dart';
import 'FormEvaluationFinaciere.dart';
import 'FormPage4.dart';
import 'FormRemboursementMensuelCreditImmobillier.dart';
import 'FormRevenuEtChargesClient.dart';
import 'FormRevenuNetmesuelDeCredit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'FormYourAccount.dart';

class StepperScreen extends StatefulWidget {
  String uidClient = "";
  bool modifier = false;
  int nombreCliet = 1;
  Map<String, Object> modification = {};
  StepperScreen(
      {Key key,
      this.uidClient,
      this.modification,
      this.modifier,
      this.nombreCliet})
      : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  bool check = false;
  Future getUserCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getBool("check");
    });
  }

  List<Widget> formsScreens = [];
  List<String> formsNameScreens = [
    "Informations relatives au bien immobilier",
    "Informations relatives au(x) propriétaire(s)",
    "Financement envisagé ",
    'La vente à soi-même en quatre chiffres clés',
    'TELECHARGER',
  ];
  ScrollController controller;

  double radusBorderStepper = 15.0;
  @override
  void initState() {
    getUserCheck();
    formsScreens = [
      FormRevenuEtChargesClient(
          modification: widget.modification, modifier: widget.modifier),
      FormRevenuNetmensuelDeCredit(nombreCliet: widget.nombreCliet), //completed
      FormEvaluationFinaciere(),
      FormPage4(),
      FormYourAccount(),
    ];

    super.initState();
  }

  final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var checkwidth = (MediaQuery.of(context).size.width <= 450);

    return ChangeNotifierProvider(
        create: (context) => ProviderSM(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                Selector<ProviderSM, int>(
                    selector: (context, getterSteppe) => getterSteppe.steppe,
                    builder: (context, steppe, child) {
                      return conditionResponive
                          ? Expanded(
                              child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF06464b),
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1.0),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StepperVericalWidget(
                                      key: dataKey,
                                      maxStepper: formsScreens.length,
                                      listForms: formsNameScreens,
                                    ),
                                  )))
                          : Container();
                    }),
                Selector<ProviderSM, int>(
                    selector: (context, getterSteppe) => getterSteppe.steppe,
                    builder: (context, steppe, child) {
                      return Expanded(
                        flex: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: Selector<ProviderSM, ScrollController>(
                              selector: (context, cnt) => cnt.scrollController,
                              builder: (context, con, child) {
                                return SingleChildScrollView(
                                  controller: con,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      conditionResponive
                                          ? Container(height: 0)
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF045258),
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Colors.grey[400],
                                                      width: 1.0,
                                                    ),
                                                  )),
                                              child: StepperHorizontalWidget(
                                                key: dataKey,
                                                maxStepper: formsScreens.length,
                                                listForms: formsNameScreens,
                                              ),
                                            ),
                                      Container(
                                        // height:  steppe == 3
                                        //     ? MediaQuery.of(context).size.height
                                        //     : null,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: IconButton(
                                                            color: Colors.white,
                                                            icon: Icon(
                                                                Icons
                                                                    .arrow_back_rounded,
                                                                color: Color(
                                                                    0xFF045258)),
                                                            onPressed: () {
                                                              AwesomeDialog(
                                                                  buttonsTextStyle:
                                                                      TextStyle(
                                                                          fontSize: 14
                                                                              .sp),
                                                                  width: 600,
                                                                  context:
                                                                      context,
                                                                  animType: AnimType
                                                                      .LEFTSLIDE,
                                                                  headerAnimationLoop:
                                                                      false,
                                                                  dialogType:
                                                                      DialogType
                                                                          .SUCCES,
                                                                  showCloseIcon:
                                                                      true,
                                                                  dismissOnBackKeyPress:
                                                                      false,
                                                                  title: '',
                                                                  desc:
                                                                      'si vous retourner au menu les donnés sera perdu',
                                                                  btnOkOnPress:
                                                                      () {
                                                                    debugPrint(
                                                                        'OnClcik');
                                                                  },
                                                                  btnOkText:
                                                                      checkwidth
                                                                          ? ''
                                                                          : "Annuler",
                                                                  btnCancelText:
                                                                      checkwidth
                                                                          ? ''
                                                                          : "Retour",
                                                                  btnCancelOnPress:
                                                                      () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                StepperScreen()));
                                                                    // Navigator.pushNamed(context, '/TableauDeBoard');
                                                                  },
                                                                  btnOkIcon:
                                                                      Icons
                                                                          .save,
                                                                  btnCancelIcon:
                                                                      Icons
                                                                          .dashboard,
                                                                  onDissmissCallback:
                                                                      (type) {
                                                                    debugPrint(
                                                                        'Dialog Dissmiss from callback $type');
                                                                  })
                                                                ..show();
                                                            }),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(children: [
                                                          Text(
                                                              " ${steppe + 1}/",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                          .grey[
                                                                      500],
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                          Text(
                                                              "${formsNameScreens.length}",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color(
                                                                      0xFF045258),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))
                                                        ]),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        child: Text(
                                                            formsNameScreens[
                                                                steppe],
                                                            style: TextStyle(
                                                                fontSize: 25,
                                                                color: Color(
                                                                    0xFF4a8b88),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(height: 20),
                                            Selector<ProviderSM, int>(
                                                selector:
                                                    (context, getterSteppe) =>
                                                        getterSteppe.steppe,
                                                builder:
                                                    (context, steppe, child) {
                                                  return formsScreens[steppe];
                                                }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: StepperButtonWidget(
                                                  maxStepper:
                                                      formsScreens.length,
                                                  dataKey: dataKey,
                                                  uidClient: widget.uidClient,
                                                  modifier: widget.modifier,
                                                  nombreCliet:
                                                      widget.nombreCliet),
                                            )

                                            //     }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      );
                    }),
              ],
            )));
  }
}
