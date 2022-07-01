import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/scheduler.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';

import 'package:provider/provider.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormInformationClient extends StatefulWidget {
  FormInformationClient({
    Key key,
    this.uid,
    this.nomClient,
    this.prenomClient,
    this.phoneClient,
    this.situationFamillialeClient,
    this.situationImmobillierClient,
    this.emailClient,
    this.adresseImmobillierClient,
    this.villeNaissanceClient,
    this.adresseClient,
    this.dateNaissanceClient,
    this.modifier,
    this.telephone,
    this.nomClient2,
    this.prenomClient2,
    this.phoneClient2,
    this.situationFamillialeClient2,
    this.situationImmobillierClient2,
    this.emailClient2,
    this.adresseImmobillierClient2,
    this.villeNaissanceClient2,
    this.adresseClient2,
    this.dateNaissanceClient2,
    this.telephone2,
    this.statut,
  }) : super(key: key);

  String nomClient;
  String uid;
  String prenomClient;
  String situationFamillialeClient;
  String phoneClient;
  String emailClient;
  String adresseClient;
  String situationImmobillierClient;
  String adresseImmobillierClient;
  String dateNaissanceClient;
  String villeNaissanceClient;
  bool modifier;
  String telephone;
  String statut;
  String nomClient2;

  String prenomClient2;
  String situationFamillialeClient2;
  String phoneClient2;
  String emailClient2;
  String adresseClient2;
  String situationImmobillierClient2;
  String adresseImmobillierClient2;
  String dateNaissanceClient2;
  String villeNaissanceClient2;

  String telephone2;

  @override
  _FormInformationClientState createState() => _FormInformationClientState();
}

class _FormInformationClientState extends State<FormInformationClient> {
  Future<String> saveUserCheck() async {
    String uid = "";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("check", false);


    return uid;
  }

  @override
  void initState() {
    saveUserCheck();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderSM(),
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppbarWidget()),
            body: FormClient(
              nomClient: widget.nomClient,
              prenomClient: widget.prenomClient,
              situationFamillialeClient: widget.situationFamillialeClient,
              phoneClient: widget.phoneClient,
              emailClient: widget.emailClient,
              adresseClient: widget.adresseClient,
              situationImmobillierClient: widget.situationImmobillierClient,
              dateNaissanceClient: widget.dateNaissanceClient,
              nomClient2: widget.nomClient2,
              prenomClient2: widget.prenomClient2,
              situationFamillialeClient2: widget.situationFamillialeClient2,
              phoneClient2: widget.phoneClient2,
              emailClient2: widget.emailClient2,
              adresseClient2: widget.adresseClient2,
              situationImmobillierClient2: widget.situationImmobillierClient2,
              dateNaissanceClient2: widget.dateNaissanceClient2,
              modifier: widget.modifier,
              uid: widget.uid,
            )));
  }
}

class FormClient extends StatefulWidget {
  FormClient({
    Key key,
    this.uid,
    this.nomClient,
    this.prenomClient,
    this.phoneClient,
    this.situationFamillialeClient,
    this.situationImmobillierClient,
    this.emailClient,
    this.adresseImmobillierClient,
    this.villeNaissanceClient,
    this.adresseClient,
    this.dateNaissanceClient,
    this.modifier,
    this.telephone,
    this.nomClient2,
    this.prenomClient2,
    this.phoneClient2,
    this.situationFamillialeClient2,
    this.situationImmobillierClient2,
    this.emailClient2,
    this.adresseImmobillierClient2,
    this.villeNaissanceClient2,
    this.adresseClient2,
    this.dateNaissanceClient2,
    this.telephone2,
    this.statut,
  }) : super(key: key);

  String nomClient;
  String uid;
  String prenomClient;
  String situationFamillialeClient;
  String phoneClient;
  String emailClient;
  String adresseClient;
  String situationImmobillierClient;
  String adresseImmobillierClient;
  String dateNaissanceClient;
  String villeNaissanceClient;
  bool modifier;
  String telephone;
  String statut;
  String nomClient2;

