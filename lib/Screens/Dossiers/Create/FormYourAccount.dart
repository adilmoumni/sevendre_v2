import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/Client/Dashboard/FormTableauDeBoardScreen.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:provider/provider.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FormYourAccount extends StatefulWidget {
  const FormYourAccount({Key key}) : super(key: key);

  @override
  _FormYourAccountState createState() => _FormYourAccountState();
}

class _FormYourAccountState extends State<FormYourAccount> {
  double widthTextField = 600;
  List<int> list = [5, 10, 15, 20, 25];

  TextEditingController nomController = TextEditingController(text: "");
  TextEditingController prenomController = TextEditingController(text: "");
  TextEditingController adressDuBienController =
      TextEditingController(text: "");
  TextEditingController villeDuBienController = TextEditingController(text: "");
  TextEditingController adresseEmailController =
      TextEditingController(text: "");
  TextEditingController numeroTelController = TextEditingController(text: "");

  TextEditingController validatinSmsController =
      TextEditingController(text: '');

  bool isWaiting = false;
  

  @override
  void initState() {
    final model = Provider.of<ProviderSM>(context, listen: false);

    nomController.text = model.informationClient['NOM_CREATION'];
    prenomController.text = model.informationClient['PRENOM_CREATION'];
    adressDuBienController.text =
        model.informationClient['ADRESSE_DU_BIEN_CREATION'];
    villeDuBienController.text =
        model.informationClient['VILLE_DU_BIEN_CREATION'];
    adresseEmailController.text =
        model.informationClient['ADRESSE_MAIL_CREATION'];
    numeroTelController.text =
        model.informationClient['NUMERO_DE_TELEPHONE_PORTABLE_CREATION'];

    super.initState();
  }

  bool isSignUp = false;
  bool isSignIn = false;

  bool isNumberPhoneInVerification = false;

  ConfirmationResult confirmationResult;

