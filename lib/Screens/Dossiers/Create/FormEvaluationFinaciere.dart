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

      String ageClient1 =
          getPercentParApportAlage(int.parse(model.informationClient['age_du_propriétaire']))
              .toString();

      

      model.informationClient[
          "taux_de_lassurance_emprunteur_assure_1_quotite"] = ageClient1;
      taux_de_lassurance_emprunteur_assure_1_quotite.text = ageClient1;
      if (model.informationClient['isSecondeUserChecked']) {
        setState(() {
          check = true;
        });


        String ageClient2 =
            getPercentParApportAlage(int.parse(model.informationClient['age_du_propriétaire_2']))
                .toString();
        taux_de_lassurance_emprunteur_assure_2_quotite.text = ageClient2;

        model.informationClient[
            "taux_de_lassurance_emprunteur_assure_2_quotite"] = ageClient2;
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

    print('================ this is doc');
    print(docSnap['DateNaissance']);

    return docSnap;

  }


  
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

  TextEditingController taux_de_lassurance_emprunteur_assure_2_quotite =
      TextEditingController(text: ""); 

  @override
  void initState() {

    final model = Provider.of<ProviderSM>(context, listen: false);

      String str = "invalid";
      try {
        double duree = double.parse(model.informationClient["duree_de_remboursement"]);
        double capacite = double.parse(model.informationClient["capacite_maximal_de_rembouresement_mensuel"]);
        montantCreditBancaireDemandecontroller.text = (capacite * duree * 12).toString() ;
        model.informationClient["montant_du_credit_bancaire_demande"] = montantCreditBancaireDemandecontroller.text;
      } catch (e) {
        print("Error: $e");
      }


    // montantCreditBancaireDemandecontroller.text =
    //     model.informationClient["montant_du_credit_bancaire_demande"];
    dureeDeRemboursementcontrolle.text =
        model.informationClient["duree_de_remboursement"];
    tauxDinteretMoyencontrolle.text =
        model.informationClient["Taux_interet_Moyen_en_%"];
        if( model.informationClient["duree_de_remboursement"] == "")
        {
            model.informationClient["duree_de_remboursement"] = "20";
        }
       
    taux_de_lassurance_emprunteur_assure_1_quotite.text = model
        .informationClient["taux_de_lassurance_emprunteur_assure_1_quotite"];

    taux_de_lassurance_emprunteur_assure_2_quotite.text = model
        .informationClient["taux_de_lassurance_emprunteur_assure_2_quotite"];


    getUserCheck(model);
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
                controller: montantCreditBancaireDemandecontroller,
                labelField: "Montant du crédit bancaire demandé*",
                validator: model.validatorTextFieldisDouble,
                isDouble: true,
                // isDouble: true,
                onChanged: (val) {
                  model.informationClient[
                      "montant_du_credit_bancaire_demande"] = val;
                }),
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
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
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
                        // maxHeight :60,
                        showSearchBox: false,
                        dropdownSearchDecoration: InputDecoration(
                            // suffixIcon: checkEmpty == false
                            //     ? null
                            //     : InkWell(
                            //         borderRadius: BorderRadius.circular(20),
                            //         onTap: () {
                            //           // widget.controller.clear();
                            //         },
                            //         child: Icon(Icons.close,
                            //             size: 20.0, color: Colors.black)),
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
                            // hintText: "widget.hintText",
                            helperText: "",
                            // labelText: "widget.hintText",
                            // prefixIcon: "widget.prefixIcon",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),

                            //  Icon(
                            //   Icons.email,
                            //   color: Color(0xFFa694ac),
                            // ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            labelStyle: TextStyle(
                                color:
                                    // myFocusNode.hasFocus
                                    //     ? Color(0xFFe0d4e4)
                                    //     :
                                    Color.fromRGBO(153, 153, 153, 1))),
                        searchBoxDecoration: InputDecoration(
                            // suffixIcon: checkEmpty == false
                            //     ? null
                            //     : InkWell(
                            //         borderRadius: BorderRadius.circular(20),
                            //         onTap: () {
                            //           // widget.controller.clear();
                            //         },
                            //         child: Icon(Icons.close,
                            //             size: 20.0, color: Colors.black)),
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
                            // hintText: "widget.hintText",
                            helperText: "",
                            // labelText: "widget.hintText",
                            // prefixIcon: "widget.prefixIcon",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),

                            //  Icon(
                            //   Icons.email,
                            //   color: Color(0xFFa694ac),
                            // ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFe0d4e4))),
                            labelStyle: TextStyle(
                                color:
                                    // myFocusNode.hasFocus
                                    //     ? Color(0xFFe0d4e4)
                                    //     :
                                    Color.fromRGBO(153, 153, 153, 1))),
                        mode: Mode.MENU,

                        // showSelectedItem: true,
                        //list of dropdown items
                        items: [for (var i = 5; i <= 25; i++) i],
                        // label: "",
                        onChanged: (int item) {
                          model.informationClient["duree_de_remboursement"] =
                              item.toString();
                        },
                        //
                        //show selected item
                        selectedItem:  int.parse(model.informationClient["duree_de_remboursement"]) ?? 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFieldHelper2(
          //       controller: dureeDeRemboursementcontrolle,
          //       validator: model.validatorTextFieldisDouble,
          //       width: widthTextField,
          //       labelField: "Durée de remboursement",
          //       helperText: "Durée de remboursement",
          //       isDouble: true,

          //       // validator: model.validatorTextFieldisDouble,
          //       // isDouble: true,

          //       onChanged: (val) {
          //         model.informationClient["duree_de_remboursement"] = val;
          //       }),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                controller: tauxDinteretMoyencontrolle,
                width: widthTextField,
                // validator: model.validatorTextFieldisDouble,
                labelField: "Taux d’intérêt du crédit-immobilier en %",
                isDouble: true,
                enabled: false,

                // isDouble: true,
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
                labelField:
                    "Taux de l’assurance emprunteur assuré 1 (quotité 100%)",
                isDouble: true,
                enabled: true,

                // isDouble: true,
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
                  labelField:
                      "Taux de l’assurance emprunteur assuré 2 (quotité 100%)",
                  isDouble: true,
                  enabled: true,
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
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('*Le montant du crédit bancaire demandé peut-être égal au maximum à la valeur du bien immobilier. Il peut aussi être inférieur à la valeur du bien immobilier, le différentiel entre le prix de vente et le montant du crédit bancaire demandé si il est inférieur sera remboursé IN FINE par la société au(x) propriétaire(s) lorsque celle-ci aura fini de rembourser le crédit-bancaire.  ',style: TextStyle(
                          fontSize: 12
                        ),textAlign: TextAlign.start,),
                      ),
                

                    ],)

                  )

        ],
      ),
    );
  }
}