  String prenomClient2;
  String situationFamillialeClient2;
  String phoneClient2;
  String emailClient2;
  String adresseClient2;
  String situationImmobillierClient2;
  String adresseImmobillierClient2;
  String dateNaissanceClient2;
  String villeNaissanceClient2;

  String telephone2;

  @override
  _FormClientState createState() => _FormClientState();
}

class _FormClientState extends State<FormClient> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController situationFamilliale = TextEditingController();
  TextEditingController situationImmobillier = TextEditingController();
  TextEditingController villeNaissance = TextEditingController();
  TextEditingController dateNaissance = TextEditingController();

  //-------------------client 2---------------------------------
  TextEditingController nomController2 = TextEditingController();
  TextEditingController prenomController2 = TextEditingController();
  TextEditingController emailController2 = TextEditingController();
  TextEditingController adresseController2 = TextEditingController();
  TextEditingController telephoneController2 = TextEditingController();
  TextEditingController situationFamilliale2 = TextEditingController();
  TextEditingController situationImmobillier2 = TextEditingController();
  TextEditingController villeNaissance2 = TextEditingController();
  TextEditingController dateNaissance2 = TextEditingController();

  double height2 = 10;
  bool schow = false;
  List<String> listSituationFamilliale = [
    "Celibataire",
    "Marie En Separation",
    "Marie En Communaute",
    "Pacse",
    "Divorce",
    "Veuf"
  ];
  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);
    // nomController.text = model.Client2["name"];
    // prenomController.text = model.Client2["prenom"];
    // adresseController.text = model.Client2["AdressePostale"];
    // emailController.text = model.Client2["email"];
    // telephoneController.text = model.Client2["telephone"];
    // dateNaissance.text = model.Client2["DateNaissance"];
    // villeNaissance.text = model.Client2["villeNaissance"];
    // situationFamilliale.text = model.Client2["situatioFamiliale"];
    // situationImmobillier.text = model.Client2["situatioImobilliere"];
    nomController = TextEditingController(text: widget.nomClient);
    prenomController = TextEditingController(text: widget.prenomClient);
    emailController = TextEditingController(text: widget.emailClient);
    adresseController = TextEditingController(text: widget.adresseClient);

    telephoneController = TextEditingController(text: widget.phoneClient);
    situationFamilliale =
        TextEditingController(text: widget.situationFamillialeClient);
    situationImmobillier =
        TextEditingController(text: widget.situationImmobillierClient);
    villeNaissance = TextEditingController(text: widget.villeNaissanceClient);
    dateNaissance = TextEditingController(text: widget.dateNaissanceClient);

    nomController2 = TextEditingController(text: widget.nomClient2);
    prenomController2 = TextEditingController(text: widget.prenomClient2);
    emailController2 = TextEditingController(text: widget.emailClient2);
    adresseController2 = TextEditingController(text: widget.adresseClient2);

    telephoneController2 = TextEditingController(text: widget.phoneClient2);
    situationFamilliale2 =
        TextEditingController(text: widget.situationFamillialeClient2);
    situationImmobillier2 =
        TextEditingController(text: widget.situationImmobillierClient2);
    villeNaissance2 = TextEditingController(text: widget.villeNaissanceClient2);
    dateNaissance2 =
        TextEditingController(
        text: widget.dateNaissanceClient2 == null
            ? ""
            : widget.dateNaissanceClient2.toString());

    model.uidUser().then((value) => model.client1["UIDuser"] = value);

    if (widget.modifier == true) {
      if (widget.nomClient2 != "") {
        setState(() {
          height2 = 610;
          schow = true;
        });
      }

      model.client1["UIDuser"] = widget.uid;
      model.client1["last_name"] = widget.nomClient;
      model.client1["first_name"] = widget.prenomClient;
      model.client1["DateNaissance"] = widget.dateNaissanceClient;
      model.client1["situatioFamiliale"] =
          widget.situationFamillialeClient ?? listSituationFamilliale.first;
      model.client1["email"] = widget.emailClient;
      model.client1["statut"] = widget.statut;
      model.client1["telephone"] = widget.phoneClient;

      model.client1["last_name2"] = widget.nomClient2;
      model.client1["first_name2"] = widget.prenomClient2;
      model.client1["DateNaissance2"] = widget.dateNaissanceClient2;
      model.client1["situatioFamiliale2"] =
          widget.situationFamillialeClient2 ?? listSituationFamilliale.first;
      model.client1["email2"] = widget.emailClient2;

      model.client1["telephone2"] = widget.phoneClient2;
    }

    initTheSecondeUser();
    
    super.initState();
  }

  initTheSecondeUser() async {
            SharedPreferences prefs =
              await SharedPreferences.getInstance();
        prefs.setBool("is_seconde_useer_selected", false);
  }

  
  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    emailController.dispose();
    adresseController.dispose();
    telephoneController.dispose();
    super.dispose();
  }

  bool isSecondUserSelected = false;

  @override
  Widget build(BuildContext context) {
    double widthTextField = 600;
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);
    return Form(
      key: model.formKey,
      child: SingleChildScrollView(
        controller: model.cnt,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                color: Colors.white,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Color(0xFF045258),
                                ),
                                onPressed: () {

                                  var checkwidth  = (MediaQuery.of(context).size.width <= 350) ;
                                  AwesomeDialog(
                                      width: 600,
                                      context: context,
                                      animType: AnimType.LEFTSLIDE,
                                      headerAnimationLoop: false,
                                      dialogType: DialogType.SUCCES,
                                      showCloseIcon: true,
                                      dismissOnBackKeyPress: false,
                                      title: '',
                                      desc:
                                          'si vous retourner au menu les donnés sera perdu',
                                      btnOkOnPress: () {
                                        debugPrint('OnClcik');
                                        // Navigator.pushNamed(context, '/folder/1');
                                      },
                                      buttonsTextStyle :TextStyle(fontSize: 11),
                                      btnOkText: checkwidth 
                                         ?"": "Annuler",
                                      btnCancelText:checkwidth 
                                         ?"": "dashboard",
                                      btnCancelOnPress: () {
                                        Navigator.pushNamed(
                                            context, '/clients');
                                        // Navigator.pushNamed(context, '/TableauDeBoard');
                                      },
                                      btnOkIcon: Icons.save,
                                      btnCancelIcon: Icons.dashboard,
                                      onDissmissCallback: (type) {
                                        debugPrint(
                                            'Dialog Dissmiss from callback $type');
                                      })
                                    ..show();
                                }),
                          ),
                          SizedBox(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                            child: Text(
                                widget.modifier == true
                                    ? "Modifier les informations de client"
                                    : "informations personnelles du client",
                                                                  textAlign : TextAlign.center,

                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFF4a8b88),
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: [
                      TextFieldHelper2(
                        isText: true,
                        labelField: "Nom",
                        width: conditionResponive ? 300 : widthTextField,
                        controller: nomController,
                        labelText: "Nom",
                        helperText: "",
                        validator: model.validatorTextFieldString,
                        onChanged: (val) {
                          model.client1["first_name"] = val;
                          // model.Client1Fct("zakria", "zakaria");
                        },
                      ),
                      TextFieldHelper2(
                        isText: true,
                        width: conditionResponive ? 300 : widthTextField,
                        controller: prenomController,
                        labelField: "Prénom",
                        labelText: "Prénom",
                        // helperText: "Entrer le prénom",
                        validator: model.validatorTextFieldString,
                        onChanged: (val) {
                          model.client1["last_name"] = val;
                          // model.Client1Fct("zakria", "zakaria");
                        },
                      ),
                    ],
                  ),
                ),

                     Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                
                    alignment:  Alignment.center,
                      margin: EdgeInsets.only(left: 12,right: 12),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            "L’âge du client",
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
                          
                                width: widthTextField -40  ,
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
                                      color:
                                          Color.fromRGBO(153, 153, 153, 1))),
                              mode: Mode.MENU,

                              showSelectedItem: true,
                              //list of dropdown items
                              items: [
for (var i = 16; i < 101; i++) i.toString()
                              ],
                              onChanged: (String item) =>

                      model.client1["DateNaissance"] = item,
                              selectedItem: "16",
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
                //     controller: adresseController,
                //     width: widthTextField,
                //     validator: model.validatorTextFieldAdresse,
                //     labelField: "Adresse postale",
                //     labelText: "Adresse postale",
                //     onChanged: (val) {
                //       model.client1["AdressePostale"] = val;
                //       // model.Client1Fct("zakria", "zakaria");
                //     },
                //     // helperText: "Entrer l'Adresse",
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                
                    alignment:  Alignment.center,
                      margin: EdgeInsets.only(left: 12,right: 12),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            "Situation Familiale",
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
                          
                                width: widthTextField -40  ,
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
                                "Celibataire",
                                "Marie En Separation",
                                "Marie En Communaute",
                                "Pacse",
                                "Divorce",
                                "Veuf"
                              ],
                              // label: "",
                              onChanged: (String item) =>
                                  model.client1["situatioFamiliale"] = item,
                              //show selected item
                              selectedItem: "Celibataire",
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
                //     controller: situationImmobillier,
                //     isText: true,
                //     width: widthTextField,
                //     labelField: "Code postal du bien",
                //     labelText: "Code postal du bien",
                //     // helperText: "Entrer l'email",
                //     onChanged: (val) {
                //       model.client1["situatioImobilliere"] = val;
                //       // model.Client1Fct("zakria", "zakaria");
                //     },
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    controller: telephoneController,
                    width: widthTextField,
                    validator: model.validatorTextFieldTelephone,
                    labelField: "Téléphone",
                    // isText: true,
                    labelText: "Téléphone",
                    isDouble: false,
                    onChanged: (val) {
                      model.client1["telephone"] = val;
                      // model.Client1Fct("zakria", "zakaria");
                    },
                    // helperText: "Entrer le téléphone",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    controller: emailController,
                    width: widthTextField,
                    labelField: "Email",
                    labelText: "Email",
                    isText: true,
                    onChanged: (val) {
                      model.client1["email"] = val;
                      // model.Client1Fct("zakria", "zakaria");
                    },
                    // helperText: "Entrer l'email",
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email obligatoire"),
                      EmailValidator(
                          errorText: "Email non valid exemple : jack@gmail.com")
                    ]),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: widthTextField,
                  margin: const EdgeInsets.only(
                      left: 20, top: 8, bottom: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      height2 == 610
                          ? Text("Reduire")
                          : Text("Ajouter un autre associé"),
                      IconButton(
                          icon: height2 == 610
                              ? Icon(
                                  Icons.remove,
                                  color: Color(0xFF06464b),
                                )
                              : Icon(
                                  Icons.add,
                                  color: Color(0xFF06464b),
                                ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                            isSecondUserSelected = !isSecondUserSelected;
                            prefs.setBool("is_seconde_useer_selected", isSecondUserSelected);

                            if(isSecondUserSelected){
                                model.client1['DateNaissance2'] = '16';
                            } else {
                                model.client1['DateNaissance2'] = '0';
                            }


                            if (schow == true) {
                            
                              prefs.setBool("check", false);
                              // model.listClient.removeAt(1);
                            }
                            setState(() {
                              height2 == 610 ? height2 -= 600 : height2 += 600;

                              if (schow == true) {
                                schow = false;
                                // model.listClient.removeAt(1);
                              }
                              // model.listClient.add(model.informationclient1);
                              // Future.delayed(Duration(seconds: 3), () {});
                              // height2 == 120 ?schow =false: height2 += 110;
                            });
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, bottom: 8, right: 8),
                  child: AnimatedContainer(
                      width: MediaQuery.of(context).size.width,
                      height: height2,
                      onEnd: () async {
                        setState(() {
                          schow = true;
                        });

                        SchedulerBinding.instance?.addPostFrameCallback((_) {
                          model.scrollController.animateTo(
                              model.scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        });
                      },
                      // decoration: BoxDecoration(
                      //   color: Colors.red,
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: schow == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Container(
                                        child: Text("Associé 2",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Color(0xFF4a8b88),
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Wrap(
                                      children: [
                                        TextFieldHelper2(
                                          labelField: "Nom",
                                          width: conditionResponive
                                              ? 300
                                              : widthTextField,
                                          controller: nomController2,
                                          labelText: "Nom",
                                          isText: true,
                                          helperText: "",
                                          validator:
                                              model.validatorTextFieldString,
                                          onChanged: (val) async {
                                            model.client1["first_name2"] = val;
                                            // model.Client1Fct(
                                            //     "zakria", "zakaria");
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            prefs.setBool("check", true);
                                          },
                                        ),
                                        TextFieldHelper2(
                                          width: conditionResponive
                                              ? 300
                                              : widthTextField,
                                          controller: prenomController2,
                                          labelField: "Prénom",
                                          isText: true,
                                          labelText: "Prénom",
                                          // helperText: "Entrer le prénom",
                                          validator:
                                              model.validatorTextFieldString,
                                          onChanged: (val) {
                                            model.client1["last_name2"] = val;
                                            // model.Client1Fct("zakria", "zakaria");
                                          },
                                        ),
                                      ],
                                    ),
                                  ),

                     Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                
                    alignment:  Alignment.center,
                      margin: EdgeInsets.only(left: 12,right: 12),
                  
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            "L’âge du client",
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
                          
                                width: widthTextField -40  ,
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
                                      color:
                                          Color.fromRGBO(153, 153, 153, 1))),
                              mode: Mode.MENU,

                              showSelectedItem: true,
                              //list of dropdown items
                              items: [
for (var i = 16; i < 101; i++) i.toString()
                              ],
                              onChanged: (String item) =>
                                        model.client1["DateNaissance2"] = item,

                              selectedItem: "16",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                                  Container(
                                    width: widthTextField,
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      right: 25
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 8,
                                            
                                          ),
                                          child: Text(
                                            "Situation Familiale",
                                            //  isText : true,
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
                                                  width: widthTextField -40  ,
                                            child: DropdownSearch<String>(
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
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius.circular(
                                                                      8.7),
                                                              borderSide:
                                                                  new BorderSide(
                                                                width: 1.0,
                                                              )),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8.0),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFFe0d4e4))),
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
                                                              color: Color(
                                                                  0xFFe0d4e4))),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(0xFFe0d4e4))),
                                                      labelStyle: TextStyle(
                                                          color:
                                                              // myFocusNode.hasFocus
                                                              //     ? Color(0xFFe0d4e4)
                                                              //     :
                                                              Color.fromRGBO(153, 153, 153, 1))),
                                              searchBoxDecoration:
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
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  new BorderRadius.circular(
                                                                      8.7),
                                                              borderSide:
                                                                  new BorderSide(
                                                                width: 1.0,
                                                              )),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8.0),
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xFFe0d4e4))),
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
                                                              color: Color(
                                                                  0xFFe0d4e4))),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Color(0xFFe0d4e4))),
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
                                                "Celibataire",
                                                "Marie En Separation",
                                                "Marie En Communaute",
                                                "Pacse",
                                                "Divorce",
                                                "Veuf"
                                              ],
                                              // label: "",
                                              onChanged: (String item) => model
                                                      .client1[
                                                  "situatioFamiliale2"] = item,
                                              //show selected item
                                              selectedItem: "Celibataire",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFieldHelper2(
                                      controller: telephoneController2,
                                      width: widthTextField,
                                      validator:
                                          model.validatorTextFieldTelephone,
                                      labelField: "Téléphone",
                                      labelText: "Téléphone",

                                      isDouble: false,
                                      onChanged: (val) {
                                        model.client1["telephone2"] = val;
                                        // model.Client1Fct("zakria", "zakaria");
                                      },
                                      // helperText: "Entrer le téléphone",
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFieldHelper2(
                                      controller: emailController2,
                                      width: widthTextField,
                                      labelField: "Email",
                                      labelText: "Email",
                                      isText: true,
                                      onChanged: (val) {
                                        model.client1["email2"] = val;
                                        // model.Client1Fct("zakria", "zakaria");
                                      },
                                      // helperText: "Entrer l'email",
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: "Email obligatoire"),
                                        EmailValidator(
                                            errorText:
                                                "Email non valid exemple : jack@gmail.com")
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidgetHelper(
                    width: 150,
                    height: 40,
                    textButton: widget.modifier == true ? "Modifier" : "Ajouter ",
                    icon: Icon(
                      widget.modifier == true ? Icons.mode_edit : Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                    onTap: () {
                                                        var checkwidth  = (MediaQuery.of(context).size.width <= 350) ;

                      if (model.formKey.currentState.validate()) {
                        widget.modifier == true
                            ? FirebaseFirestore.instance
                                .collection('clients')
                                .doc(widget.uid)
                                .update(model.client1)
                                .then((value) => AwesomeDialog(
                                    width: widthTextField+70,
                                    context: context,
                                    animType: AnimType.LEFTSLIDE,
                                    headerAnimationLoop: false,
                                    dialogType: DialogType.SUCCES,
                                    showCloseIcon: true,
                                    title: 'Succes',
                                    desc: 'Le client à modifier avec succès',
                                    btnOkOnPress: () {
                                      debugPrint('OnClcik');

                                      Navigator.pushNamed(
                                          context, '/TableauDeBoard');
                                    },
                                    btnOkText:checkwidth ? '':  "dashboard",

                                    // btnCancelOnPress: () {
                                    //   Navigator.pushNamed(context, '/TableauDeBoard');
                                    // },
                                    btnOkIcon: Icons.dashboard,
                                    onDissmissCallback: (type) {
                                      debugPrint(
                                          'Dialog Dissmiss from callback $type');
                                    })
                                  ..show())
                            // Navigator.pushNamed(context, '/client/add');
                            // Navigator.pushNamed(context, '/folder/1');*

                            : FirebaseFirestore.instance
                                .collection('clients')
                                .add(model.client1)
                                .then((value) {
                                print('------------------');
                                print(value.id);

                                model.saveUidClient(value.id);
                                print('------------------');

                                AwesomeDialog(
                                    width: widthTextField+70,
                                    context: context,
                                    animType: AnimType.LEFTSLIDE,
                                    headerAnimationLoop: false,
                                    dialogType: DialogType.SUCCES,
                                    showCloseIcon: true,
                                    title: 'Succes',
                                    desc: 'Le client à enregistré avec succès',
                                    btnOkOnPress: () {
                                      debugPrint('OnClcik');

                                      Navigator.pushNamed(context, '/folder/1');
                                    },
                                    btnOkText: "Créer un dossier pour ce client",
                                    btnCancelText: "dashboard",
                                    btnCancelOnPress: () {
                                      Navigator.pushNamed(
                                          context, '/TableauDeBoard');
                                    },
                                    btnOkIcon: Icons.arrow_forward,
                                    btnCancelIcon: Icons.dashboard,
                                    onDissmissCallback: (type) {
                                      debugPrint(
                                          'Dialog Dissmiss from callback $type');
                                    })
                                  ..show();
                              });
                      }
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Wrap(
                  //       children: [
                  //         Text("Voir les dossiers de ce client ",
                  //             style: TextStyle(
                  //               color: Color(0xFF045258),
                  //             )),
                  //         Icon(
                  //           Icons.arrow_forward,
                  //           color: Color(0xFF045258),
                  //           size: 15,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
