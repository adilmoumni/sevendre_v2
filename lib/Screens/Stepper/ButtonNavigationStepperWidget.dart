import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/Dossiers/Create/FormsScreen.dart';
import 'package:plan_de_financement/Screens/Dossiers/PdfScreen_new.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:html' as html;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

class StepperButtonWidget extends StatefulWidget {
  String uidClient = "";
  bool modifier = false;
  int nombreCliet = 1;
  StepperButtonWidget(
      {Key key,
      @required this.maxStepper,
      this.dataKey,
      this.uidClient,
      this.modifier,
      this.nombreCliet})
      : super(key: key);

  int maxStepper = 0;
  GlobalKey<State<StatefulWidget>> dataKey = new GlobalKey();
  @override
  _StepperButtonWidgetState createState() => _StepperButtonWidgetState();
}

class _StepperButtonWidgetState extends State<StepperButtonWidget> {
  double widthTextField = 600;
  String idDossier = "";
  String test = "";

  getIdDossier(String id) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    idDossier = prefs.getString('idDossier');
  }

  @override
  void initState() {
    getIdDossier(idDossier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);

    var checkwidth = (MediaQuery.of(context).size.width <= 350);

    void addDossier() {
      FirebaseFirestore.instance
          .collection('dossiers-v2')
          .add(model.informationClient)
          .then((value) {
        AwesomeDialog(
            width: widthTextField + 70,
            context: context,
            animType: AnimType.LEFTSLIDE,
            headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            showCloseIcon: true,
            dismissOnBackKeyPress: false,
            title: 'Succes',
            desc: 'Le dossier a enregistré avec succès',
            btnOkOnPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenPdfNew(
                        model.informationClient, model.dataOfTAbleau,
                        isSecondClientSelect:
                            model.informationClient['isSecondeUserChecked'])),
              );
            },
            btnOkText: checkwidth ? '' : "Télecharger le Pdf",
            btnCancelText: checkwidth ? '' : "Retour",
            btnCancelOnPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StepperScreen()));
            },
            btnOkIcon: Icons.save,
            btnCancelIcon: Icons.dashboard,
            onDissmissCallback: (type) {})
          ..show();
      });
    }

    void updateDossier2(String id) {
      FirebaseFirestore.instance
          .collection('dossiers')
          .doc(id)
          .update(model.informationClient)
          .then((value) {
        AwesomeDialog(
            width: widthTextField + 70,
            context: context,
            animType: AnimType.LEFTSLIDE,
            headerAnimationLoop: false,
            dialogType: DialogType.SUCCES,
            showCloseIcon: false,
            title: 'Succes',
            desc: 'Le dossier a été enregistré avec succès',
            btnOkOnPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScreenPdfNew(
                        model.informationClient, model.dataOfTAbleau,
                        isSecondClientSelect:
                            model.informationClient['isSecondeUserChecked'])),
              );

              // Navigator.pushNamed(context, '/folder/1');
              // _createPDF(model.informationClient).then(
              //     (value) => Navigator.pushNamed(context, '/TableauDeBoard'));
            },
            btnOkText: checkwidth ? '' : "Télecharger le Pdf",
            btnCancelText: checkwidth ? '' : "dashboard",
            btnCancelOnPress: () {
              Navigator.pushNamed(context, '/TableauDeBoard');
            },
            btnOkIcon: Icons.save,
            btnCancelIcon: Icons.dashboard,
            onDissmissCallback: (type) {})
          ..show();
      });
    }

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Visibility(
        visible: model.steppe != 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            model.getterSteppe == 0
                ? Container()
                : InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      var i = model.steppe + 2;
                      html.window.history
                          .pushState(null, "Home", "/#/folder/$i");
                      model.returnSteppe();
                    },
                    child: Container(
                      width: 100,
                      height: 40.0,
                      child: Center(
                        child: Wrap(
                          children: [
                            Text(
                              'Retour',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color(0xFF3a6259),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            model.getterSteppe + 1 == widget.maxStepper
                ? InkWell(
                    onTap: () {
                      if (model.formKey.currentState.validate()) {
                        if (widget.modifier == true) {
                          updateDossier2(idDossier);
                        } else {
                          addDossier();
                        }
                      }

                      //
                    },
                    child: Container(
                      width: 230,
                      height: 40.0,
                      decoration: new BoxDecoration(
                        color: Color(0xFF045258),
                        // border: new Border.all(color: Colors.white, width: 2.0),
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
                                widget.modifier == true
                                    ? 'Modifier'
                                    : 'Enregistrer',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                              Icon(
                                // Icons.file_download_rounded,
                                Icons.save,

                                color: Colors.white,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : ButtonWidgetHelper(
                    width: 200,
                    height: 40.0,
                    onTap: () async {
                      if (widget.modifier == true) {
                      } else {
                        model.getIsSecondeUseerSelected();

                        if (model.steppe == 3 && widget.uidClient == "" ||
                            widget.uidClient == null) {
                          model.getUidClient();
                        } else {
                          model.informationClient["uidClient"] =
                              widget.uidClient;
                        }
                        // uidclient33
                      }

                      if (model.formKey.currentState.validate()) {
                        if (model.steppe == 2) {
                          double montantDuCredit = double.parse(
                              model.informationClient[
                                  'montant_du_credit_bancaire_demande']);
                          double valDuBien = double.parse(
                              model.informationClient[
                                  "valeur_du_bien_estimee_par_le_client"]);

                          if (montantDuCredit > valDuBien) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Le montant du crédit bancaire demandé peut-être égal au maximum à la valeur du bien immobilier.')));
                            return;
                          }
                        }

                        var i = model.steppe + 2;
                        html.window.history
                            .pushState(null, "Home", "/#/folder/$i");
                        model.nextSteppe();
                        model.scrollToIndex();

                        model.steppe == 1
                            ? model.informationClient["reparation"] =
                                model.lisGrosseReparation
                            : print("!!");

                        model.steppe == 3
                            ? model.mensualiteDucredit_calculer()
                            : print("pas de calcul");

                        if (model.steppe == 3) {
                          model.calculeRemboursementInfinCompteCourant(
                              model.mensualiteDucredit_calculer());
                        }

                        if (model.steppe == 4) {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool("check", false);
                        }

                        Scrollable.ensureVisible(widget.dataKey.currentContext);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Les champs son obligatoire')),
                        );
                      }
                    },
                    textButton: "Suivant",
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 12,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

Future<Uint8List> _readImageData(String name) async {
  // final data = await rootBundle.load('images/$name');
  // return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  html.AnchorElement(
      href:
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
    ..setAttribute("download", fileName)
    ..click();
}
