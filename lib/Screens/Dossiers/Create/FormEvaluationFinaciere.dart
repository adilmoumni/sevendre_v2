import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormEvaluationFinaciere extends StatefulWidget {
  const FormEvaluationFinaciere({Key key}) : super(key: key);

  @override
  _FormEvaluationFinaciereState createState() =>
      _FormEvaluationFinaciereState();
}

class _FormEvaluationFinaciereState extends State<FormEvaluationFinaciere> {
  bool check = false;
  Future getUserCheck(ProviderSM model) async {
    if (model.informationClient['uidClient'].toString().isEmpty) {
    } else {
      // check if quotite 1 is empty, then if empty make a auto percentage
      if (model.informationClient[
              "taux_de_lassurance_emprunteur_assure_1_quotite"] ==
          "") {
        String ageClient1 = getPercentParApportAlage(
                int.parse(model.informationClient['age_du_propriétaire']))
            .toString();
        model.informationClient[
            "taux_de_lassurance_emprunteur_assure_1_quotite"] = ageClient1;
        taux_de_lassurance_emprunteur_assure_1_quotite.text = ageClient1;
      } else {
        taux_de_lassurance_emprunteur_assure_1_quotite.text =
            model.informationClient[
                "taux_de_lassurance_emprunteur_assure_1_quotite"];
      }

      if (model.informationClient['isSecondeUserChecked']) {
        setState(() {
          check = true;
        });

        if (model.informationClient[
                "taux_de_lassurance_emprunteur_assure_2_quotite"] ==
            "100") {
          taux_de_lassurance_emprunteur_assure_2_quotite.text =
              model.informationClient[
                  "taux_de_lassurance_emprunteur_assure_2_quotite"];
        } else if (model.informationClient[
                "taux_de_lassurance_emprunteur_assure_2_quotite"] !=
            "") {
          taux_de_lassurance_emprunteur_assure_2_quotite.text =
              model.informationClient[
                  "taux_de_lassurance_emprunteur_assure_2_quotite"];
        } else {
          String ageClient2 = getPercentParApportAlage(
                  int.parse(model.informationClient['age_du_propriétaire_2']))
              .toString();
          taux_de_lassurance_emprunteur_assure_2_quotite.text = ageClient2;

          model.informationClient[
              "taux_de_lassurance_emprunteur_assure_2_quotite"] = ageClient2;
        }
      }
    }
  }

  getPercentParApportAlage(int age) {
    if (age < 30) {
      return 0.15;
    } else if (age >= 30 && age < 36) {
      return 0.22;
    } else if (age >= 36 && age < 41) {
      return 0.38;
    } else if (age >= 41 && age < 46) {
      return 0.38;
    } else if (age >= 46 && age < 51) {
      return 0.62;
    } else if (age >= 51 && age < 56) {
      return 0.62;
    } else if (age >= 56 && age < 61) {
      return 0.84;
    } else if (age >= 61) {
      return 0.84;
    }
  }

  getUserByUID(String uid) async {
    DocumentReference doc_ref =
        FirebaseFirestore.instance.collection("clients").doc(uid);

    DocumentSnapshot docSnap = await doc_ref.get();

    return docSnap;
  }

  double widthTextField = 600;
  List<int> list = [5, 10, 15, 20, 25];

  TextEditingController montantCreditBancaireDemandecontroller =
      TextEditingController(text: "1234");

  TextEditingController creditVendeurController =
      TextEditingController(text: "");

  TextEditingController dureeDeRemboursementcontrolle =
      TextEditingController(text: "1234");
  TextEditingController tauxDinteretMoyencontrolle =
      TextEditingController(text: "1234");

  TextEditingController taux_de_lassurance_emprunteur_assure_1_quotite =
      TextEditingController(text: "");

