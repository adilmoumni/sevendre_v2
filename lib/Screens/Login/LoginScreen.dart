import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Controller/LoginController.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class LoginScreens extends StatefulWidget {
  // LoginScreens({Key key, required this.title, required String data})
  //     : super(key: key);

  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController _emailTextController =
      TextEditingController(text: "ad@yopmail.com");
  TextEditingController _passwordTextController =
      TextEditingController(text: "azerty123");
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  calcul() {
    var firstValue = 60000 * (0.012 / 12); // valide
    var secondValue = 1 - (1 + (0.012 / 12));
    var exponent = -(12 * 6);

    var power = pow(-0.0001, exponent);

    var mensualite_du_credi =
        (60000 * (0.012 / 12)) / pow((1 - (1 + (0.012 / 12))), -(12 * 6));

  }

  @override
  Widget build(BuildContext context) {
    calcul();
    return ChangeNotifierProvider(
      create: (context) => ProviderSM(),
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: !(MediaQuery.of(context).size.width <= 1024),
                child: Container(
                  width: MediaQuery.of(context).size.width * .6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/pexels-ricardo-esquivel-1662159.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
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
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            child: SvgPicture.asset(
                              "assets/images/Logo_Sevendre.svg",
                              height: 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 100.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 30.0, top: 15),
                                  child: Container(
                                    child: Text(
                                      'Connexion',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 25,
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
                                      cursorColor:
                                          Color.fromRGBO(153, 153, 153, 1),
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
                                                  color:
                                                      Color.fromRGBO(153, 153, 153, 1))),
                                          labelStyle: TextStyle(color: Color.fromRGBO(153, 153, 153, 1))),
                                    )),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 10),
                                    child: TextFormField(
                                      validator: MultiValidator([
                                        RequiredValidator(
                                            errorText: 'Mot de passe requis'),
                                        MinLengthValidator(8,
                                            errorText:
                                                'le mot de passe doit comporter au moins 8 chiffres'),
                                        // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                        //     errorText:
                                        //         'passwords must have at least one special character')
                                      ]),
                                      controller: _passwordTextController,
                                      cursorColor:
                                          Color.fromRGBO(153, 153, 153, 1),
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        suffixIcon: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          onTap: _toggle,
                                          child: Icon(
                                            _obscureText
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            size: 20.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1))),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1))),
                                        hintText: "Mots de passe ",
                                        helperText: "Entrer le Mots de passe  ",
                                        labelText: "Mots de passe",
                                        labelStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1))),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1))),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () async {
                                      if (formkey.currentState.validate()) {
                                        User user = await AuthGoogle
                                            .signInUsingEmailPassword(
                                              
                                                _emailTextController.text,
                                                _passwordTextController.text,
                                                context);
                                      } else {
                                      }

                                      // }
                                    },
                                    child: new Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height: 50.0,
                                      decoration: new BoxDecoration(
                                        color: Color(0xFF3a6259),
                                        // border: new Border.all(color: Colors.white, width: 2.0),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      child: Center(
                                        child: Wrap(
                                          alignment : WrapAlignment.center,
                                          children: [
                                            Text(
                                              'Se connecter',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
                                            ),
                                            Icon(
                                              Icons.login,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Consumer<ProviderSM>(
                                    builder: (context, fct, child) {
                                  return InkWell(
                                    onTap: () {
                                      // fct.visibilityPassword();
                                      Navigator.pushNamed(
                                          context, '/forgetPassword');
                                    },
                                    child: Text("Mots de passe oublié ?",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                153, 153, 153, 1))),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
