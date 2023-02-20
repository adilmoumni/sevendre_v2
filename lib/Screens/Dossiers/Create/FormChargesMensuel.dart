
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';

// import 'mobile.dart' if (dart.library.html) 'web.dart';

class FormChargesMensuel extends StatefulWidget {
  String uidClient = '';

  FormChargesMensuel({Key key, this.uidClient}) : super(key: key);

  @override
  _FormChargesMensuelState createState() => _FormChargesMensuelState();
}

class _FormChargesMensuelState extends State<FormChargesMensuel> {
  double widthTextField = 600;
  double widthTextField2 = 200;


  TextEditingController liquiditesDegageesController = TextEditingController();
  TextEditingController remboursementInFineDuCompteCourantController =
      TextEditingController();

      TextEditingController RemboursementMensuelDuCredi =
      TextEditingController();
  TextEditingController remboursementMeensuelDuCreditController =
      TextEditingController();
  TextEditingController appelMensuelEnCompteCourantController =
      TextEditingController();
  TextEditingController
      dureeDuRemboursementInFinDuCompteCourantEnAnneController =
      TextEditingController();

  TextEditingController interetDuCreditController = TextEditingController();
  TextEditingController fraisDeNotaireController = TextEditingController();
  TextEditingController impotSurLesSocietesController = TextEditingController();
  TextEditingController honoraireSeVendreaASoimemeController =
      TextEditingController();
  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);
    if(model.informationClient["reparation"] != [])
    {
      model.calculeRemboursementInfinCompteCourant(
          model.mensualiteDucredit_calculer());
    }

   
  RemboursementMensuelDuCredi.text = model.informationClient['remboursement_mensuel_du_credit'];
//---------------------------------Controller---------------------

    liquiditesDegageesController.text =
        model.informationClient['liquidites_degagees'];

//----------------------mensualiteDucredit----------------------

    remboursementInFineDuCompteCourantController.text =
        model.informationClient["remboursement_in_fine_du_compte_courant"];
    remboursementMeensuelDuCreditController.text =
        model.mensualiteDucredit_calculer().round().toString();
    model.informationClient["remboursement_mensuel_du_credit"] =
        model.mensualiteDucredit_calculer().round().toString();

    appelMensuelEnCompteCourantController.text =
        model.informationClient["Appel_de_tresorerie_de_la_SCI"].toString();
    dureeDuRemboursementInFinDuCompteCourantEnAnneController.text =
        model.informationClient[
            "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"];
    interetDuCreditController.text =
        model.informationClient["interet_demprins_cumul"];
    fraisDeNotaireController.text =
        model.informationClient["frais_de_notaire_estime"];
    impotSurLesSocietesController.text =
        model.informationClient["impot_sur_les_societes"];

    model.informationClient["Honoraire_se_vendre_a_asoi-meme"] = (double.parse(
                model.informationClient[
                    "valeur_du_bien_estimee_par_le_client"]) *
            0.06).round()
        .toString();
    honoraireSeVendreaASoimemeController.text =
    model.informationClient["Honoraire_se_vendre_a_asoi-meme"];
    liquiditesDegageesController.text =
        model.informationClient['liquidites_degagees'];


    interetDuCreditController.addListener(() => _printLatestValue1(model));
    fraisDeNotaireController.addListener(() => _printLatestValue3(model));
    remboursementMeensuelDuCreditController
        .addListener(() => _printLatestValue4(model));