  TextEditingController taux_de_lassurance_emprunteur_assure_2_quotite =
      TextEditingController(text: "");

  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);

    if (model.informationClient["montant_du_credit_bancaire_demande"] == "") {
      try {
        double duree =
            double.parse(model.informationClient["duree_de_remboursement"]);
        double capacite = double.parse(model
            .informationClient["capacite_maximal_de_rembouresement_mensuel"]);

        double mcbd = (capacite *
            int.parse(model.informationClient["duree_de_remboursement"]) *
            12);

        if (mcbd >
            double.parse(model
                .informationClient["valeur_du_bien_estimee_par_le_client"])) {
          montantCreditBancaireDemandecontroller.text =
              model.informationClient["valeur_du_bien_estimee_par_le_client"];
        } else {
          montantCreditBancaireDemandecontroller.text = mcbd.toString();
        }

        model.informationClient["montant_du_credit_bancaire_demande"] =
            montantCreditBancaireDemandecontroller.text;
      } catch (e) {
        print("Error: $e");
      }
    } else {
      montantCreditBancaireDemandecontroller.text =
          model.informationClient["montant_du_credit_bancaire_demande"];
    }

    creditVendeurController.text = (double.parse(model
                .informationClient["valeur_du_bien_estimee_par_le_client"]) -
            double.parse(
                model.informationClient["montant_du_credit_bancaire_demande"]))
        .toString();
    model.informationClient["CREDIT_VENDEUR"] = creditVendeurController.text;

    dureeDeRemboursementcontrolle.text =
        model.informationClient["duree_de_remboursement"];
    tauxDinteretMoyencontrolle.text =
        model.informationClient["Taux_interet_Moyen_en_%"];
    if (model.informationClient["duree_de_remboursement"] == "") {
      model.informationClient["duree_de_remboursement"] = "20";
    }

    taux_de_lassurance_emprunteur_assure_1_quotite.text = model
        .informationClient["taux_de_lassurance_emprunteur_assure_1_quotite"];

    taux_de_lassurance_emprunteur_assure_2_quotite.text = model
        .informationClient["taux_de_lassurance_emprunteur_assure_2_quotite"];

    // this is the same coede used in the dropdown for "durée de remboursement"  just to keep the update in init state
    /////////////////////////////////////////////////////////////////////////////
    double capacite = double.parse(
        model.informationClient["capacite_maximal_de_rembouresement_mensuel"]);

    double mcbd = (capacite *
        int.parse(model.informationClient["duree_de_remboursement"]) *
        12);

    if (mcbd >
        double.parse(
            model.informationClient["valeur_du_bien_estimee_par_le_client"])) {
      montantCreditBancaireDemandecontroller.text =
          model.informationClient["valeur_du_bien_estimee_par_le_client"];
    } else {
      montantCreditBancaireDemandecontroller.text = mcbd.toString();
    }

    model.informationClient["montant_du_credit_bancaire_demande"] =
        montantCreditBancaireDemandecontroller.text;

    creditVendeurController.text = (double.parse(model
                .informationClient["valeur_du_bien_estimee_par_le_client"]) -
            double.parse(
                model.informationClient['montant_du_credit_bancaire_demande']))
        .toString();
    /////////////////////////////////////////////////////////////////////////////

    getUserCheck(model);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);

    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                controller: montantCreditBancaireDemandecontroller,
                labelField: "Montant du crédit bancaire demandé*",
                validator: model.validatorTextFieldisDouble,
                isDouble: true,
                onChanged: (val) {
                  model.informationClient[
                      "montant_du_credit_bancaire_demande"] = val;
                  try {
                    creditVendeurController.text = (double.parse(
                                model.informationClient[
                                    "valeur_du_bien_estimee_par_le_client"]) -
                            double.parse(val))
                        .toString();
                    model.informationClient["CREDIT_VENDEUR"] =
                        creditVendeurController.text;
                  } catch (e) {
                    creditVendeurController.text = "";
                    model.informationClient["CREDIT_VENDEUR"] = "";
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                enabled: true,
                controller: creditVendeurController,
                labelField: "CREDIT VENDEUR ",
                isDouble: true,
                onChanged: (val) {}),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 28, right: 18.0, top: 8.0, bottom: 8.0),
            child: Container(
              width: 560,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Durée de remboursement du crédit bancaire (années)",
                      style: TextStyle(
                          fontFamily: "Neometric",
                          color: Color(0xFF57565e),
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Theme(
                    data: new ThemeData(
                        textSelectionTheme: TextSelectionThemeData(
                          selectionColor: Colors.black38,
                        ),
                        canvasColor: Colors.red,
                        primaryColor: Colors.black38,
                        accentColor: Colors.black38,
                        hintColor: Colors.black),
                    child: Container(
                      height: 60,
                      child: DropdownSearch<int>(
                        //mode of dropdown
                        showSearchBox: false,
                        dropdownSearchDecoration: InputDecoration(
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1))),
                        searchBoxDecoration: InputDecoration(
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1))),
                        mode: Mode.MENU,

                        //list of dropdown items
                        // make for in one line of this list [1, 2]

                        items: [7, 10, 15, 20, 25],
                        onChanged: (int item) {
                          try {
                            double capacite = double.parse(model
                                    .informationClient[
                                "capacite_maximal_de_rembouresement_mensuel"]);

                            double mcbd = (capacite * item * 12);

                            if (mcbd >
                                double.parse(model.informationClient[
                                    "valeur_du_bien_estimee_par_le_client"])) {
                              montantCreditBancaireDemandecontroller.text =
                                  model.informationClient[
                                      "valeur_du_bien_estimee_par_le_client"];
                            } else {
                              montantCreditBancaireDemandecontroller.text =
                                  mcbd.toString();
                            }

                            model.informationClient[
                                    "montant_du_credit_bancaire_demande"] =
                                montantCreditBancaireDemandecontroller.text;

                            creditVendeurController.text = (double.parse(model
                                            .informationClient[
                                        "valeur_du_bien_estimee_par_le_client"]) -
                                    double.parse(model.informationClient[
                                        'montant_du_credit_bancaire_demande']))
                                .toString();

                            String taux = "0";

                            if (item == 7)
                              taux = "3.57";
                            else if (item == 10)
                              taux = "3.58";
                            else if (item == 15)
                              taux = "3.80";
                            else if (item == 20)
                              taux = "3.87";
                            else if (item == 25) taux = "4.01";

                            model.informationClient["Taux_interet_Moyen_en_%"] =
                                taux;

                            tauxDinteretMoyencontrolle.text = taux;
                          } catch (e) {
                            print("Error: $e");
                          }
                          model.informationClient["duree_de_remboursement"] =
                              item.toString();
                        },
                        //show selected item
                        selectedItem: int.parse(model
                                .informationClient["duree_de_remboursement"]) ??
                            20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                controller: tauxDinteretMoyencontrolle,
                width: widthTextField,
                labelField: "Taux d’intérêt du crédit-immobilier en %",
                isDouble: true,
                enabled: false,
                onChanged: (val) {
                  model.informationClient["Taux_interet_Moyen_en_%"] = val;
                  model.informationClient["Interet_du_credit"] = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                controller: taux_de_lassurance_emprunteur_assure_1_quotite,
                width: widthTextField,
                validator: model.validatorTextFieldisDoubleQutotie,
                labelField:
                    "Taux de l’assurance emprunteur assuré 1 (quotité 100%)",
                isDouble: true,
                onChanged: (val) {
                  model.informationClient[
                      "taux_de_lassurance_emprunteur_assure_1_quotite"] = val;
                  model.informationClient[
                      "taux_de_lassurance_emprunteur_assure_1_quotite"] = val;
                }),
          ),
          Visibility(
            visible: model.informationClient['isSecondeUserChecked'],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldHelper2(
                  controller: taux_de_lassurance_emprunteur_assure_2_quotite,
                  width: widthTextField,
                  validator: model.informationClient['isSecondeUserChecked']
                      ? model.validatorTextFieldisDoubleQutotie
                      : (str) {
                          return null;
                        },
                  labelField:
                      "Taux de l’assurance emprunteur assuré 2 (quotité 100%)",
                  isDouble: true,
                  onChanged: (val) {
                    model.informationClient[
                        "taux_de_lassurance_emprunteur_assure_2_quotite"] = val;
                    model.informationClient[
                        "taux_de_lassurance_emprunteur_assure_2_quotite"] = val;
                  }),
            ),
          ),
          Container(
              width: widthTextField,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '*Le montant du crédit bancaire demandé peut-être égal au maximum à la valeur du bien immobilier. Il peut aussi être inférieur à la valeur du bien immobilier, le différentiel entre le prix de vente et le montant du crédit bancaire demandé si il est inférieur sera remboursé IN FINE par la société au(x) propriétaire(s) lorsque celle-ci aura fini de rembourser le crédit-bancaire.  ',
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
