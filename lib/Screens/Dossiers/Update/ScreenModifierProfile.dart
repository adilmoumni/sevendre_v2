import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';

class ScreenModifierDossier extends StatefulWidget {
  const ScreenModifierDossier({Key key}) : super(key: key);

  @override
  _ScreenModifierDossierState createState() => _ScreenModifierDossierState();
}

class _ScreenModifierDossierState extends State<ScreenModifierDossier> {
  
  @override
  Widget build(BuildContext context) {
    double widthTextField = 400;
    // var model = Provider.of<ProviderSM>(context);
    return   Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
        body:Center(
                child: Form(
                  // key: model.formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
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
                        Wrap(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFieldHelper2(
                              
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
                           
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            );
  }
}
