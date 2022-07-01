import 'package:find_dropdown/find_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:plan_de_financement/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileClient extends StatefulWidget {
  ProfileClient({Key key}) : super(key: key);

  @override
  _ProfileClientState createState() => _ProfileClientState();
}

class _ProfileClientState extends State<ProfileClient> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController situationFamilliale = TextEditingController();
  TextEditingController situationImmobillier = TextEditingController();
  TextEditingController ancienPassowrd = TextEditingController();
  TextEditingController noveauPassowrd = TextEditingController();
  String authID = "";
  String currentPasswordCheck = "";

  getCurrentPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ancienPassowrd.text = prefs.getString("currentPassword");
    currentPasswordCheck = prefs.getString("currentPassword");
    print(prefs.getString("currentPassword"));
  }

  setCurrentPassword(String newPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("currentPassword", newPassword);
  }

  @override
  void initState() {
    // final model = Provider.of<ProviderSM>(context, listen: false);

    // nomController.text = model.informationClient["name"];
    // prenomController.text = model.informationClient["prenom"];
    // adresseController.text = model.informationClient["AdressePostale"];
    // emailController.text = model.informationClient["email"];
    // telephoneController.text = model.informationClient["telephone"];
    // dateNaissance.text = model.informationClient["DateNaissance"];
    // villeNaissance.text = model.informationClient["villeNaissance"];
    // situationFamilliale.text = model.informationClient["situatioFamiliale"];
    // situationImmobillier.text = model.informationClient["situatioImobilliere"];

    getCurrentPassword();

    authID = FirebaseAuth.instance.currentUser.uid;
    super.initState();
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _changePassword(String currentPassword, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user.email, password: currentPassword);
    final snackBar2 = SnackBar(
      content: Text('Ancien mots de passe n\'est pas correct'),
      action: SnackBarAction(
        label: 'Fermer',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    if (currentPasswordCheck == ancienPassowrd.text) {
      user.updatePassword(newPassword).then((_) {
        setCurrentPassword(newPassword);
        final snackBar = SnackBar(
          content: Text('Mots de pass a était changer avec succès'),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        //Error, show something
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //Success, do something
      }).catchError((error) {
        final snackBar = SnackBar(
          content: Text('$error'),
          action: SnackBarAction(
            label: 'Fermer',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        //Error, show something
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
    }
    // user.reauthenticateWithCredential(cred).then((value) {

    // }).catchError((err) {})
  }

  // here you write the codes to input the data into firestore

  @override
  Widget build(BuildContext context) {
    // var model = Provider.of<ProviderSM>(context);

    double widthTextField = 600;
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);

    return 
    Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(authID)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                nomController.text = snapshot.data["first_name"];
                prenomController.text = snapshot.data["last_name"];
                emailController.text = snapshot.data["email"];
                print(snapshot.data["first_name"]);
              }

              return Center(
                child: Form(
                  // key: model.formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
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
                                    Navigator.pushNamed(context, '/clients');
                                  }),
                            ),
                            SizedBox(),
                          ],
                        ),
                       
                      ],
                  ),
                ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.account_circle_sharp,
                                  size: 100,
                                  color: Color(0xFF045258),
                                )),
                                Text("Modifier votre profil",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF045258),
                                    ))
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    TextFieldHelper2(
                                      labelField: "Nom",
                                      controller: nomController,
                                      width: conditionResponive
                                          ? 300
                                          : widthTextField,
                                      // controller: nomController,
                                      labelText: "Nom",
                                      helperText: "",
                                      // validator: model.validatorTextFieldString,
                                      onChanged: (val) {
                                        // model.informationClient["name"] = val;
                                        // model.informationClientFct("zakria", "zakaria");
                                      },
                                    ),
                                    TextFieldHelper2(
                                      width: conditionResponive
                                          ? 300
                                          : widthTextField,
                                      controller: prenomController,
                                      labelField: "Prénom",
                                      labelText: "Prénom",

                                      // helperText: "Entrer le prénom",
                                      // validator: model.validatorTextFieldString,
                                      onChanged: (val) {
                                        // model.informationClient["prenom"] = val;
                                        // model.informationClientFct("zakria", "zakaria");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFieldHelper2(
                                  controller: emailController,
                                  width: widthTextField,
                                  labelField: "Email",
                                  labelText: "Email",
                                  // onChanged: (val) {
                                  //   model.informationClient["email"] = val;
                                  //   // model.informationClientFct("zakria", "zakaria");
                                  // },
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFieldHelper2(
                                  controller: ancienPassowrd,
                                  width: widthTextField,
                                  labelField: "Ancien mot de passe",
                                  labelText: "Ancien mot de passe",
                                  typePassword: true,
                                  // helperText: "Entrer l'email",
                                  // onChanged: (val) {
                                  //   model.informationClient["situatioImobilliere"] = val;
                                  //   // model.informationClientFct("zakria", "zakaria");
                                  // },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFieldHelper2(
                                  controller: noveauPassowrd,
                                  width: widthTextField,
                                  // validator: model.validatorTextFieldTelephone,
                                  labelField: "nouveau mot de passe",
                                  labelText: "nouveau mot de passe",
                                  isDouble: false,
                                  // onChanged: (val) {
                                  //   model.informationClient["telephone"] = val;
                                  //   // model.informationClientFct("zakria", "zakaria");
                                  // },
                                  // helperText: "Entrer le téléphone",
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ButtonWidgetHelper(
                              width: 200,
                              height: 40,
                              textButton: "Enregistrer ",
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                                size: 15,
                              ),
                              onTap: () {
                                _changePassword(
                                    ancienPassowrd.text, noveauPassowrd.text);
                                // Navigator.pushNamed(context, '/client/add');
                                // Navigator.pushNamed(context, '/folder/1');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));

            
  }
}
