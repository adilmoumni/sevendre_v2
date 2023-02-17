import 'dart:developer';
import 'dart:math';
import 'package:intl/intl.dart';
import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderSM extends ChangeNotifier {
  getVariableFromBack() async {
    var doc = await FirebaseFirestore.instance
        .collection("variable")
        .doc('variables')
        .get();

    informationClient['Taux_interet_Moyen_en_%'] =
        doc['tauxInternetBancaire'].toString();
    informationClient['impotSurLesSociete'] =
        doc['impotSurLesSociete'].toString();
    informationClient['inflationAutre'] = doc['inflationAutre'].toString();
    informationClient['inflationTaxFoncier'] =
        doc['inflationTaxFoncier'].toString();
    informationClient['inflationloyerAnnuel'] =
        doc['inflationloyerAnnuel'].toString();
    informationClient['tauxInternetBancaire'] =
        doc['tauxInternetBancaire'].toString();
    informationClient['impotSurLesSocieteDeuxiemValue'] =
        doc['impotSurLesSocieteDeuxiemValue'].toString();
    informationClient['tauxFraisDeNotaire'] =
        doc['tauxFraisDeNotaire'].toString();

  }

//===============================================================================
//===================== variable ===============================================
//===============================================================================
  // bool resetPassword = true;
  int steppe = 0;
  int grossRepartoin = 1;
  String testText = "";
  final ScrollController scrollController = ScrollController();

  BuildContext context;
  AutoScrollController controller = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, 100),
      axis: Axis.horizontal);

//===============================================================================
//===============================================================================

//===============================================================================
//===================== forms name ===============================================
//===============================================================================
  List<String> formsNameScreens = [
    // "Information Client",
    "Revenue mensuel net de crédit",
    "Remboursement mensuel crédit immobilier",
    "tableau de bord financier previsionnl",
    "Pdf"
  ];

//===============================================================================
//===============================================================================

//===============================================================================
//===================== save uid  ===============================================
//===============================================================================
  Future<String> uidUser() async {
    String uid = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uidUser");

    return uid;
  }

  saveUidClient(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("uidclient", uid);
  }

  saveisSecondeUseerSelected(bool isSecondeUseerSelected) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool("is_seconde_useer_selected", isSecondeUseerSelected);
  }

  getIsSecondeUseerSelected() async {

    try {
      

            print('====================== getIsSecondeUseerSelected ');


            SharedPreferences prefs = await SharedPreferences.getInstance();
            bool isSecondeUserSelect = prefs.getBool("is_seconde_useer_selected");
            client1["is_seconde_useer_selected"] =
                prefs.getBool("is_seconde_useer_selected");

            print(isSecondeUserSelect);    

        } catch (e) {
    }
  }

  getUidClient() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    informationClient["uidClient"] = prefs.getString("uidclient");
  }
//===============================================================================
//===============================================================================

//===============================================================================
//===================== object / client / Dossier ============================
//===============================================================================
//----------------------- client -----------------------
  var client1 = {
    "UIDuser": "",
    "first_name": "",
    "last_name": "",
    "DateNaissance": "16",
    "situatioFamiliale": "Celibataire",
    "email": "",
    "statut": "non",
    "telephone": "",
    "CreeLe": "1",
    //-----------------------
    "first_name2": "",
    "last_name2": "",
    "DateNaissance2": "",
    "situatioFamiliale2": "Celibataire",
    "email2": "",

    "telephone2": "",
    "CreeLe2": "2",

    "is_seconde_useer_selected": false,

    "created_time": Timestamp.now()
  };

  var grosseReparation = {"annees": "", "montant": ""};
  List lisGrosseReparation = [
    {"annees": "", "montant": ""}
  ];

  String anneesPardefaut = "";
