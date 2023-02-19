import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class FormFinancemenrEnvisage extends StatefulWidget {
  FormFinancemenrEnvisage({Key key}) : super(key: key);

  @override
  _FormFinancemenrEnvisageState createState() =>
      _FormFinancemenrEnvisageState();
}

class _FormFinancemenrEnvisageState extends State<FormFinancemenrEnvisage> {
  double widthTextField = 600;

  @override
  Widget build(BuildContext context) {
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);
    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Valeur du bien actualisée",
              helperText: "Valeur du bien actualisée ",
              // validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldHelper2(
                  width: widthTextField - 40,
                  labelField: "Frais de notaire",
                  helperText: "Frais de notaire ",
                  validator: model.validatorTextFieldisDouble,
                  isDouble: true,
                ),
                IconButton(
                    onPressed: () {
                      html.window
                          .open('https://www.fluttercampus.com', "_blank");
                    },
                    icon: Icon(Icons.open_in_new, color: Colors.black87)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Crédit bancaire sollicité d'emprunt",
              helperText: "Crédit bancaire sollicité d'emprunt",
              // validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Durée de remboursement",
              helperText: "Durée de remboursement",
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Taux d’intérêt en %",
              helperText: "Taux d’intérêt en %",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
        ],
      ),
    );
  }
}
