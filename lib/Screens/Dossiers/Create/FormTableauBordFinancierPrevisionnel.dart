import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';
import 'package:provider/provider.dart';

class FormTableauBordFinancierPrevisionnel extends StatefulWidget {
  FormTableauBordFinancierPrevisionnel({Key key}) : super(key: key);

  @override
  _FormTableauBordFinancierPrevisionnelState createState() =>
      _FormTableauBordFinancierPrevisionnelState();
}

class _FormTableauBordFinancierPrevisionnelState
    extends State<FormTableauBordFinancierPrevisionnel> {
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
              helperText: "Remboursement in fine du compte courant",
              validator: model.validatorTextFieldisDouble,
              isDouble: true,
            ),
          ),
        ],
      ),
    );
  }
}