//---------------- dossier ------------------------------
  var informationClient = {
    "isSecondeUserChecked": false,
    "uidClient": "",
    "created_at": DateTime.now(),
    'status': 'noSign',
    'UIDuser': '',
    "Année de construction": "",
    //----------------------1-------------------
    "type_de_bien": "",
    "code_postal": "",
    "valeur_du_bien_estimee_par_le_client": "",
    "residence_principale": 1,
    "frais_de_notaire_estime": "",
    "assurence": "",
    "taxe_fonciere": "",
    "charge_De_Cropo_Entretien": "",
    "reparation": [],

    "vente_a_soi_meme_suivie_dune_location": 1,
    'loyer_annule_infor': '',

    //------------------2----------------------
    "revenue_anuelle_du_proprietaire_1": "",

    "charges_annuelle_de_credit_en_cours_du_proprieteire_1": "",
    "revenue_anuelle_du_proprietaire_2": "0",
    "charges_annuelle_de_credit_en_cours_du_proprieteire_2": "",
    "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_1": "",
    "revenu_annuelle_net_de_credit_en_cours_du_proprietaire_2": "",

    "capacite_maximal_de_rembouresement_mensuel": "",
    "revenu_annuels_du_propriétaire": "",
    "revenu_annuel_global_net": "",

    //---------------------3-------------------
    "montant_du_credit_bancaire_demande": "",
    "duree_de_remboursement": "20",
    "Taux_interet_Moyen_en_%": "1.62", // from Back

    //--------------------5--------------------
    "liquidites_degagees": "",
    "remboursement_in_fine_du_compte_courant": "",
    "remboursement_mensuel_du_credit": "",
    "appel_mensuel_en_compte_courant": "",
    "duree_du_remboursement_in_fine_du_compte_courant_(en annee)": "",
    "Interet_du_credit": "12", //From back
    "frais_de_notaire": "",
    "impot_sur_les_societes": "", //From back
    "Honoraire_se_vendre_a_asoi-meme": "",


    'taux_de_lassurance_emprunteur_assure_1_quotite': '10',
    'taux_de_lassurance_emprunteur_assure_2_quotite': '100',

    // -------------------- affichage ------------------
    "total_des_caa": '',
    'CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE': '',
    'CHARGE_MENSUELLE_PENDANT_LA_DUREE_DU_CREDIT': '',
    'CHARGE_MENSUELLE_APRES_REMBOURSEMENT_DU_CREDIT_DU_CREDIT': '',
    'Credit_immobilier_de_la_SCI': '',
    'Appel_de_tresorerie_de_la_SCI': '',
    'Loyer_initial_paye_à_la_SCI': '',
    'Loyer_revis': '',
    'remboursem_infirne_compte_courant': '',

    'REMBOURSEMENT_DU_COMPTE_COURANT': '',

    'interet_demprins_cumul': '',

    // ================= values from back

    'impotSurLesSociete': '15',
    'inflationAutre': '2',
    'inflationTaxFoncier': '5',
    'inflationloyerAnnuel': '1',
    'tauxInternetBancaire': '1.62',
    'impotSurLesSocieteDeuxiemValue': '25',
    'tauxFraisDeNotaire': '7.5',

    'sommeReparation': '0',

    "cumuleMoyenLoyer": '0',
  };

  var dataOfTAbleau = [];
//===============================================================================
//===============================================================================

  double amortisementImeuble() {
    var amortisementImmeuble = double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) *
        0.03;

    return amortisementImmeuble;
  }

//===============================================================================
//=========================== les calcules ======================================
//===============================================================================

//-------------------- calculLiquidteDegage -----------------
  double calculLiquidteDegage() {
    double calcule = (double.parse(
            informationClient["montant_du_credit_bancaire_demande"]) -
        (double.parse(informationClient["Honoraire_se_vendre_a_asoi-meme"])) -
        double.parse(informationClient['frais_de_notaire_estime']));

    informationClient["liquidites_degagees"] = calcule.toString();

    return calcule;
  }