//----------------------------------------------------------------

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);
  var checkWidth  = (MediaQuery.of(context).size.width <= 450);

    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Liquidités dégagées au jour de la vente",
                helperText: "Liquidités dégagées au jour de la vente",
                // validator: model.validatorTextFieldisDouble,
                isDouble: true,
                enabled: true,
                controller: liquiditesDegageesController,
                onChanged: (val) {
                  model.informationClient["liquidites_degagees"] = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField:
                    "Remboursement in fine du compte courant d'associés",
                helperText:
                    "Remboursement in fine du compte courant d'associés",
                // validator: model.validatorTextFieldisDouble,
                enabled: true,
                controller: remboursementInFineDuCompteCourantController,
                isDouble: true,
                onChanged: (val) {
                  model.informationClient[
                      "remboursement_in_fine_du_compte_courant"] = val;
                }),
          ),
         Container(
              height: 2, width: widthTextField / 2, color: Colors.grey[400]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Charges mensuelles",
                style: TextStyle(
                    color: Color(0xFF06464b),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
              height: 2, width: widthTextField / 2, color: Colors.grey[400]),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
                width: widthTextField,
                labelField: "Remboursement mensuel du crédit",
                helperText: "Remboursement mensuel du crédit",
                enabled: true,
                // validator: model.validatorTextFieldisDouble,
                isDouble: true,
                controller: RemboursementMensuelDuCredi,
                onChanged: (val) {
                  model.informationClient["remboursement_mensuel_du_credit"] =
                      val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField: "Appel mensuel au compte courant",
              helperText: "Appel mensuel au compte courant",
              // validator: model.validatorTextFieldisDouble,
              enabled: true,
              controller: appelMensuelEnCompteCourantController,
              onChanged: (val) {
                model.informationClient["Appel_de_tresorerie_de_la_SCI"] =
                    val;
              },
              isDouble: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldHelper2(
              width: widthTextField,
              labelField:
                  "Durée du remboursement IN FINE du compte courant (en année)",
              helperText:
                  "Durée du remboursement IN FINE du compte courant (en année)",
              // validator: model.validatorTextFieldisDouble,
              controller:
                  dureeDuRemboursementInFinDuCompteCourantEnAnneController,
              enabled: true,
              onChanged: (val) {
                model.informationClient[
                        "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"] =
                    val;
              },
            ),
          ),
          Container(
              height: 2, width: widthTextField / 2, color: Colors.grey[400]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Récapitulatif des frais",
                style: TextStyle(
                    color: Color(0xFF06464b),
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
              height: 2, width: widthTextField / 2, color: Colors.grey[400]),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    width:checkWidth
                    
                    ? widthTextField
                    :widthTextField2,
                    labelField: "Intérêt du crédit\n ",
                    helperText: "Intérêt du crédit\n ",
                    // validator: model.validatorTextFieldisDouble,
                    isDouble: true,
                    enabled: true,
                    controller: interetDuCreditController,
                    onChanged: (val) {
                      model.informationClient["Interet_du_credit"] = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    width: checkWidth
                    
                    ? widthTextField
                    :widthTextField2,
                    labelField: "Frais notaire\n ",
                    helperText: "Frais notaire",
                    enabled: true,
                    // validator: model.validatorTextFieldisDouble,
                    controller: fraisDeNotaireController,
                    isDouble: true,
                    onChanged: (val) {
                      model.informationClient["frais_de_notaire"] = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    width: checkWidth
                    
                    ? widthTextField
                    :widthTextField2,
                    labelField: "Impôts sur les sociétés",
                    helperText: "Impôts sur les sociétés",
                    controller: impotSurLesSocietesController,
                    enabled: true,
                    onChanged: (val) {
                      model.informationClient["impot_sur_les_societes"] = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    width: checkWidth
                    
                    ? widthTextField
                    :widthTextField2,
                    labelField: "Honoraire se vendre à soi-même",
                    helperText: "Honoraire se vendre à soi-même",
                    controller: honoraireSeVendreaASoimemeController,
                    enabled: true,
                    onChanged: (val) {
                      model.informationClient[
                          "Honoraire_se_vendre_a_asoi-meme"] = val;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _printLatestValue1(ProviderSM model) {
    model.informationClient["Interet_du_credit"] =
        interetDuCreditController.text;
  }

  _printLatestValue3(ProviderSM model) {
    model.informationClient["frais_de_notaire_estime"] =
        fraisDeNotaireController.text;
  }

  _printLatestValue4(ProviderSM model) {
    model.informationClient["remboursement_mensuel_du_credit"] =
        remboursementMeensuelDuCreditController.text;
  }
}
