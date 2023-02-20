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

//-----------------------Controller Text --------------------------------

  TextEditingController revenueP1Controller = TextEditingController();
  TextEditingController revenueP1LocatifController =
      TextEditingController();

   TextEditingController revenueP2LocatifController =
      TextEditingController();


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


        TextEditingController codePostalDuDomicileProprietaire =
      TextEditingController();
 TextEditingController ageDuPro1Controller =
      TextEditingController(); TextEditingController ageDuPro2Controller =
      TextEditingController();
    
      bool isSecondeUserChecked =  false;
//-----------------------Controller Text --------------------------------

  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);
    revenueP1Controller.text =
        model.informationClient["revenue_anuelle_du_proprietaire_1"];
    revenueP2Controller.text =
        model.informationClient["revenue_anuelle_du_proprietaire_2"];
    revenueNetDeCreditP1Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1"];
    revenueNetDeCreditP2Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"];
    chargeAnunelleDeCreditEnCoursDuP2Controller.text = model.informationClient[
        "charges_annuelle_de_credit_en_cours_du_proprieteire_2"];
    chargeAnunelleDeCreditEnCoursDu1Controller.text = model.informationClient[
        "charges_annuelle_de_credit_en_cours_du_proprieteire_1"];
       revenueP1LocatifController.text =  model.informationClient[
            "revenueP1Locatif"] ;

    revenuePAnnuelController.text =
        model.informationClient["revenu_annuel_global_net"];
    capaciteMaximalRemboursementMensuelController.text =
        model.informationClient["capacite_maximal_de_rembouresement_mensuel"];
    revenuAnnuelleDuProprietaireController.text =
        model.informationClient["revenu_annuels_du_propriétaire"];
    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;

    codePostalDuDomicileProprietaire.text =  model.informationClient["code_postal_du_domicile_proprietaire"];
    
     ageDuPro1Controller.text =  model.informationClient["age_du_propriétaire"];
     ageDuPro2Controller.text =  model.informationClient["age_du_propriétaire_2"];


    revenueP2LocatifController.text  = 
                  model.informationClient["revenue_anuelle_du_proprietaire_2"];

    isSecondeUserChecked =  model.informationClient['isSecondeUserChecked'];      
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
                    "Code postal du domicile du(des) propriétaire(s)*",
                validator: model.validatorTextFieldString,
                controller: codePostalDuDomicileProprietaire,
                onChanged: (val) {
                  model.informationClient["code_postal_du_domicile_proprietaire"] =
                      val;
              
                }),
          ),

          Container(
            width: widthTextField,
            padding: EdgeInsets.only(left: 21,  bottom: 21),
            child: Row(children: [
              Checkbox(value: isSecondeUserChecked, onChanged: (val){
                setState(() {
                  model.informationClient['isSecondeUserChecked'] = val;
                  isSecondeUserChecked = val;
                });

              }),
              Text('Ajouter un co-propriétaire (option)'),
            ],)
          ),


            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    width: widthTextField,
                    labelField:
                        "Age du propriétaire",
                    // helperText: "Entrer Mensualité du crédit",
                    validator: model.validatorTextFieldString,
                    controller: ageDuPro1Controller,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["age_du_propriétaire"] =
                          val;

                    }),
              ),

               Visibility(
                visible:isSecondeUserChecked ,
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      labelField:
                          "Age du co-propriétaire",
                      // helperText: "Entrer Mensualité du crédit",
                      validator: model.validatorTextFieldString,
                      controller: ageDuPro2Controller,
                      isDouble: true,
                      onChanged: (val) {
                        model.informationClient["age_du_propriétaire_2"] =
                            val;

                      }),
              ),
               ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField:
                    "Revenus annuels hors revenus locatifs du propriétaire (salaire, honoraires, pension(s), etc)",
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
                labelField: "Revenus annuels locatifs du propriétaire",
                // helperText: "Entrer Mensualité du crédit",
                validator: model.validatorTextFieldString,
                controller: revenueP1LocatifController,
                isDouble: true,
                onChanged: (val) {
                  // this is the champs must be changed  we can take juste 70%

                  model.informationClient["revenueP1Locatif"] =
                      val;
                  calculRvnAnetCreditduprop1();
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField:
                    "Charges annuelles de crédit en cours du propriétaire",
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

            Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                // isInt: true,
                width: widthTextField,
                labelField:
                    "Revenus annuel net de crédit en cours du propriétaire",
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



          isSecondeUserChecked
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      labelField:
                          "Revenus annuels du co-propriétaire (Travail, Retraite, Pension(s) hors revenus locatifs)",
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

                     Visibility(
                      visible: isSecondeUserChecked,
                       child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Revenus annuels locatifs du co-propriétaire",
                // helperText: "Entrer Mensualité du crédit",
                validator: model.validatorTextFieldString,
                controller: revenueP2LocatifController,
                isDouble: true,
                onChanged: (val) {
                  // this is the champs must be changed  we can take juste 70%

                  model.informationClient["revenue_anuelle_du_proprietaire_2"] =
                      val;
                  calculRvnAnetCreditduprop2();
                  CalculRevenueAnnuelETCpaciteMaximal(context);
                }),
          ),
                     ),


          isSecondeUserChecked
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      labelField:
                          "Charges annuelles de crédit en cours du co-propriétaire",
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
        
          isSecondeUserChecked
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    // isInt: true,
                    width: widthTextField,
                    labelField:
                        "Revenus annuel net de crédit en cours du co-propriétaire ",
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
                labelField: "Revenus annuel net de crédit en cours des co-propriétaires",
                // validator: model.validatorTextFieldisDouble,
                controller: revenuePAnnuelController,
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient["revenu_annuel_global_net"] = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Capacité maximale de remboursement mensuel",
                helperText: "Capacité maximale de remboursement mensuel",
                // validator: model.validatorTextFieldisDouble,
                controller: capaciteMaximalRemboursementMensuelController,
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient[
                      "capacite_maximal_de_rembouresement_mensuel"] = val;
                }),
          ),
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
                  int.parse(revenueNetDeCreditP2Controller.text ?? "0"))
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
            int.parse(chargeAnunelleDeCreditEnCoursDuP2Controller.text) ) + ( int.parse( revenueP2LocatifController.text ) * 0.7 ).round())
        .toString();

      if(revenueP2LocatifController.text == null || revenueP2LocatifController.text.isEmpty){
        revenueP2LocatifController.text = '0';
      }
  }

  _printLatestValue1(ProviderSM model) {
    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

    _printLatestValue3(ProviderSM model) {

    model.informationClient["revenu_annuel_global_net"] =
        revenuePAnnuelController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

  _printLatestValue2(ProviderSM model) {
   
    model.informationClient[
            "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1"] =
        revenueNetDeCreditP1Controller.text;

    CalculRevenueAnnuelETCpaciteMaximal(context);
  }

  printLatestValueRevenueLocatif(ProviderSM model) {

           revenueNetDeCreditP2Controller.text = model.informationClient[
        "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2"] = revenueNetDeCreditP2Controller.text;
    model.informationClient[
            "revenueP1Locatif"] =
        revenueP1LocatifController.text;
    CalculRevenueAnnuelETCpaciteMaximal(context);
  }
}