//---------------------mensualiteDucredit-----------------------

  double mensualiteDucredit_calculer() {
    double montantDuCredit =
        double.parse(informationClient["montant_du_credit_bancaire_demande"]);

    double dureRemboursement =
        double.parse(informationClient["duree_de_remboursement"]);

    double tauxInteretMoyen =
        double.parse(informationClient["Taux_interet_Moyen_en_%"]) / 100;

    var mensualiteDuCredi = ((montantDuCredit * (tauxInteretMoyen / 12))) /
        (1 - pow((1 + (tauxInteretMoyen / 12)), -(12 * dureRemboursement)));
    return mensualiteDuCredi;
  }

  double intererDemprinteDynamic(double montantduCredit) {
    var montemDeCredit =
        double.parse(informationClient['montant_du_credit_bancaire_demande']) *
            double.parse(informationClient['Taux_interet_Moyen_en_%']) *
            double.parse(informationClient['duree_de_remboursement']) *
            12;

    return montemDeCredit;
  }

  double mensualiteDucreditDynamic(double montantduCredit) {
    double capacipte_de_remboursement_mensuel = double.parse(
        informationClient['capacite_maximal_de_rembouresement_mensuel']);

    double montant_du_credit = montantduCredit;

    double dure_remboursement =
        double.parse(informationClient["duree_de_remboursement"]);

    double taux_interet_moyen =
        double.parse(informationClient["Taux_interet_Moyen_en_%"]);

    double assurance_mensual = montantduCredit *
        double.parse(informationClient[
            'taux_de_lassurance_emprunteur_assure_1_quotite']) /
        1200;
  


    var mensualite_du_credi =
        ((montant_du_credit * (taux_interet_moyen / 100 / 12))) /
            (1 -
                pow((1 + (taux_interet_moyen / 100 / 12)),
                        -(12 * dure_remboursement))) +
            assurance_mensual;

    return mensualite_du_credi;
  }

  // le user peut passe cette etape
  bool isSucceCheck() {
    calculeRemboursementInfinCompteCourant(mensualiteDucredit_calculer());

    if (int.parse(informationClient[
            "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"]) >
        int.parse(informationClient["duree_de_remboursement"])) {
      return true;
    } else {
      return false;
    }
  }

  double intererDemprinte() {
    var montemDeCredit =
        double.parse(informationClient['montant_du_credit_bancaire_demande']) *
            double.parse(informationClient['Taux_interet_Moyen_en_%']) *
            double.parse(informationClient['duree_de_remboursement']) /
            12;

    return montemDeCredit;
  }

  double diffFraisDeconditution = 0;


  calculeRemboursementInfinCompteCourant(double mensualiteDucredit) {
    uidUser().then((value) => informationClient["UIDuser"] = value);
    int annneCredit = int.parse(
        informationClient["duree_de_remboursement"]); // les années du crédit

    double totalTresorerie = 0; // initialiser la valeur du trésorie
    double loyerAnnuelPremierValu =
        double.parse(informationClient["loyer_annule_infor"]);
    double loyerAnnuel = loyerAnnuelPremierValu;
    // double loyerAnnuel = double.parse(informationClient["valeur_du_bien_estimee_par_le_client"]) * 0.05; // 5% de  valeur du bien
    double depense =
        0; // ce calcule avec la formule du calcule déjà existante dans le ficher
    double loyersPercent = int.parse(
            informationClient['inflationloyerAnnuel']) /
        100; // il est arriver depuis le back en pourcentage exapme ( 10% / 100 = 0.1 ) pas encore

    var cal = double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) *
        0.06;
    double fraisDeConstitution = double.parse(
            informationClient["frais_de_notaire_estime"]) +
        cal; // il est calculer juste la premier années c'est dans la condition i!==0>

    fraisDeConstitution += double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) *
        0.05 /
        12 *
        4;


    if (double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) >
        double.parse(informationClient['montant_du_credit_bancaire_demande'])) {
      double diff = double.parse(
              informationClient["valeur_du_bien_estimee_par_le_client"]) -
          double.parse(informationClient['montant_du_credit_bancaire_demande']);
      fraisDeConstitution += diff;

      diffFraisDeconditution += diff;
    }

    double totalAppleCCA =
        0; // initialiser apple cca par mois et faire le cumule
    int tresori_N2 = 0; // i added

    // ================= valeur par le back ========================
    double taxe_fonciere_inflation =
        int.parse(informationClient['inflationTaxFoncier']) /
            100; // cette valeur est recuper par le back en %
    double entretien_inflation = int.parse(
            informationClient['inflationAutre']) /
        100; // entretien & autres charges diverses recuperer par le back en %

    double impotSurSocietePremereValeur =
        double.parse(informationClient['impotSurLesSociete']) / 100;
    double impotSurSocieteDeuxiemValeur =
        double.parse(informationClient['impotSurLesSocieteDeuxiemValue']) / 100;

    // ================= calcule de depnse ==================

    double taxe_fonciere = double.parse(informationClient["taxe_fonciere"]);
    double assurance = double.parse(informationClient["assurence"]);
    assurance = assurance;
    double entretien =
        double.parse(informationClient["charge_De_Cropo_Entretien"]);
    List grosses_reparations = informationClient["reparation"];

    double totalDesChargeDeductible = 0;

    double amortisementImmeuble = double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) *
        0.03;

    // calcule mensualite + interet
    double mensualiteDucredit = 0;
    double interet = 0;
    double nouvelMontantCredi =
        double.parse(informationClient['montant_du_credit_bancaire_demande']);
    double amortisementCredit;
    var data = [];

    double fraisDeBank = 100;
    double fraisDePTT = 100;

  
    double fraisImmo = 600;

      if(informationClient[
                                      "vente_a_soi_meme_suivie_dune_location"] == 0 ){
                                          fraisImmo = 0;
                                      }

    double fraisDeBankAnneUne = fraisDeBank;
    double fraisDePTTAnneUne = fraisDePTT;
    double fraisImmoAnneUne = fraisImmo;

    double resultatComtable;

    // ==================== Interet d'emprin depnse annulle

    double reportDepert = 0;
    double impot = 0;

    bool isImpoCulmIsFirt = false;
    mensualiteDucredit = mensualiteDucreditDynamic(
        double.parse(informationClient['montant_du_credit_bancaire_demande']));

    double totlalInteterParAnnee = 0;
    double totalAmmortisementCredi = 0;

    double ammortismentCreditAnne1 = 0;

    double reportDannePrecednete;

    double impotCumul = 0;

    double cumulInteretDemprins = 0;

    double admintionGestionAnneeUne;
    double calcuTauxDassurance_client1 = 0;
    double calcuTauxDassurance_client2 = 0;

    double sommeReparation =0;

    double cumuleTotalCCA = 0;

    double cumuleMoyenLoyer = 0;
    double cumuleMoyenMoyenne = 0;

    try {
      for (var i = 1; i <= annneCredit + 3; i++) {
        var depenseAnnuel = depense;
        totlalInteterParAnnee = 0;
        totalAmmortisementCredi = 0;




        if (i <= annneCredit) {
          calcuTauxDassurance_client1 = double.parse(
                  informationClient['montant_du_credit_bancaire_demande']) *
              double.parse(informationClient[
                  'taux_de_lassurance_emprunteur_assure_1_quotite']) /
              100;


          try {
            if (informationClient['isSecondeUserChecked']) {
              calcuTauxDassurance_client2 = double.parse(
                      informationClient['montant_du_credit_bancaire_demande']) *
                  double.parse(informationClient[
                      'taux_de_lassurance_emprunteur_assure_2_quotite']) /
                  100;

            } else {
              calcuTauxDassurance_client2 = 0;
            }
          } catch (e) {
            calcuTauxDassurance_client2 = 0;
          }
        } else {
          calcuTauxDassurance_client1 = 0;
          calcuTauxDassurance_client2 = 0;
        }



        if (i > annneCredit) {
          interet = 0;
        } else {
          for (var i = 0; i < 12; i++) {
            interet = nouvelMontantCredi *
                (double.parse(informationClient["Taux_interet_Moyen_en_%"]) /
                    100 /
                    12);

            // var c = double.parse(
            //         informationClient["montant_du_credit_bancaire_demande"]) *
            //     double.parse(informationClient[
            //         "taux_de_lassurance_emprunteur_assure_1_quotite"]) /
            //     100;


            
            amortisementCredit = mensualiteDucredit - interet;

            nouvelMontantCredi = nouvelMontantCredi - amortisementCredit;

            totalAmmortisementCredi += amortisementCredit;
            totlalInteterParAnnee += interet;


          }
        }

        if(totlalInteterParAnnee < 0 ){
          totlalInteterParAnnee = 0;
        }

        if (i != 1) {
          loyerAnnuel += (loyerAnnuel * loyersPercent);
          taxe_fonciere =
              (taxe_fonciere + (taxe_fonciere * taxe_fonciere_inflation));
          assurance = (assurance + (assurance * entretien_inflation));
          entretien = (entretien + (entretien * entretien_inflation));
          fraisDeConstitution = 0;
          depenseAnnuel = 0;
          fraisDeBank = fraisDeBank + (fraisDeBank * entretien_inflation);
          fraisDePTT = fraisDePTT + (fraisDePTT * entretien_inflation);
          fraisImmo = fraisImmo + (fraisImmo * entretien_inflation);
        } else if (i == 1) {
          ammortismentCreditAnne1 = totalAmmortisementCredi;
          // depenseAnnuel += fraisDeConstitution;

          admintionGestionAnneeUne = (loyerAnnuel * 4 / 100);
        }

        double admGestion = (loyerAnnuel * 4 / 100);

        // faire ladition des depense
        //  depenseAnnuel +
        depenseAnnuel =
            taxe_fonciere +
            assurance +
            entretien +
            admGestion +
            fraisDeBank +
            fraisImmo +
            fraisDePTT;
        totalDesChargeDeductible = fraisDeConstitution +
            admGestion +
            taxe_fonciere +
            assurance +
            entretien +
            totlalInteterParAnnee +
            fraisDeBank +
            fraisImmo +
            fraisDePTT;

        // if (i <= annneCredit) {
        //   depenseAnnuel += totalAmmortisementCredi;
        // }
        double amorImm = 0;
        if (i <= 10) {
          amorImm = double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.03;
          totalDesChargeDeductible += double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.03;
        } else if (i >= 11 && i <= 20) {
          totalDesChargeDeductible += double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.02;
          amorImm = double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.02;
        } else {
          totalDesChargeDeductible += double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.01;
          amorImm = double.parse(
                  informationClient["valeur_du_bien_estimee_par_le_client"]) *
              0.01;
        }

        int grossRepartioon = 0;


        // calculer le total des depense
        for (var y = 0; y < grosses_reparations.length; y++) {
          try {
            if (int.parse(grosses_reparations[y]["annees"]) == i) {
              String mantant = grosses_reparations[y]["montant"];

              if (mantant.isNotEmpty) {
                depenseAnnuel += int.parse(grosses_reparations[y]["montant"]);
                totalDesChargeDeductible +=
                    int.parse(grosses_reparations[y]["montant"]);

                grossRepartioon = int.parse(grosses_reparations[y]["montant"]);
              }

              break;
            }
          } catch (e) {
            grossRepartioon = 0;
          }
        }


        double repo = 0;
        double reuslCom = 0;

        if (reportDannePrecednete != null && reportDannePrecednete >= 0) {
          for (var item in dataOfTAbleau) {
            int annee = item['annee'];
            if (annee == i - 2) {
              repo = double.parse(
                  dataOfTAbleau[i - 3]['Report des pertes'].toString());
            } else if (annee == i - 1) {
              reuslCom = double.parse(
                  dataOfTAbleau[i - 2]['RESULTAT COMPTABLE'].toString());
            }
          }

          if (isImpoCulmIsFirt) {
            if (reuslCom > 38120) {
              impot = reuslCom * impotSurSocieteDeuxiemValeur;
            } else {
              impot = reuslCom * impotSurSocietePremereValeur;
            }
          } else {
            impot = (reuslCom + repo) * impotSurSocietePremereValeur;
            isImpoCulmIsFirt = true;
          }
        }

        depenseAnnuel += impot;
        totalDesChargeDeductible += impot;



        depenseAnnuel +=
            calcuTauxDassurance_client1 + calcuTauxDassurance_client2;
        totalDesChargeDeductible +=
            calcuTauxDassurance_client1 + interet + calcuTauxDassurance_client2;
  

            // add this to appel CAA calcuTauxDassurance_client2

            
        // double tresorieMois = 0;
        // tresorieMois = loyerAnnuel / 12 * 4;

        // if(reportDepert > 0){
        //   tresorieMois += reportDepert;
        // }

        



        double totalDesDepense = taxe_fonciere +
            assurance +
            entretien +
            admGestion +
            totalAmmortisementCredi +
            fraisDeBank +
            fraisImmo +
            fraisDePTT +
            totlalInteterParAnnee +
            impot +
            grossRepartioon +
            calcuTauxDassurance_client1 +
            calcuTauxDassurance_client2; 



        double fraisDeConstitutionAnne1 = 0;
        if (i == 1) {
          fraisDeConstitutionAnne1 =
              (double.parse(informationClient["frais_de_notaire_estime"]) +
                  double.parse(informationClient[
                          "valeur_du_bien_estimee_par_le_client"]) *
                      0.06);
        }
        double totalDesChargeDeductibleSom = fraisDeConstitutionAnne1 +
            taxe_fonciere +
            assurance +
            entretien +
            admGestion +
            fraisDeBank +
            fraisImmo +
            fraisDePTT +
            totlalInteterParAnnee +
            impot +
            grossRepartioon +
            calcuTauxDassurance_client1 +
            calcuTauxDassurance_client2 +
            amorImm;

        double resultatComptable = loyerAnnuel - totalDesChargeDeductibleSom;

        reportDepert = reportDepert + resultatComptable;

        double tresorieMois =
            loyerAnnuel + (loyerAnnuel / 12 * 4) - totalDesDepense;

        if (i == 1) {
          tresorieMois = loyerAnnuel + (loyerAnnuel / 12 * 4) - totalDesDepense;
        } else {

            tresorieMois = loyerAnnuel - totalDesDepense;


          if(double.parse(dataOfTAbleau[i-2]["TRESORERIE"].toString()) > 0 ){
              tresorieMois += double.parse(dataOfTAbleau[i-2]["TRESORERIE"].toString());
          } 

        }

        double appelCCA = 0;
        
        if (tresorieMois < 0) {
          appelCCA = tresorieMois / 12;
        }

        if (i <= annneCredit) {
          if (i == 1 || i > annneCredit) {
            totalAppleCCA += 0;
          } else {
            double cca = -(tresorieMois / 12);
            totalAppleCCA += cca < 0 ? 0 : cca;
          }
          totalTresorerie += tresorieMois;
        }

        tresori_N2 = int.parse(tresorieMois.round().toString());

        double applCAAForm = i == 1 || i > annneCredit
            ? 0
            : (-tresorieMois / 12) < 0
                ? 0
                : (-tresorieMois / 12);

                 if (i <= annneCredit){
                    cumuleMoyenLoyer += loyerAnnuel;
                    cumuleMoyenMoyenne += appelCCA.abs();

                 }

        double crl = 0;

        int anneDeConstruction =
            int.parse(informationClient['Année de construction']) + 15;

        if (anneDeConstruction < DateTime.now().year + i) {
            crl = loyerAnnuel * 2.5 / 100;
               if(informationClient[
                                      "vente_a_soi_meme_suivie_dune_location"] == 0 ){
                                          crl = 0;
                                      }
        
          totalDesDepense += crl;
          totalDesChargeDeductibleSom += crl;
        }

        data.add({
          "crl": crl.round().toString(),
          "annee": (i),
          "fraisDeConstitution":
              i == 1
              ? (double.parse(informationClient["frais_de_notaire_estime"]) +
                      double.parse(informationClient[
                              "valeur_du_bien_estimee_par_le_client"]) *
                          0.06)
                  .round()
                  .toString()
              : 0,
          "loyer annuel": loyerAnnuel.round(),
          "taxe fonciere": taxe_fonciere.round(),
          "assurance": assurance.round(),
          "entretien": entretien.round(),
          "Total des depense": totalDesDepense.round(),
          "TRESORERIE": tresorieMois.round(),
          "APPEL CCA / mois": appelCCA.abs().round(),
          "totalDesChargeDeductible": totalDesChargeDeductibleSom.round(),
          'admistation gestion': admGestion.round(),
          'Amortissement crédit': totalAmmortisementCredi.round(),
          'fraisDeBank': fraisDeBank.round(),
          'Agence immobilière': fraisImmo.round(),
          'fraisDePTT': fraisDePTT.round(),
          'RESULTAT COMPTABLE': resultatComptable.round(),
          'Report des pertes': reportDepert.round(),
          'amortissement immeuble': amorImm.round(),
          'interet': totlalInteterParAnnee.round(),
          'impot': impot.round(),
          'Mensualtie du credit ': mensualiteDucredit.round(),
          'grossRepartioon': grossRepartioon.toString(),
          'MontantAssurance_pro1':
              calcuTauxDassurance_client1.round().toString(),
          'MontantAssurance_pro2':
              calcuTauxDassurance_client2.round().toString()
        });

        cumuleTotalCCA += appelCCA.abs() * 12;
        sommeReparation += grossRepartioon;

        if (i <= annneCredit) {
          impotCumul += impot;
          cumulInteretDemprins += totlalInteterParAnnee;
        }

        impot = 0;

        dataOfTAbleau = data;

        reportDannePrecednete = reportDepert;

      }
    } catch (e) {
    }


    informationClient['sommeReparation']= sommeReparation.round().toString();

    // COMPTE COURANT D'ASSOCIE CUMULE : frais de constitution+12*somme des appel au compte couran

    double grossReparationAnneUne = 0;

    try {
      grossReparationAnneUne = double.parse(grosses_reparations[0]);
    } catch (e) {
      grossReparationAnneUne = 0;
    }

    double totalChageMoyen = 0;
    double totalloyer = 0;
    try {
      for (var i = 0; i < dataOfTAbleau.length -3; i++) {



        totalChageMoyen += double.parse( dataOfTAbleau[i]["taxe fonciere"].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]["assurance"].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]["entretien"].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['admistation gestion'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['Amortissement crédit'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['fraisDeBank'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['Agence immobilière'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['fraisDePTT'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['interet'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['grossRepartioon'].toString());
        totalChageMoyen += double.parse( dataOfTAbleau[i]['MontantAssurance_pro1'].toString());

        // ajouter une condition ici voir comment ^^
        // totalChageMoyen += double.parse( dataOfTAbleau[i]['MontantAssurance_pro2'].toString());

        totalloyer += double.parse(dataOfTAbleau[i]['loyer annuel'].toString());
        
      }
    } catch (e) {}

    double calculChargeMen = totalChageMoyen / (dataOfTAbleau.length -3) / 12;
    totalloyer = totalloyer / (dataOfTAbleau.length -3) / 12;


  


        
    var valDubien6 = double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) *
        0.06;
    double fraisDeConstitutionCalc =
        (double.parse(informationClient["frais_de_notaire_estime"]) +
            double.parse(
                    informationClient["valeur_du_bien_estimee_par_le_client"]) *
                0.06);

    // COMPTE COURANT D'ASSOCIE CUMULE
    // double compteCourantAssocieCumule = fraisDeConstitutionCalc + 12 * totalAppleCCA;

    
    double totalAppleCCATest = totalAppleCCA;

    //  REMBOURSEMENT ANNUEL DU CCA : trésorerie de l’année n+3 après la fin du remboursement

    int remboursementAnnuelCAA = tresori_N2;

    double diffFraisDeconst = 0;

    diffFraisDeconst = double.parse(
            informationClient["valeur_du_bien_estimee_par_le_client"]) - double.parse(
            informationClient["montant_du_credit_bancaire_demande"]);
    

    double compteCourantAssocieCumule = 
         fraisDeConstitutionCalc+ 
        diffFraisDeconst +
        loyerAnnuelPremierValu / 12 * 4 +
        cumuleTotalCCA;




    informationClient["remboursement_in_fine_du_compte_courant"] =
        (compteCourantAssocieCumule).round().toString();

    // Appels mensuels au compte courant
    // Moyenne des appels au compte courants par ans de remboursement
    informationClient["appel_mensuel_en_compte_courant"] =
        (totalAppleCCA / annneCredit).round().toString();

    // var calRem = ((totalAppleCCA / annneCredit) + (loyerAnnuelPremierValu / 12))
    //     .round()
    //     .toString();
    var calRem = mensualiteDucredit_calculer();


    if (double.parse(informationClient["appel_mensuel_en_compte_courant"]) <
        0) {
      informationClient["appel_mensuel_en_compte_courant"] = "0";
    }
    informationClient['remboursement_mensuel_du_credit'] =
        calRem.round().toString();

    // Durée du remboursement in fine du compte courant en années

    if ((compteCourantAssocieCumule / tresori_N2).round() > 0) {
      informationClient[
            "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"] =
        (compteCourantAssocieCumule / tresori_N2).round().toString();
    } else {
      informationClient[
          "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"] = "0";
    }
  

    // calcler la liquidite degageur
    var valuLis = ((double.parse(
            informationClient["montant_du_credit_bancaire_demande"]) -
        double.parse(
                informationClient["valeur_du_bien_estimee_par_le_client"]) *
            0.06 -
        double.parse(informationClient['frais_de_notaire_estime'])));

    informationClient['liquidites_degagees'] = valuLis.toString();



    // =============== this is liquidite

    informationClient['total_des_caa'] = (-totalAppleCCA).round().toString();
    informationClient['CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE'] = (double.parse(
                informationClient['montant_du_credit_bancaire_demande']) -
            double.parse(informationClient['frais_de_notaire_estime']) -
            double.parse(
                    informationClient["valeur_du_bien_estimee_par_le_client"]) *
                0.06)
        .round()
        .toString();

    informationClient[
            'CHARGE_MENSUELLE_APRES_REMBOURSEMENT_DU_CREDIT_DU_CREDIT'] =
        ((loyerAnnuel / 12) - (tresori_N2 / 12)).round().toString();

    informationClient['Credit_immobilier_de_la_SCI'] = (cumuleMoyenMoyenne / int.parse(informationClient["duree_de_remboursement"]))
        .round()
        .toString();

    informationClient['REMBOURSEMENT_DU_COMPTE_COURANT'] =
        (tresori_N2 / 12).round().toString();

  

    informationClient['Loyer_initial_paye_à_la_SCI'] =(totalloyer).round().toString();
    informationClient['Loyer_revis'] = (loyerAnnuel / 12).round().toString();

    informationClient['remboursem_infirne_compte_courant'] =
        (compteCourantAssocieCumule).round().toString();

    informationClient['impot_sur_les_societes'] = impotCumul.round().toString();

    informationClient['interet_demprins_cumul'] =
        cumulInteretDemprins.round().toString();


    informationClient['CHARGE_MENSUELLE_PENDANT_LA_DUREE_DU_CREDIT'] =
(cumuleMoyenLoyer /
                    12 /
                    int.parse(informationClient["duree_de_remboursement"]) +
                cumuleMoyenMoyenne /
                    12 /
                    int.parse(informationClient["duree_de_remboursement"]))
            .round()
            .toString();


        ( calculChargeMen).round().toString();



 if(informationClient[
                                      "vente_a_soi_meme_suivie_dune_location"] == 1 ){
                                        informationClient['cumuleMoyenLoyer'] = '0';
                                      }
                                      else {
          informationClient['cumuleMoyenLoyer'] = (cumuleMoyenLoyer  / 12 / int.parse(
                  informationClient["duree_de_remboursement"]) ).round().toString();
                                      }


    var apple_de_tresosire_sci = (double.parse(
            informationClient['CHARGE_MENSUELLE_PENDANT_LA_DUREE_DU_CREDIT']) -
        double.parse(informationClient['Loyer_initial_paye_à_la_SCI']));

    if (apple_de_tresosire_sci < 0) {
      informationClient['Appel_de_tresorerie_de_la_SCI'] = 0;
    } else {
      informationClient['Appel_de_tresorerie_de_la_SCI'] =
          apple_de_tresosire_sci;
    }


    formatNumberToEur();
  }

  formatNumberToEur() {
    final oCcy = new NumberFormat.currency(locale: "fr_FR", symbol: "€");

    var gg = oCcy.format(456789.75);
    var char = gg.substring(3, 4);

    for (var i = 0; i < dataOfTAbleau.length; i++) {
      dataOfTAbleau[i].forEach((k, v) {
        if (k.toString() != 'list') {
          var val = double.parse(v.toString());

          if (val == null || val == '') val = 0;

          var valu = oCcy.format(val).toString().replaceAll(char, ' ');

          dataOfTAbleau[i][k] =
              valu.toString().substring(0, valu.toString().length - 5);
        }
      });
    }
  }

  //===============================================================================
//===============================================================================

//===============================================================================
//------------------Validation---------------------------------------------------
//===============================================================================

  Function(String) validatorTextFieldString = (value) {
    if (value == null || value.isEmpty) {
      return 'le champ est obligatoire !';
    } else if (value.length < 1) {
      return 'le minimum de caractère est 1!';
    }
    return null;
  };
  Function(String) validatorTextFieldEmail = (value) {
    return MultiValidator([
      RequiredValidator(errorText: "le champ est obligatoire !"),
      EmailValidator(errorText: "Email non valid exemple : jack@gmail.com")
    ]);
  };
  Function(String) validatorTextFieldAdresse = (value) {
    if (value == null || value.isEmpty) {
      return 'le champ est obligatoire !';
    } else if (value.length <= 10) {
      return 'le minimum de caractère est 10!';
    }
    return null;
  };
  Function(String) validatorTextFieldTelephone = (value) {
    // String pattern = r'^((?:\33|0)[1-9](?:\d{2}){4})$';
    // RegExp regExp = new RegExp(pattern);
    // if (value.length == 0) {
    //   return 'Veuillez entrer le numéro de téléphone';
    // }
    if (value == null || value.isEmpty) {
      return 'le champ est obligatoire !';
    } else if (value.length < 10) {
      return 'Veuillez entrer le numéro de téléphone';
    }
    // else if (!regExp.hasMatch(value)) {
    //   return 'le numéro de téléphone non valid exemple 33 4 12 34 56 78';
    // }
    return null;
  };
  Function(String) validatorTextFieldisDouble = (value) {
    String patttern = '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'le champ est obligatoire !';
    } else if (!regExp.hasMatch(value)) {
      return 'Veuillez entrer une valeur valide ';
    }
    return null;
  };

//===============================================================================
//------------------ Stepper ---------------------------------------------------
//===============================================================================
  Future scrollToIndex() async {
    await controller.scrollToIndex(steppe,
        preferPosition: AutoScrollPosition.begin);
  }

  // var informationClient = "";
  final formKey = GlobalKey<FormState>();

  get getterSteppe => steppe;
  get cnt => scrollController;

//---------------nextStepper --------
  nextSteppe() {
    steppe++;

    notifyListeners();
  }

//---------------returnSteppe ---------
  returnSteppe() {
    steppe--;
    notifyListeners();
  }

//===============================================================================
//===============================================================================

  notifyListeners();
}

class France {
  String city;
  bool lat;
  String lng;
  String iso2;
  String adminName;
  String population;
  String populationProper;
}
