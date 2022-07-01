import 'dart:html';

import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';
import 'package:provider/provider.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormRevenuNetmensuelDeCredit extends StatefulWidget {
  int nombreCliet  =1;
   FormRevenuNetmensuelDeCredit({Key key,this.nombreCliet}) : super(key: key);

  @override
  _FormRevenuNetmensuelDeCreditState createState() =>
      _FormRevenuNetmensuelDeCreditState();
}

class _FormRevenuNetmensuelDeCreditState
    extends State<FormRevenuNetmensuelDeCredit> {
  double widthTextField = 600;
  bool check = false;
  Future getUserCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      check = prefs.getBool("check");
    });
  }

//-----------------------Controller Text --------------------------------

  TextEditingController revenueP1Controller = TextEditingController();
  TextEditingController revenueP1LocatifController =
      TextEditingController(text: '0');
  TextEditingController revenueP2Controller = TextEditingController();
  TextEditingController revenueNetDeCreditP1Controller =
      TextEditingController();
  TextEditingController revenueNetDeCreditP2Controller =
      TextEditingController();
  TextEditingController chargeAnunelleDeCreditEnCoursDuP2Controller =
      TextEditingController();
  TextEditingController chargeAnunelleDeCreditEnCoursDu1Controller =
      TextEditingController();
  TextEditingController revenuePAnnuelController = TextEditingController();
  TextEditingController capaciteMaximalRemboursementMensuelController =
      TextEditingController();
  TextEditingController revenuAnnuelleDuProprietaireController =
      TextEditingController();
  TextEditingController revenuAnnuelleGlobalNetController =
      TextEditingController();
