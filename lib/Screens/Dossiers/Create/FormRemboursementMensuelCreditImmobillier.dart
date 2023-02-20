import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:provider/provider.dart';

class FormRemboursementMensuelCreditImmobillier extends StatefulWidget {
  FormRemboursementMensuelCreditImmobillier({Key key}) : super(key: key);

  @override
  _FormRemboursementMensuelCreditImmobillierState createState() =>
      _FormRemboursementMensuelCreditImmobillierState();
}

class _FormRemboursementMensuelCreditImmobillierState
    extends State<FormRemboursementMensuelCreditImmobillier> {
  double widthTextField = 600;
  bool test = false;

  @override
  Widget build(BuildContext context) {
    var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);

    return Form(
      key: model.formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              true ? "assets/images/validation.png" : "assets/images/refuser.gif",
              height: 300.0,
              width: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Félicitation votre crédit est possible",
                  style: TextStyle(
                      color: test == false ? Color(0xFF06464b) : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
