import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPage4 extends StatefulWidget {
  const FormPage4({Key key}) : super(key: key);

  @override
  _FormPage4State createState() => _FormPage4State();
}

class _FormPage4State extends State<FormPage4> {
  double widthTextField = 600;
  List<int> list = [5, 10, 15, 20, 25];

  TextEditingController montantCreditBancaireDemandecontroller =
      TextEditingController(text: "1234");
  TextEditingController dureeDeRemboursementcontrolle =
      TextEditingController(text: "1234");
  TextEditingController tauxDinteretMoyencontrolle =
      TextEditingController(text: "1234");

  TextEditingController taux_de_lassurance_emprunteur_assure_1_quotite =
      TextEditingController(text: "");

  TextEditingController creditImmoDisponibleInLimineController =
      TextEditingController(text: "");

  TextEditingController remboursementInfineDuCompteCourantController =
      TextEditingController(text: "");

  TextEditingController chargeMensuellePendentLaDureDuCreditController =
      TextEditingController(text: "");

  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);

    montantCreditBancaireDemandecontroller.text =
        model.informationClient["montant_du_credit_bancaire_demande"];
    dureeDeRemboursementcontrolle.text =
        model.informationClient["duree_de_remboursement"];
    tauxDinteretMoyencontrolle.text =
        model.informationClient["Taux_interet_Moyen_en_%"];
    if (model.informationClient["duree_de_remboursement"] == "") {
      model.informationClient["duree_de_remboursement"] = list.first.toString();
    }

    taux_de_lassurance_emprunteur_assure_1_quotite.text = model
        .informationClient["taux_de_lassurance_emprunteur_assure_1_quotite"];

    creditImmoDisponibleInLimineController.text =
        model.informationClient["CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE"];

    remboursementInfineDuCompteCourantController.text =
        model.informationClient["remboursement_in_fine_du_compte_courant"];

    chargeMensuellePendentLaDureDuCreditController.text =
        (double.parse(model.informationClient['Credit_immobilier_de_la_SCI']) +
                double.parse(model.informationClient['cumuleMoyenLoyer']))
            .toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);

    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                // controller: controlle1,
                controller: creditImmoDisponibleInLimineController,
                labelField: "CRÉDIT IMMOBILIER DISPONIBLE IN LIMINE*",
                isDouble: true,
                enabled: true,
                // isDouble: true,
                onChanged: (val) {
                  model.informationClient[
                      "CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE"] = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                // controller: controlle1,
                controller: remboursementInfineDuCompteCourantController,
                labelField: "REMBOURSEMENT IN FINE DU COMPTE COURANT**",
                isDouble: true,
                enabled: true,
                onChanged: (val) {
                  model.informationClient[
                      "remboursement_in_fine_du_compte_courant"] = val;
                }),
          ),
          Visibility(
            visible: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldHelper2(
                  width: widthTextField,
                  // controller: controlle1,
                  controller: chargeMensuellePendentLaDureDuCreditController,
                  labelField: "CHARGES MENSUELLE PENDANT LA DURÉE DU CRÉDIT",
                  isDouble: true,
                  enabled: true,
                  // isDouble: true,
                  onChanged: (val) {}),
            ),
          ),
          Container(
              width: widthTextField,
              child: Column(
                children: [
                  Text(
                    '*Montant du crédit immobilier payé par la Société au propriétaire dès après la réception de la vente par le notaire, déduction faite des sommes devant être remboursées par la Société à ses associés qui ont lui en ont consenti l’avance, et qui sont inscrits sur leurs comptes courants d’associés : frais & honoraires afférents à l’opération et éventuels appels de trésorerie.',
                    style: TextStyle(fontSize: 12),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '** Le compte courant d’associé (CCA) est un compte courant ouvert au nom de chaque associé dans les livres comptables de la Société qui, lorsqu’il est créditeur, établit la somme due par la Société à chaque associé devant lui être remboursé par elle. Ce compta inclut les frais dont les associés ont consenti l’avance à la Société : frais de notaire, honoraires, et éventuels appels de trésorerie.  ',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
