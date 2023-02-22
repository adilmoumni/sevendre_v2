import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';
import 'package:plan_de_financement/backend/backend.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormRevenuEtChargesClient extends StatefulWidget {
  String uidClient = "";
  Map<String, Object> modification = {};
  bool modifier = false;
  FormRevenuEtChargesClient(
      {Key key, this.uidClient, this.modification, this.modifier})
      : super(key: key);

  @override
  _FormFormRevenuEtChargesClientState createState() =>
      _FormFormRevenuEtChargesClientState();
}

class _FormFormRevenuEtChargesClientState
    extends State<FormRevenuEtChargesClient> {
  double widthTextField = 600;

  TextEditingController codePostalController = TextEditingController();
  TextEditingController typeDeBiENController = TextEditingController();
  TextEditingController valeurDuBienEstimeParClientController =
      TextEditingController();

  TextEditingController loyerAnnuleController = TextEditingController();

  TextEditingController anneeDeConstructionController = TextEditingController();

  TextEditingController fraisDeNotaireEstimeController =
      TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController loyerMensuelPondereAttendueController =
      TextEditingController();
  TextEditingController assurenceController = TextEditingController();

  TextEditingController taxeFonciereController = TextEditingController();
  TextEditingController chargeDeCropoEntretienController =
      TextEditingController();
  TextEditingController annesController = TextEditingController();
  TextEditingController motantController = TextEditingController();

  var list = new List<int>.generate(25, (i) => i + 1);
  List<int> listSelcted = new List<int>.generate(25, (i) => i + 0);

  String anneesPardefaut = "";
  getIdDossier() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String idDossier = prefs.getString('idDossier');
    return idDossier;
  }

  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);
    if (widget.modifier == true) {
      model.informationClient = widget.modification;

      model.informationClient = widget.modification;

      model.lisGrosseReparation = widget.modification["reparation"];
    }

    model.informationClient["type_de_bien"] =
        ["Appartement en copropriété", "Maison individuelle", "Terrain"].first;
    codePostalController.text = model.informationClient["code_postal"];
    valeurDuBienEstimeParClientController.text =
        model.informationClient["valeur_du_bien_estimee_par_le_client"];

    loyerAnnuleController.text = model.informationClient['loyer_annule_infor'];

    anneeDeConstructionController.text =
        model.informationClient['Année de construction'];

    fraisDeNotaireEstimeController.text =
        model.informationClient["frais_de_notaire_estime"];

    assurenceController.text = model.informationClient["assurence"];
    taxeFonciereController.text = model.informationClient["taxe_fonciere"];
    chargeDeCropoEntretienController.text =
        model.informationClient["charge_De_Cropo_Entretien"];

    motantController.addListener(() => _printLatestValue1(model));

    try {
      if (!widget.modifier) {
        model.getVariableFromBack();
      }
    } catch (e) {
      model.getVariableFromBack();
    }

    getUserByUID(model.informationClient['uidClient']);

    super.initState();
  }

  bool isSecondSelected = false;

  getUserByUID(String uid) async {

    DocumentSnapshot docSnap = await FirebaseFirestore.instance.collection("clients").doc(uid).get();


    if ((docSnap['email2'].toString().isNotEmpty)) {
      setState(() {
        isSecondSelected = true;
      });

      return true;
    }

    setState(() {
      isSecondSelected = false;
    });

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);


    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 28, right: 28.0, top: 8.0, bottom: 8.0),
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
                          "Type de Bien",
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
                          child: DropdownSearch<String>(
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
                                    borderRadius:
                                        new BorderRadius.circular(8.7),
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
                                    borderRadius:
                                        new BorderRadius.circular(8.7),
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

                            showSelectedItem: true,
                            //list of dropdown items
                            items: [
                              "Appartement en copropriété",
                              "Maison individuelle",
                              "Terrain"
                            ],
                            // label: "",
                            onChanged: (String item) =>
                                model.informationClient["type_de_bien"] = item,
                            //show selected item
                            selectedItem: "Appartement en copropriété",
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
                    controller: codePostalController,
                    width: widthTextField,
                    labelText: "Code postal du bien",
                    labelField: "Code postal du bien",
                    validator: model.validatorTextFieldString,
                    onChanged: (val) {
                      model.informationClient["code_postal"] = val;
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    controller: valeurDuBienEstimeParClientController,
                    width: widthTextField,
                    labelText: "Valeur du bien estimée par le propriétaire*",
                    labelField: "Valeur du bien estimée par le propriétaire*",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient[
                          "valeur_du_bien_estimee_par_le_client"] = val;

                      model.informationClient["loyer_annule_infor"] =
                          (double.parse(val) * 0.05).round().toString();
                      loyerAnnuleController.text =
                          (double.parse(val) * 0.05).round().toString();

                      var fraisDeNotaire = (double.parse(val) *
                              double.parse(model
                                  .informationClient['tauxFraisDeNotaire']) /
                              100)
                          .round()
                          .toString();
                      fraisDeNotaireEstimeController.text = fraisDeNotaire;

                      model.informationClient["frais_de_notaire_estime"] =
                          fraisDeNotaire;

                      model.informationClient["frais_de_notaire"] =
                          fraisDeNotaire;
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    controller: loyerAnnuleController,
                    width: widthTextField,
                    labelText: "Loyer annuel estimé",
                    labelField: "Loyer annuel estimé",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["loyer_annule_infor"] = val;
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    controller: anneeDeConstructionController,
                    width: widthTextField,
                    labelText: "Année de construction",
                    labelField: "Année de construction",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["Année de construction"] = val;
                    }),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 8,
              //   ),
              //   child: Text(
              //     "Résidence principale",
              //     style: TextStyle(
              //         fontFamily: "Neometric",
              //         color: Color(0xFF57565e),
              //         fontSize: 15,
              //         fontWeight: FontWeight.w200),
              //   ),
              // ),
              Container(
                width: widthTextField,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28,
                      ),
                      child: Text(
                        "Résidence principale ",
                        style: TextStyle(
                            fontFamily: "Neometric",
                            color: Color(0xFF57565e),
                            fontSize: 15,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: model.informationClient[
                                      "residence_principale"],
                                  onChanged: (newValue) => setState(() =>
                                      model.informationClient[
                                          "residence_principale"] = newValue),
                                  activeColor: Color(0xFF06464b),
                                ),
                                Text('Oui'),
                              ]),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: model
                                    .informationClient["residence_principale"],
                                onChanged: (newValue) => setState(() =>
                                    model.informationClient[
                                        "residence_principale"] = newValue),
                                activeColor: Color(0xFF06464b),
                              ),
                              Text('Non'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: widthTextField,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFieldHelper2(
                            controller: fraisDeNotaireEstimeController,
                            width: widthTextField - 40,
                            labelText: "Frais de notaire estimés",
                            labelField: "Frais de notaire estimés",
                            validator: model.validatorTextFieldisDouble,
                            isDouble: true,
                            onChanged: (val) {
                              model.informationClient[
                                  "frais_de_notaire_estime"] = val;

                              model.informationClient["frais_de_notaire"] = val;
                            }),
                      ),
                      IconButton(
                          onPressed: () {
                            html.window.open(
                                'https://www.immobilier.notaires.fr/fr/frais-de-notaire',
                                "_blank");
                          },
                          icon: Icon(Icons.open_in_new, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    width: widthTextField,
                    controller: assurenceController,
                    labelField:
                        "Montant annuel de l’assurance multi-risques habitation",
                    helperText:
                        "Montant annuel de l’assurance multi-risques habitation",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["assurence"] = val;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    width: widthTextField,
                    controller: taxeFonciereController,
                    labelField: "Montant annuel de la dernière taxe foncière",
                    helperText: "Montant annuel de la dernière taxe foncière",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["taxe_fonciere"] = val;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldHelper2(
                    width: widthTextField,
                    controller: chargeDeCropoEntretienController,
                    labelField:
                        "Charges annuelles de copropriété ou d’entretien",
                    helperText:
                        "Charges annuelles de copropriété ou d’entretien",
                    validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["charge_De_Cropo_Entretien"] =
                          val;
                    }),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Grosses réparations prévisibles**",
                          style: TextStyle(
                              fontFamily: "Neometric",
                              color: Color(0xFF57565e),
                              fontSize: 15,
                              fontWeight: FontWeight.w200),
                        ),
                        Container(
                            color: Color(0xFF06464b), width: 300, height: 3),
                        SizedBox(height: 22)
                      ],
                    ),
                    for (var i = 0; i < model.grossRepartoin; i++)
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 13.0, right: 13),
                            child: Container(
                              width: widthTextField / 2.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8,
                                    ),
                                    child: Text(
                                      "Années",
                                      style: TextStyle(
                                          fontFamily: "Neometric",
                                          color: Color(0xFF57565e),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  Theme(
                                    data: new ThemeData(
                                        textSelectionTheme:
                                            TextSelectionThemeData(
                                          selectionColor: Colors.black38,
                                        ),
                                        canvasColor: Colors.red,
                                        primaryColor: Colors.black38,
                                        accentColor: Colors.black38,
                                        hintColor: Colors.black),
                                    child: Container(
                                      height: 60,
                                      alignment: Alignment.center,
                                      child: DropdownSearch<int>(
                                        //mode of dropdown
                                        // maxHeight :60,
                                        showSearchBox: false,
                                        dropdownSearchDecoration:
                                            InputDecoration(
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                .circular(8.7),
                                                        borderSide:
                                                            new BorderSide(
                                                          width: 1.0,
                                                        )),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFe0d4e4))),
                                                // hintText: "widget.hintText",
                                                helperText: "",
                                                // labelText: "widget.hintText",
                                                // prefixIcon: "widget.prefixIcon",
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 5),

                                                //  Icon(
                                                //   Icons.email,
                                                //   color: Color(0xFFa694ac),
                                                // ),
                                                errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFe0d4e4))),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Color(0xFFe0d4e4))),
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
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: new BorderRadius
                                                    .circular(8.7),
                                                borderSide: new BorderSide(
                                                  width: 1.0,
                                                )),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                borderSide: BorderSide(
                                                    color: Color(0xFFe0d4e4))),
                                            // hintText: "widget.hintText",
                                            helperText: "",
                                            // labelText: "widget.hintText",
                                            // prefixIcon: "widget.prefixIcon",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),

                                            //  Icon(
                                            //   Icons.email,
                                            //   color: Color(0xFFa694ac),
                                            // ),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFe0d4e4))),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFe0d4e4))),
                                            labelStyle: TextStyle(
                                                color:
                                                    // myFocusNode.hasFocus
                                                    //     ? Color(0xFFe0d4e4)
                                                    //     :
                                                    Color.fromRGBO(
                                                        153, 153, 153, 1))),
                                        mode: Mode.MENU,

                                        // showSelectedItem: true,
                                        //list of dropdown items
                                        items: list,
                                        // label: "",
                                        onChanged: (int item) {
                                          setState(() {
                                            if (i != i) {
                                              list = list
                                                  .where((element) =>
                                                      element != item)
                                                  .toList();
                                            }
                                          });

                                          model.lisGrosseReparation[i]
                                              ["annees"] = item.toString();
                                          // grosseReparation["montant"] = val;
                                          // model.lisGrosseReparation[i] =
                                          //     model.grosseReparation;
                                        },
                                        //
                                        //show selected item
                                        selectedItem:
                                            model.lisGrosseReparation[i]
                                                            ["annees"] ==
                                                        '' ||
                                                    model.lisGrosseReparation[i]
                                                            ["annees"] ==
                                                        null
                                                ? list.first
                                                : int.parse(
                                                    model.lisGrosseReparation[i]
                                                        ["annees"]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextFieldHelper2(
                            width: widthTextField / 2.09,
                            labelField: "Montant",
                            helperText: "Montant",
                            // validator: model.validatorTextFieldisDouble,
                            controller: TextEditingController(
                                text: model.lisGrosseReparation[i]["montant"] ??
                                    ""),
                            isDouble: true,
                            onChanged: (val) {
                              if (model.lisGrosseReparation[i]["annees"] ==
                                  "") {
                                model.lisGrosseReparation[i]["annees"] = "1";
                              }
                              model.lisGrosseReparation[i]["montant"] = val;
                            },
                          ),
                          Visibility(
                            visible: model.grossRepartoin > 1,
                            child: IconButton(
                                onPressed: () {
                                  model.lisGrosseReparation.removeAt(i);

                                  setState(() {
                                    model.grossRepartoin--;
                                  });
                                },
                                icon: Icon(Icons.delete_rounded)),
                          )
                        ],
                      ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          model.grossRepartoin++;
                          model.lisGrosseReparation
                              .add({"annees": "", "montant": ""});
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Ajouter une Réparation'),
                            SizedBox(width: 10),
                            Icon(Icons.add_rounded)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Visibility(
                visible: false,
                child: Container(
                  width: widthTextField,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 28,
                        ),
                        child: Text(
                          "* L’estimation de votre bien immobilier sera réévaluée par des professionnels, elle peut être déterminée à titre provisoire via l’application disponible sur le site www.meilleursagents.com leader de l’estimation immobilière en ligne.",
                          style: TextStyle(
                              fontFamily: "Neometric",
                              color: Color(0xFF57565e),
                              fontSize: 15,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 28,
                        ),
                        child: Text(
                          "** Ravalement de façade, remise aux normes énergétiques, climatisation, plomberie etc ",
                          style: TextStyle(
                              fontFamily: "Neometric",
                              color: Color(0xFF57565e),
                              fontSize: 15,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                  width: widthTextField,
                  child: Column(
                    children: [
                      Text(
                        '* Veuillez renseigner à titre provisoire la valeur de votre bien telle qu’elle vous apparaît la mieux correspondre à sa valeur de marché en cas de vente à un tiers dans l’attente de l’évaluation qui sera faite par un expert immobilier. Vous pouvez solliciter à cet effet une évaluation approximative par un agent immobilier à proximité. ',
                        style: TextStyle(fontSize: 12),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '\n** Veuillez renseigner les grosses réparations vous apparaissant prévisibles pendant la durée du crédit immobilier devant être sollicité : ravalement de façade, remise en état de la toiture, remplacement du chauffage, mise aux normes de performance énergétique, etc...',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                child: Text("Information relative au projet",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF045258),
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                width: widthTextField,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 28,
                      ),
                      child: Text(
                        "Vente à soi-même suivi d’une location à soi-même*",
                        style: TextStyle(
                            fontFamily: "Neometric",
                            color: Color(0xFF57565e),
                            fontSize: 15,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: model.informationClient[
                                      "vente_a_soi_meme_suivie_dune_location"],
                                  onChanged: (newValue) {
                                    setState(() {
                                       model.informationClient[
                                            "vente_a_soi_meme_suivie_dune_location"] =
                                        newValue;
                                    });
                                  },
                                  activeColor: Color(0xFF06464b),
                                ),
                                Text('Oui'),
                              ]),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: model.informationClient[
                                    "vente_a_soi_meme_suivie_dune_location"],
                                onChanged: (newValue) => setState(() => model
                                            .informationClient[
                                        "vente_a_soi_meme_suivie_dune_location"] =
                                    newValue),
                                activeColor: Color(0xFF06464b),
                              ),
                              Text('Non'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                  width: widthTextField,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '\n* Veuillez renseigner l’option que vous envisagez dans le prolongement de votre vente à soi-même, entre une location à vous-même du bien pour en conserver la jouissance moyennant le paiement d’un loyer par vous-même, ou la location à un tiers (longue durée, saisonnière ou touristique) ne donnant pas lieu au paiement d’un loyer par vous-même.',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }

  _printLatestValue1(ProviderSM model) {
  }
}
