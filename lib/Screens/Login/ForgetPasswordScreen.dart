import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plan_de_financement/Controller/LoginController.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController _emailTextController = TextEditingController();
  bool visibleButton = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: !(MediaQuery.of(context).size.width <= 1024),
            child: Container(
              width: MediaQuery.of(context).size.width * .6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("assets/images/pexels-ricardo-esquivel-1662159.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width > 1024
                ? MediaQuery.of(context).size.width * .4
                : MediaQuery.of(context).size.width,
            child: Container(
              constraints: MediaQuery.of(context).size.width > 1440
                  ? BoxConstraints(maxWidth: 600)
                  : BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "../assets/images/Logo_Sevendre.svg",
                      height: 50,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150.0),
                    child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 30.0, top: 15),
                            child: Container(
                              child: Text(
                                'Entrer votre mot de passe',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF3a6259),
                                ),
                              ) /* add child content here */,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Email obligatoire"),
                                  EmailValidator(
                                      errorText:
                                          "Email non valid exemple : jack@gmail.com")
                                ]),
                                controller: _emailTextController,
                                cursorColor: Color.fromRGBO(153, 153, 153, 1),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1))),
                                    hintText: "Email",
                                    helperText: "Entrer username/email ",
                                    labelText: "Email",
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1))),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1))),
                                    labelStyle:
                                        TextStyle(color: Color.fromRGBO(153, 153, 153, 1))),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: visibleButton,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () async {
                                  if (formkey.currentState.validate()) {
                                    // ignore: unused_local_variable
                                    User user =
                                        await AuthGoogle.sendPasswordResetEmail(
                                            _emailTextController.text, context);
                                    print(' valdate');

                                    setState(() {
                                      visibleButton = false;
                                    });
                                  } else {
                                    print('not valdate');
                                  }

                                  // }
                                },
                                child: new Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                    color: Color(0xFF3a6259),
                                    // border: new Border.all(color: Colors.white, width: 2.0),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Wrap(
                                      children: [
                                        Text(
                                          'réinitialiser votre mot de passe ',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.ac_unit,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // fct.visibilityPassword();
                              Navigator.pushNamed(context, '/Login');
                            },
                            child: Text("Se connecter ",
                                style: TextStyle(
                                    color: Color.fromRGBO(153, 153, 153, 1))),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