//-----------------------Controller Text --------------------------------

  @override
  void initState() {
    getUserCheck();
    final model = Provider.of<ProviderSM>(context, listen: false);
    revenueP1Controller.text =
        model.informationClient["revenue_anuelle_du_proprietaire_1"];
    revenueP2Controller.text =
        model.informationClient["revenue_anuelle_du_proprietaire_2"];
    revenueNetDeCreditP1Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1"];

        print('================= ');
        print( model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"]);
    revenueNetDeCreditP2Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"];
    chargeAnunelleDeCreditEnCoursDuP2Controller.text = model.informationClient[
        "charges_annuelle_de_credit_en_cours_du_proprieteire_2"];
    chargeAnunelleDeCreditEnCoursDu1Controller.text = model.informationClient[
        "charges_annuelle_de_credit_en_cours_du_proprieteire_1"];
       revenueP1LocatifController.text =   model.informationClient[
            "revenueP1Locatif"] ;

    revenuePAnnuelController.text =
        model.informationClient["revenu_annuel_global_net"];
    capaciteMaximalRemboursementMensuelController.text =
        model.informationClient["capacite_maximal_de_rembouresement_mensuel"];
    revenuAnnuelleDuProprietaireController.text =
        model.informationClient["revenu_annuels_du_propriétaire"];
    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;

    revenuePAnnuelController.addListener(() => _printLatestValue1(model));
    revenueNetDeCreditP1Controller.addListener(() => _printLatestValue2(model));
    revenueNetDeCreditP2Controller.addListener(() => _printLatestValue3(model));
    revenueNetDeCreditP2Controller.addListener(() => printLatestValueRevenueLocatif(model));
    // revenueP1Controller.addListener(() => _printLatestValue());

    // CalculRevenueAnnuelETCpaciteMaximal(context);
    // test2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField:
                    "Revenus annuels de l'associé 1 (Travail, Retraite, Pension hors revenus locatifs)",
                // helperText: "Entrer Mensualité du crédit",
                validator: model.validatorTextFieldString,
                controller: revenueP1Controller,
                isDouble: true,
                onChanged: (val) {
                  model.informationClient["revenue_anuelle_du_proprietaire_1"] =
                      val;
                  calculRvnAnetCreditduprop1();
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Revenus annuels (locatifs) de l'associé 1",
                // helperText: "Entrer Mensualité du crédit",
                validator: model.validatorTextFieldString,
                controller: revenueP1LocatifController,
                isDouble: true,
                onChanged: (val) {
                  // this is the champs must be changed  we can take juste 70%

                  // model.informationClient["revenue_anuelle_du_proprietaire_1"] =
                  //     val;
                  calculRvnAnetCreditduprop1();
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField:
                    "Charges annuelles de crédit en cours de l'associé 1",
                helperText:
                    "Charges annuelles de crédit en cours de l'associé 1",
                validator: model.validatorTextFieldString,
                controller: chargeAnunelleDeCreditEnCoursDu1Controller,
                isDouble: true,
                onChanged: (val) {

                  calculRvnAnetCreditduprop1();
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                  model.informationClient[
                          "charges_annuelle_de_credit_en_cours_du_proprieteire_1"] =
                      val;


                  // CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),
          model.client1['is_seconde_useer_selected']
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      labelField:
                          "Revenus annuels de l'associé 2 (Travail, Retraite, Pension hors revenus locatifs)",
                      // helperText: "Entrer Mensualité du crédit",
                      validator: model.validatorTextFieldString,
                      controller: revenueP2Controller,
                      isDouble: true,
                      onChanged: (val) {
                        model.informationClient[
                            "revenue_anuelle_du_proprietaire_2"] = val;

                        calculRvnAnetCreditduprop2();
                        CalculRevenueAnnuelETCpaciteMaximal(context);

                        model.informationClient['revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2'] = 
                        revenueNetDeCreditP2Controller.text;
                      }),
                )
              : Container(),
          model.client1['is_seconde_useer_selected']
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      labelField:
                          "Charges annuelles de crédit en cours de l'associé 2",
                      helperText:
                          "Charges annuelles de crédit en cours de l'associé 2",
                      validator: model.validatorTextFieldString,
                      controller: chargeAnunelleDeCreditEnCoursDuP2Controller,
                      isDouble: true,
                      onChanged: (val) {
                        model.informationClient[
                                "charges_annuelle_de_credit_en_cours_du_proprieteire_2"] =
                            val;
                        calculRvnAnetCreditduprop2();
                        CalculRevenueAnnuelETCpaciteMaximal(context);
                      }),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                // isInt: true,
                width: widthTextField,
                labelField:
                    "Revenu annuel net de crédit en cours de l'associé 1",
                helperText:
                    "Revenu annuelles net de crédit en cours de l'associé 1",
                // validator: model.validatorTextFieldisDouble,//automatik
                controller: revenueNetDeCreditP1Controller,
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient[
                          "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1"] =
                      val;
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),

          model.client1['is_seconde_useer_selected']
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    // isInt: true,
                    width: widthTextField,
                    labelField:
                        "Revenu annuel net de crédit en cours de l'associé 2",
                    helperText:
                        "Revenu annuel net de crédit en cours de l'associé 2",
                    // validator: model.validatorTextFieldisDouble,
                    controller: revenueNetDeCreditP2Controller,
                    enabled: true,
                    onChanged: (val) {
                      model.informationClient[
                              "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"] =
                          val;
                      CalculRevenueAnnuelETCpaciteMaximal(context);
                    },
                    isDouble: true,
                  ),
                )
              : Container(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Revenu annuel net",
                helperText: "Revenu annuel net",
                // validator: model.validatorTextFieldisDouble,
                controller: revenuePAnnuelController,
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient["revenu_annuel_global_net"] = val;
                }),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFieldHelper2(
          //       width: widthTextField,
          //       labelField: "Revenu annuels du propriétaire",
          //       helperText: "Revenu annuels du propriétaire",
          //       // validator: model.validatorTextFieldisDouble,
          //       controller: revenuAnnuelleDuProprietaireController,
          //       onChanged: (val) {
          //         model.informationClient["revenu_annuels_du_propriétaire"] =
          //             val;
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Capacité maximal de remboursement mensuel",
                helperText: "Capacité maximal de remboursement mensuel",
                // validator: model.validatorTextFieldisDouble,
                controller: capaciteMaximalRemboursementMensuelController,
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient[
                      "capacite_maximal_de_rembouresement_mensuel"] = val;
                }),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFieldHelper2(
          //       width: widthTextField,
          //       labelField: "Capacité maximale",
          //       helperText: "Capacité maximale",
          //       validator: model.validatorTextFieldisDouble,
          //       // controller: capaciteMaximalRemboursementMensuelController,

          //       onChanged: (val) {}),
          // ),
        ],
      ),
    );
  }

  CalculRevenueAnnuelETCpaciteMaximal(context) {
    final model = Provider.of<ProviderSM>(context, listen: false);

    if (revenueNetDeCreditP2Controller.text.isEmpty) {
      revenuePAnnuelController.text = revenueNetDeCreditP1Controller.text;
      model.informationClient["revenu_annuel_global_net"] =
          revenuePAnnuelController.text;
      capaciteMaximalRemboursementMensuelController.text =
          (((int.parse(revenuePAnnuelController.text) * 0.35) / 12).round())
              .toString();

      model.informationClient["capacite_maximal_de_rembouresement_mensuel"] =
          capaciteMaximalRemboursementMensuelController.text;

      model.informationClient["revenu_annuel_global_net"] =
          revenuePAnnuelController.text;
    } else {
      revenuePAnnuelController.text =
          (int.parse(revenueNetDeCreditP1Controller.text ?? "0") +
                  int.parse(revenueNetDeCreditP1Controller.text ?? "0"))
              .toString();

      capaciteMaximalRemboursementMensuelController.text =
          (((int.parse(revenuePAnnuelController.text) * 0.35) / 12).round())
              .toString();

      model.informationClient["capacite_maximal_de_rembouresement_mensuel"] =
          capaciteMaximalRemboursementMensuelController.text;

      model.informationClient["revenu_annuel_global_net"] =
          revenuePAnnuelController.text;
    }
  }

  void calculRvnAnetCreditduprop1() {
    if (revenueP1Controller.text == "" || revenueP1Controller.text == null) {
      revenueP1Controller.text = "";
    }
    if (chargeAnunelleDeCreditEnCoursDu1Controller.text == "" ||
        chargeAnunelleDeCreditEnCoursDu1Controller.text == null) {
      chargeAnunelleDeCreditEnCoursDu1Controller.text = "";
    }

    int revenuLocatif = int.parse(revenueP1LocatifController.text) ?? 0;
    revenueNetDeCreditP1Controller.text = (int.parse(revenueP1Controller.text) +
            (revenuLocatif * 0.7).round() -
            int.parse(chargeAnunelleDeCreditEnCoursDu1Controller.text))
        .toString();
  }

  void calculRvnAnetCreditduprop2() {
    if (revenueP2Controller.text == "" || revenueP2Controller.text == null) {
      revenueP2Controller.text = "";
    }

    if (chargeAnunelleDeCreditEnCoursDuP2Controller.text == "" ||
        chargeAnunelleDeCreditEnCoursDuP2Controller.text == null) {
      chargeAnunelleDeCreditEnCoursDuP2Controller.text = "";
    }
    revenueNetDeCreditP2Controller.text = ((int.parse(revenueP2Controller.text) 
    -
            int.parse(chargeAnunelleDeCreditEnCoursDuP2Controller.text) ) + ( int.parse( revenueP1LocatifController.text ) * 0.7 ).round())
        .toString();
  }

  _printLatestValue1(ProviderSM model) {
    print('Received form first controller: ${revenuePAnnuelController.text}');

    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

    _printLatestValue3(ProviderSM model) {
    print('Received form first controller: ${revenuePAnnuelController.text}');

    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

  _printLatestValue2(ProviderSM model) {
    print(
        'Received form first controller: ${revenueNetDeCreditP1Controller.text}');
    model.informationClient[
            "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1"] =
        revenueNetDeCreditP1Controller.text;

    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

  printLatestValueRevenueLocatif(ProviderSM model) {
    print(
        'Received form first controller: ${revenueP1LocatifController.text}');
           revenueNetDeCreditP2Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"] = revenueNetDeCreditP2Controller.text;
    model.informationClient[
            "revenueP1Locatif"] =
        revenueP1LocatifController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }
}
