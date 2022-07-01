import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';

class FormRecaptulatifDesFrais extends StatefulWidget {
  FormRecaptulatifDesFrais({Key key}) : super(key: key);

  @override
  _FormRecaptulatifDesFraisState createState() =>
      _FormRecaptulatifDesFraisState();
}

class _FormRecaptulatifDesFraisState extends State<FormRecaptulatifDesFrais> {
  double widthTextField = 600;

  @override
  Widget build(BuildContext context) {
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);

    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Liquidités dégagées",
              helperText: "Liquidités dégagées",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Remboursement in fine du compte courant",
              helperText: " Mensualité du crédit",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Impôt sur les socièté",
              helperText: "intérêt du crédit immobilier",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Honoraires SVASM",
              helperText: " Mensualité du crédit",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Impôt",
              helperText: "Impôt",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),


        ],
      ),
    );
  }
}