  @override
  Widget build(BuildContext context) {
    // var conditionResponive = (MediaQuery.of(context).size.width >= 1024);
    var model = Provider.of<ProviderSM>(context);

    return Form(
      key: model.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// forme signup
          Visibility(
            visible: !isNumberPhoneInVerification,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: nomController,
                      labelField: "NOM",
                      validator: model.validatorTextFieldString,
                      isText: true,
                      onChanged: (val) {
                        model.informationClient["NOM_CREATION"] = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: prenomController,
                      labelField: "PRENOM",
                      validator: model.validatorTextFieldString,
                      isText: true,
                      onChanged: (val) {
                        model.informationClient["PRENOM_CREATION"] = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: adressDuBienController,
                      labelField: "ADRESSE DU BIEN",
                      validator: model.validatorTextFieldString,
                      isText: true,
                      onChanged: (val) {
                        model.informationClient["ADRESSE_DU_BIEN_CREATION"] =
                            val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: villeDuBienController,
                      labelField: "VILLE DU BIEN",
                      isText: true,
                      validator: model.validatorTextFieldString,
                      onChanged: (val) {
                        model.informationClient["VILLE_DU_BIEN_CREATION"] = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: adresseEmailController,
                      labelField: "ADRESSE MAIL",
                      isText: true,
                      validator: model.validatorTextFieldString,
                      onChanged: (val) {
                        model.informationClient["ADRESSE_MAIL_CREATION"] = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                      width: widthTextField,
                      controller: numeroTelController,
                      labelField: "TELEPHONE PORTABLE",
                      hintText: '+33611223344',
                      validator: model.validatorTextFieldString,
                      isText: true,
                      onChanged: (val) {
                        model.informationClient[
                            "NUMERO_DE_TELEPHONE_PORTABLE_CREATION"] = val;
                      }),
                ),
              ],
            ),
          ),

          Visibility(
            visible: isNumberPhoneInVerification,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldHelper2(
                    onChanged: (e) {},
                    width: widthTextField,
                    controller: validatinSmsController,
                    labelField: "Vérification sms",
                    validator: model.validatorTextFieldTelephone,
                    isDouble: true,
                  ),
                ),
                Visibility(
                  visible: !isWaiting,
                  child: ButtonWidgetHelper(
                    width: 200,
                    height: 40.0,
                    onTap: () async {
                      try {
                        print('================= this si resend');
                        FirebaseAuth auth = FirebaseAuth.instance;

                        String numberPhone = (model.informationClient[
                            "NUMERO_DE_TELEPHONE_PORTABLE_CREATION"]);

                        confirmationResult =
                            await auth.signInWithPhoneNumber(numberPhone,RecaptchaVerifier(
  container: 'recaptcha',
  size: RecaptchaVerifierSize.compact,
  
  theme: RecaptchaVerifierTheme.dark,
) );


                        setState(() {
                          isWaiting = true;
                        });
                      } catch (e) {
                        print(e);
                        print('err');
                      }
                    },
                    textButton: "   Renvoyer un SMS",
                    icon: Container(),
                  ),
          
                ),
                Visibility(
                  visible: isWaiting,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: CircularCountDownTimer(
                          duration: 10,
                          initialDuration: 0,
                          width: 30,
                          height: 30,
                          ringColor: Colors.grey[300],
                          ringGradient: null,
                          fillColor: Colors.greenAccent[100],
                          fillGradient: null,
                          backgroundColor: Colors.green[500],
                          backgroundGradient: null,
                          strokeWidth: 10.0,
                          strokeCap: StrokeCap.round,
                          textStyle: TextStyle(
                              fontSize: 13.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textFormat: CountdownTextFormat.S,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          autoStart: true,
                          onComplete: () {
                            setState(() => isWaiting = false);
                          },
                        ),
                      ),
                      Text('Renvoyer un code SMS...')
                    ],
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),



          Visibility(
            visible: !isNumberPhoneInVerification,
            child: Container(
                width: widthTextField,
                child: Column(
                  children: [
                    Text(
                      "WWW.SEVENDREASOIMEME.COM déclare respecter les dispositions de la loi Informatique et Libertés du 6 janvier 1978 modifiée par la loi du 6 août 2004 et déclarent respecter tous les textes légaux et réglementaires en vigueur. WWW.SEVENDREASOIMEME.COM s'engage de surcroît à réaliser toutes les formalités administratives et légales qui pourraient leur incomber au cours de la réalisation du présent accord et notamment toute déclaration auprès de la Commission Nationale Informatique et Libertés. ",
                      style: TextStyle(fontSize: 12),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "En tant qu’intermédiaire en opérations bancaires, SEVENDREASOIMEME CREDIT est tenue de collecter des données personnelles relatives à des personnes physiques. En effet, l’intermédiaire doit recueillir auprès du CLIENT, y compris du CLIENT potentiel, des informations relatives à ses ressources et à ses charges ainsi qu’aux prêts en cours qu’il a contractés, permettant à l’établissement de crédit de vérifier sa solvabilité (article R. 519-21 du Code de la consommation). Constituent des données personnelles « toute information relative à une personne physique identifiée ou qui peut être identifiée, directement ou indirectement, par référence à un numéro d’identification ou à un ou plusieurs éléments qui lui sont propres ». WWW.SEVENDREASOIMEME.COM met en œuvre les moyens nécessaires à la protection de la vie privée des internautes, de ses prospects et de ses clients, ainsi que de leurs données à caractère personnel. WWW.SEVENDREASOIMEME.COM collecte et utilise les données personnelles de manière loyale et licite. Les données personnelles sont collectées pour des finalités déterminées, explicites et légitimes et ne sont pas traitées ultérieurement de manière incompatible avec ces finalités. WWW.SEVENDREASOIMEME.COM propose des services reposant sur l’analyse de données personnelles. La communication volontaire de données personnelles permet à WWW.SEVENDREASOIMEME.COM de proposer des contrats adaptés aux besoins des CLIENTs ou prospects et de remplir ses obligations légales. WWW.SEVENDREASOIMEME.COM ne procède à aucun enregistrement des communications téléphoniques.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM s'engage, conformément aux articles 34 et 35 de la loi du 6 janvier 1978 modifiée relative à l'informatique, aux fichiers et aux libertés ainsi qu'aux articles 32 à 35 du règlement général sur la protection des données (RGPD) du 27 avril 2016, à prendre toutes précautions conformes aux usages dans le cadre de ses attributions afin de protéger la confidentialité des informations auxquelles il aura accès, et en particulier d'empêcher qu'elles ne soient communiquées à des personnes non expressément autorisées à recevoir ces informations.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        " WWW.SEVENDREASOIMEME.COM s'engage notamment à : \n  Ne pas utiliser les données auxquelles il peut accéder à des fins autres que celles prévues par ses attributions ; \n  Ne divulguer ces données qu'aux personnes dûment autorisées, en raison de leurs fonctions, à en recevoir communication, qu'il s'agisse de personnes privées, publiques, physiques ou morales ; \n  Ne faire aucune copie de ces données sauf à ce que cela soit nécessaire à l'exécution de ses fonctions ; \n  Prendre toutes les mesures conformes aux usages dans le cadre de ses attributions afin d'éviter l'utilisation détournée ou frauduleuse de ces données ; \n  Prendre toutes précautions conformes aux usages pour préserver la sécurité physique et logique de ces données ;  \n  S'assurer, dans la limite de ses attributions, que seuls des moyens de communication sécurisés seront utilisés pour transférer ces données ; \n  En cas de cessation de ses fonctions, restituer intégralement les données, fichiers informatiques et tout support d'information relatif à ces données.  Cet engagement de confidentialité, en vigueur pendant toute la durée de leur relation, demeurera effectif, sans limitation de durée après la cessation de ses fonctions, quelle qu'en soit la cause, dès lors que cet engagement concerne l'utilisation et la communication de données à caractère personnel.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM pourra être amené à traiter pour le compte de son cocontractant des données à caractère personnel afin de satisfaire aux obligations légales et réglementaires et, pour les traitements et le suivi des prestations à effectuer, la gestion marketing, la relation client et le recouvrement. WWW.SEVENDREASOIMEME.COM pourra traiter à l’intérieur de son groupe incluant les sociétés SEVENDREASOIMEME CREDIT, SEVENDREASOIMEME IMMOBILIER, SEVENDREASOIMEME GESTION et SEVENDREASOIMEME CONSEIL, à l’exclusion de tous autres tiers, les données personnelles de ses cocontractants incluant  ses nom, prénom, téléphone, e-mail, adresse, et autres données liées au CLIENT en relation avec les activités de WWW.SEVENDREASOIMEME.COM, incluant ses données patrimoniales, bancaires et fiscales. Ces données seront traitées exclusivement pour les finalités indiquées ci-dessus, de manière pertinente et proportionnée, et pour une durée maximum de CINQ (5) ans après l’expiration des contrats en cours. Exceptionnellement, les données personnelles peuvent être conservées une fois ces finalités accomplies pendant la durée des finalités annoncées majorée du délai de prescription, afin notamment de traiter une réclamation, de répondre aux besoins d’une action en justice probable ou en cours ou encore sur demande des autorités administratives de supervision. En cas d’incident de paiement, elles pourront être transmises à une société de recouvrement. WWW.SEVENDREASOIMEME.COM ne procède à aucun profilage des données à caractère personnel.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM met en place les mesures appropriées de sécurité, tant techniques que d’organisation afin de protéger les données personnelles de ses cocontractants contre toute destruction accidentelle ou illégale, contre toute perte ou altération et contre toute, intrusion, révélation non autorisée ou tout traitement contraire aux dispositions de la législation relative à la Protection des Données. WWW.SEVENDREASOIMEME.COM se conformera à toutes demandes et instructions raisonnables et appropriées du cocontractant permettant à ce dernier de vérifier la conformité avec la législation sur la Protection des Données. WWW.SEVENDREASOIMEME.COM s’assure que les employés qui traitent les données personnelles en son nom sont tenus par une obligation de confidentialité couvrant l’ensemble des données personnelles traitées dans le cadre de leur relation contractuelle. L’obligation de confidentialité persiste même à l’issue de leur relation contractuelle. Les données personnelles sont couvertes par le secret professionnel. Les professionnels ayant accès aux données personnelles reçoivent des formations relativement au cadre juridique de leur utilisation.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM peut sous-traiter son activité et, par conséquent, les opérations de traitement de données qui en découlent à un tiers. Dans ce cas, le contrat conclu avec le sous-traitant devra expressément prévoir les mêmes obligations au sous-traitant que celles pesant sur WWW.SEVENDREASOIMEME.COM",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM notifie sans délai à ses cocontractants tout cas de violation avérée ou potentielle de données à caractère personnel traitées en application du contrat.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM s’engage à retourner tous documents et supports contenant des données personnelles ou, sur demande de ses cocontractants à effacer les données personnelles.",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "WWW.SEVENDREASOIMEME.COM respecte les droits des personnes en ce que ses cocontractants peuvent à tout moment retirer son consentement gratuitement et sans justification, exercer son droit d’accès, de rectification et d’effacement des données le concernant ou obtenir des informations supplémentaires sur les données personnelles conservées et traitées par WWW.SEVENDREASOIMEME.COM en contactant le Responsable des Données Personnelles « Data Protection Officer (DPO) » à l’adresse : 66 avenue des Champs-Elysées Bureau 46 (75008) PARIS. Modalités d’exercice des droits : envoyer votre demande par courrier RAR avec copie d’une pièce d’identité valide. ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "La réclamation est traitée dans les délais suivants : envoi d’un accusé de réception dans un délai de 10 jours ouvrables suivi d’un envoi d’une réponse circonstanciée avant échéance d’un délai de deux mois suivant la réception des pièces justificatives nécessaires. En cas de circonstance particulière empêchant le bon traitement de la réclamation dans les délais mentionnés, WWW.SEVENDREASOIMEME.COM s’engage à tenir le CLIENT informé. Le titulaire des droits peut saisir la CNIL (cnil.fr) si la réponse donnée ne lui est pas satisfaisante. ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Tout CLIENT de WWW.SEVENDREASOIMEME.COM et visiteur de dispose de droits quant à ses données personnelles : d’accès, de rectification, d’opposition et de suppression des données nominatives personnelles les concernant (article 34 de la Loi n° 78-17 du 6 janvier 1978 relative à l’informatique, aux fichiers et aux libertés, modifiée par la Loi 2018-493 du 20 juin 2018). En particulier, l’utilisateur du site, de même que chaque CLIENT, dispose du droit de s’opposer sans frais à l’utilisation de ses données personnelles à des fins de prospection. Les principaux droits que chaque personne peut exercer relativement à ses données personnelles sont les suivants : * Droit d’opposition : toute personne peut demander que ses données personnelles ne soient plus utilisées par un traitement informatique ; * Droit d’accès et de rectification : toute personne peut accéder à ses données personnelles et demander la rectification de certaines informations. Les données collectées dans le cadre d’un traitement relatif à la Lutte Contre le Blanchiment et contre le Financement du Terrorisme font l’objet d’un droit d’accès indirect, par contact avec la CNIL : lien vers le site de la CNIL ; * Droit à l’effacement (ou à l’oubli) : lorsque la durée de conservation des données personnelles est écoulée, toute personne peut demander leur effacement, sous réserve des dispositions de l’article 40 II de la Loi n°78-17 du 6 janvier 1978, modifiée ; * Droit à la limitation des traitements : si les données ne sont plus nécessaires, toute personne peut demander qu’elles soient moins utilisées ; * Droit à la portabilité : toute personne peut demander qu’une copie de ses données personnelles lui soit remise ou soit remise à la personne de son choix, clairement désignée par elle ; * Droit de retirer le consentement d’utilisation : toute personne peut retirer son consentement à l’utilisation des données nécessitant un consentement explicite initial, telles que les données utilisées à des fins commerciales ; * Droit de fixer le sort des données après la mort : toute personne peut confier des directives à une personne choisie par ses soins, en vue de fixer la conservation, la communication ou l’effacement de ses données personnelles après sa mort. ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "En cas de réclamation d’une autre nature relativement au traitement de données personnelles, les cocontractants de WWW.SEVENDREASOIMEME.COM peuvent également contacter la Commission Nationale Informatique et Libertés (CNIL : cnil.fr). ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "La validation de la demande implique la lecture et la parfaite compréhension du présent avertissement ainsi que l’adhésion sans réserves à la politique de gestion des données personnelles du groupe SEVENDREASOIMEME",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                )),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () {
                  model.returnSteppe();
                },
                child: Container(
                  width: 100,
                  height: 40.0,
                  child: Center(
                    child: Wrap(
                      children: [
                        Text(
                          'Retour',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF3a6259),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ButtonWidgetHelper(
                width: isNumberPhoneInVerification ? 140 : 320,
                height: 40.0,
                onTap: () async {
                  if (isNumberPhoneInVerification) {
                    try {
                      UserCredential userCredential = await confirmationResult
                          .confirm(validatinSmsController.text);

                      model.informationClient['uidClient'] = userCredential.user.uid;

                      model.nextSteppe();

                      print(userCredential);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Le code de sms est incorrect")));
                    }

                    return;
                  }

                  if (model.formKey.currentState.validate()) {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;

                      String numberPhone = (model.informationClient[
                          "NUMERO_DE_TELEPHONE_PORTABLE_CREATION"]);

                      // Wait for the user to complete the reCAPTCHA & for an SMS code to be sent.
                      confirmationResult =
                          await auth.signInWithPhoneNumber(numberPhone);

                      setState(() {
                        isNumberPhoneInVerification = true;
                        isWaiting = true;
                      });
                    } catch (e) {


                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "une erreur s'est produite, veuillez vérifier votre numéro de téléphone")));
                    }
                  }

                  // model.nextSteppe();
                },
                textButton: isNumberPhoneInVerification
                    ? "   Suivant"
                    : "   Obtenir le prévisionnel pluriannuel",
                icon: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
