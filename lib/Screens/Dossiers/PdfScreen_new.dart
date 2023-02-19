import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import 'dart:developer';
import 'dart:math';
import 'package:intl/intl.dart';

enum value_dossier {
  valeur_du_bien,
  credit_immobilier,

  credit_immobilier_disponible_in_limine,
  remboursement_in_fine_du_compte_courant,
  charge_mensuelle_pendant_la_duree_du_credit,
  duree_du_pret,
  teg,
  loyers,
  taxe_fonciere,
  entretien_autres_charges,
  interet_du_credit,
  frais_notaire,
  impots_sur_les_societes,
  honoraire,

  taux_de_lassurance_emprunteur_assure_1_quotite,
  taux_de_lassurance_emprunteur_assure_2_quotite,

  credit_immo_alacharge_de_la_sci,
  appel_de_tresorerie_de_la_sci,
  loyer_initial_paye_a_la_sci,

  montant_credit_mensuel_societe

}


enum value_table {
  CRL,
  loyer_annuel,
  frais_de_constitution,
  administration_gestion,
  taxe_fonciere,
  assurance,
  entretien,
  banque,
  PTT,
  agence_immobiliere,
  remboursement_du_credit,
  interets_demprunt,
  grosses_reparations,
  impot_sur_les_societes,
  amortissement_de_limmeuble,
  total_charges_deductibles,
  montant_assurance_proprietaire_1,
  montant_assurance_proprietaire_2,
  report_des_pertes,
  tresorerie,
  appel_CCA_mois,
  total_depenses,
  resultat_comptable
}

class ScreenPdfNew extends StatelessWidget {
  Map<String, Object> dataDossier = {};
  var dataOfTAbleau;
  final isSecondClientSelect;
  ScreenPdfNew(this.dataDossier, this.dataOfTAbleau,
      {this.isSecondClientSelect});

  getValue(value_table valTable, index) {
    try {
      String getValue;
      switch (valTable) {
         case value_table.CRL:
          getValue = this.dataOfTAbleau[index]['crl'].toString();
          break;
        case value_table.loyer_annuel:
          getValue = this.dataOfTAbleau[index]['loyer annuel'].toString();
          break;
        case value_table.frais_de_constitution:
          getValue =
              this.dataOfTAbleau[index]['fraisDeConstitution'].toString();
          break;
        case value_table.administration_gestion:
          getValue =
              this.dataOfTAbleau[index]['admistation gestion'].toString();
          break;
        case value_table.taxe_fonciere:
          getValue = this.dataOfTAbleau[index]['taxe fonciere'].toString();
          break;
        case value_table.assurance:
          getValue = this.dataOfTAbleau[index]['assurance'].toString();
          break;
        case value_table.entretien:
          getValue = this.dataOfTAbleau[index]['entretien'].toString();
          break;
        case value_table.banque:
          getValue = this.dataOfTAbleau[index]['fraisDeBank'].toString();
          break;
        case value_table.PTT:
          getValue = this.dataOfTAbleau[index]['fraisDePTT'].toString();
          break;
        case value_table.agence_immobiliere:
          getValue = this.dataOfTAbleau[index]['Agence immobilière'].toString();
          break;
        case value_table.remboursement_du_credit:
          getValue =
              this.dataOfTAbleau[index]['Amortissement crédit'].toString();
          break;
        case value_table.interets_demprunt:
          getValue = this.dataOfTAbleau[index]['interet'].toString();
          
          break;
        case value_table.grosses_reparations:
          getValue = this.dataOfTAbleau[index]['grossRepartioon'].toString();
          break;
        case value_table.impot_sur_les_societes:
          getValue = this.dataOfTAbleau[index]['impot'].toString();
          break;
        case value_table.amortissement_de_limmeuble:
          getValue =
              this.dataOfTAbleau[index]['amortissement immeuble'].toString();
          break;
        case value_table.total_charges_deductibles:
          getValue =
              this.dataOfTAbleau[index]['totalDesChargeDeductible'].toString();
          break;
        case value_table.montant_assurance_proprietaire_1:
          getValue =
              this.dataOfTAbleau[index]['MontantAssurance_pro1'].toString();
          break;
        case value_table.montant_assurance_proprietaire_2:
          getValue =
              this.dataOfTAbleau[index]['MontantAssurance_pro2'].toString();
          break;
        case value_table.report_des_pertes:
          getValue = this.dataOfTAbleau[index]['Report des pertes'].toString();
          break;
        case value_table.tresorerie:
          getValue = this.dataOfTAbleau[index]['TRESORERIE'].toString();
          break;
        case value_table.appel_CCA_mois:
          getValue = this.dataOfTAbleau[index]['APPEL CCA / mois'].toString();
          break;
        case value_table.total_depenses:
          getValue = this.dataOfTAbleau[index]['Total des depense'].toString();
          break;
        case value_table.resultat_comptable:
          getValue = this.dataOfTAbleau[index]['RESULTAT COMPTABLE'].toString();
          break;
      }

      if (getValue == "null") return "";
      return getValue;
    } catch (e) {
      return "";
    }
  }


  getValueDossier(value_dossier valDossier) {
    try {
      String val;

      switch (valDossier) {
        case value_dossier.valeur_du_bien:
          val = this
              .dataDossier['valeur_du_bien_estimee_par_le_client']
              .toString();
          break;

        case value_dossier.credit_immobilier:
          val =
              this.dataDossier['montant_du_credit_bancaire_demande'].toString();
          break;

        case value_dossier.credit_immobilier_disponible_in_limine:
          val = this
              .dataDossier['CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE']
              .toString();
          break;
        case value_dossier.remboursement_in_fine_du_compte_courant:
          val = this
              .dataDossier['remboursement_in_fine_du_compte_courant']
              .toString();
          break;
        case value_dossier.charge_mensuelle_pendant_la_duree_du_credit:
          var cumul =
              double.parse(this.dataDossier['Credit_immobilier_de_la_SCI']) +
                  double.parse(this.dataDossier['cumuleMoyenLoyer']);
          val = cumul.toString();
          break;
        case value_dossier.duree_du_pret:
          val = this.dataDossier['duree_de_remboursement'].toString();
          break;
        case value_dossier.teg:
          val = this.dataDossier['Taux_interet_Moyen_en_%'].toString();
          break;
        case value_dossier.loyers:
          val = this.dataDossier['inflationloyerAnnuel'].toString();
          break;
        case value_dossier.taxe_fonciere:
          val = this.dataDossier['inflationTaxFoncier'].toString();
          break;
        case value_dossier.entretien_autres_charges:
          val = this.dataDossier['inflationAutre'].toString();
          break;
        case value_dossier.interet_du_credit:
          val = this.dataDossier['interet_demprins_cumul'].toString();
          break;
        case value_dossier.frais_notaire:
          val = this.dataDossier['frais_de_notaire'].toString();
          break;
        case value_dossier.impots_sur_les_societes:
          val = this.dataDossier['impot_sur_les_societes'].toString();
          break;
        case value_dossier.honoraire:
          val = (double.parse(this
                      .dataDossier["valeur_du_bien_estimee_par_le_client"]) *
                  0.06)
              .round()
              .toString();
          break;
        case value_dossier.taux_de_lassurance_emprunteur_assure_1_quotite:
          val = this
              .dataDossier['taux_de_lassurance_emprunteur_assure_1_quotite'];
          break;
        case value_dossier.taux_de_lassurance_emprunteur_assure_2_quotite:
          val = this
              .dataDossier['taux_de_lassurance_emprunteur_assure_2_quotite'];
          break;
        case value_dossier.credit_immo_alacharge_de_la_sci:
          val = this.dataDossier['Credit_immobilier_de_la_SCI'].toString();
          break;
        case value_dossier.appel_de_tresorerie_de_la_sci:
          val = this.dataDossier['cumuleMoyenLoyer'].toString();
          break;
        case value_dossier.loyer_initial_paye_a_la_sci:
          val = this.dataDossier['Loyer_initial_paye_à_la_SCI'].toString();
          break;

        case value_dossier.montant_credit_mensuel_societe:
          val = this.dataDossier['montant_credit_mensuel_societe'].toString();
          break;


        default:
      }

      if (val == 'null' || val.isEmpty) return '';

      if (valDossier == value_dossier.teg ||
          valDossier ==
              value_dossier.taux_de_lassurance_emprunteur_assure_1_quotite ||
          valDossier ==
              value_dossier.taux_de_lassurance_emprunteur_assure_2_quotite) {
        return val;
      }

      return formatNumber(value: val).toString();
    } catch (e) {
      return '';
    }
  }

  formatNumber({var value = 0}) {
    try {
      final oCcy = new NumberFormat.currency(locale: "fr_FR", symbol: "€");

      var gg = oCcy.format(456789.75);
      var char = gg.substring(3, 4);

      double val = 0;
      val = double.parse(value.toString());

      var valu = oCcy.format(val).toString().replaceAll(char, ' ');
      var res = valu.toString().substring(0, valu.toString().length - 5);
      return res;
    } catch (e) {
      return 0;
    }
  }


  PdfPageFormat format = PdfPageFormat.a4;
  pw.Document doc;

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    Uint8List byteList;
    List reparation = [];
    var font;
    var fontBold;
    var fontBoldArchivo;
    var fontMontserrat;

    final ByteData bytes =
        await rootBundle.load('assets/images/logo-svasm.png');
    byteList = bytes.buffer.asUint8List();

    font = await PdfGoogleFonts.latoBold();
    fontBold = await PdfGoogleFonts.latoBold();
    fontBoldArchivo = await PdfGoogleFonts.latoBold();
    fontMontserrat = await PdfGoogleFonts.latoBold();

    // Init the document
    doc = pw.Document(
      pageMode: PdfPageMode.thumbs,
      title: 'PREVISIONNEL - SVASM',
      theme: pw.ThemeData(defaultTextStyle: pw.TextStyle(font: font)),
      creator: 'SVASM',
      version: PdfVersion.pdf_1_4,
      compress: true,
      author: 'SVASM',
    );

    pw.Table recettesAnuelles(int start, int lenght) {
      return pw.Table(
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            pw.TableRow(children: [
              pw.Container(
                  color: PdfColor.fromHex('#8cc981'),
                  width: 50,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Center(
                      child: pw.Text("RECETTES ANNUELLES",
                          style: pw.TextStyle(
                              font: font,
                              fontSize: 7.0,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.white)))),
              for (int i = start; i < lenght; i++)
                pw.Container(
                  color: PdfColor.fromHex('#e8f4e6'),
                  alignment: pw.Alignment.center,
                  width: 20,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Center(
                    child: pw.Text(
                      "An ${i + 1}",
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 7.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                )
            ]),
            pw.TableRow(children: [
              pw.Container(
                  color: PdfColor.fromHex('#a3d49b'),
                  width: 50,
                  height: 17,
                  child: pw.Center(
                    child: pw.Text(
                      "Loyer annuel",
                      style: pw.TextStyle(
                          font: font,
                          fontSize: 7.0,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.white),
                    ),
                  )),
              for (int i = start; i < lenght; i++)
                pw.Container(
                  alignment: pw.Alignment.center,
                  color: (i % 2) == 1
                      ? PdfColor.fromHex('#f4f9f2')
                      : PdfColors.white,
                  width: 20,
                  height: 17,
                  child: pw.Text(
                    getValue(value_table.loyer_annuel, i),
                    style: pw.TextStyle(
                      color: PdfColor.fromHex('#4b6864'),
                      fontSize: 7,
                    ),
                  ),

                ),
            ])
            //--------
          ]);
    }

    pw.TableRow depenses(
        String label, int start, int lenght, value_table valTable) {
      return pw.TableRow(children: [
        pw.Container(
            color: PdfColor.fromHex('#637772'),
            height: 17,
            width: 50,
            padding: pw.EdgeInsets.all(5),
            child: pw.Center(
              child: pw.Text(
                label,
                style: pw.TextStyle(
                    font: font,
                    fontSize: 7.0,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white),
              ),
            )),
        for (int i = start; i < lenght; i++)
          pw.Container(
            color: (i % 2) == 1 ? PdfColor.fromHex('#f5f5f5') : PdfColors.white,
            height: 17,
            alignment: pw.Alignment.center,
            width: 20,
            child: pw.Text(
              getValue(valTable, i),
              style: pw.TextStyle(
                color: PdfColor.fromHex('#4b6864'),
                fontSize: 7,
              ),
            ),
          ),
      ]);
    }

    pw.Table depensesAnnuelles(int start, int lenght) {
      return pw.Table(
          // defaultColumnWidth: FixedColumnWidth(18.0),
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            pw.TableRow(children: [
              pw.Container(
                  color: PdfColor.fromHex('#3f5e59'),
                  width: 50,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Center(
                      child: pw.Text("DÉPENSES ANNUELLES",
                          style: pw.TextStyle(
                              font: font,
                              fontSize: 7.0,
                              fontWeight: pw.FontWeight.bold,
                              color: PdfColors.white)))),
              for (int i = start; i < lenght; i++)
                pw.Container(
                  color: PdfColor.fromHex('#d4d7d6'),
                  alignment: pw.Alignment.center,
                  width: 20,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Center(
                    child: pw.Text(
                      "An ${i + 1}",
                      style: pw.TextStyle(
                        font: font,
                        fontSize: 7.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ),
                )
            ]),

            depenses("Frais de constitution", start, lenght,
                value_table.frais_de_constitution),
            depenses("Administration / Gestion", start, lenght,
                value_table.administration_gestion),
            depenses("Taxe foncière", start, lenght, value_table.taxe_fonciere),
            depenses("Assurance", start, lenght, value_table.assurance),
            depenses("Entretien", start, lenght, value_table.entretien),
            depenses("Banque", start, lenght, value_table.banque),
            depenses("PTT", start, lenght, value_table.PTT),

            depenses("CRL", start, lenght, value_table.CRL),
            depenses("Agence immobilière", start, lenght,
                value_table.agence_immobiliere),
            depenses("Remboursement du capital", start, lenght,
                value_table.remboursement_du_credit),

            depenses("Assurance du prêt associé 1", start, lenght,
                value_table.montant_assurance_proprietaire_1),

            isSecondClientSelect
                ? depenses("Assurance du prêt associé 2", start, lenght,
                value_table.montant_assurance_proprietaire_2)
                : pw.TableRow(children: []),


      
               
                
            depenses("Intérêts du crédit", start, lenght,
                value_table.interets_demprunt),
                
            depenses("Grosses réparations", start, lenght,
                value_table.grosses_reparations),
            depenses("Impôt sur les sociétés", start, lenght,
                value_table.impot_sur_les_societes),
            depenses("Amortissement de l'immeuble", start, lenght,
                value_table.amortissement_de_limmeuble),
            depenses("Total charges déductibles", start, lenght,
                value_table.total_charges_deductibles),


            //TOTAL DÉPENSES

            pw.TableRow(children: [
              pw.Container(
                  width: 50,
                  height: 17,
                  alignment: pw.Alignment.center,
                  color: PdfColor.fromHex('#c1cbc8'),
                  child: pw.Text("TOTAL DÉPENSES",
                      style: pw.TextStyle(
                          font: font,
                          color: PdfColor.fromHex('#405f5a'),
                          fontSize: 7.0,
                          fontWeight: pw.FontWeight.bold))),
              for (int i = start; i < lenght; i++)
                pw.Container(
                  height: 17,
                  color: (i % 2) == 1
                      ? PdfColor.fromHex('#c1cbc8')
                      : PdfColor.fromHex('#d6dcda'),
                  alignment: pw.Alignment.center,
                  width: 20,
                  child: pw.Text(
                    getValue(value_table.total_depenses, i),
                    style: pw.TextStyle(
                      color: PdfColor.fromHex('#4b6864'),
                      fontSize: 7,
                    ),
                  ),
                ),
            ]),
            //RESULTAT COMPTABLE

            pw.TableRow(children: [
              pw.Container(
                  width: 50,
                  height: 17,
                  alignment: pw.Alignment.center,
                  color: PdfColor.fromHex('#c1cbc8'),
                  child: pw.Text("RESULTAT COMPTABLE",
                      style: pw.TextStyle(
                          font: font,
                          fontSize: 7.0,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColor.fromHex('#405f5a')))),
              for (int i = start; i < lenght; i++)
                pw.Container(
                  color: (i % 2) == 1
                      ? PdfColor.fromHex('#c1cbc8')
                      : PdfColor.fromHex('#d6dcda'),
                  height: 17,
                  alignment: pw.Alignment.center,
                  width: 20,
                  child: pw.Text(
                    getValue(value_table.resultat_comptable, i),
                    style: pw.TextStyle(
                      color: PdfColor.fromHex('#4b6864'),
                      fontSize: 7,
                    ),
                  ),
                ),
            ]),
            depenses("Report des pertes", start, lenght,
                value_table.report_des_pertes),
            depenses("Trésorerie", start, lenght, value_table.tresorerie),
            depenses(
                "Appel CCA / mois", start, lenght, value_table.appel_CCA_mois),

            //--------
          ]);
    }

    pw.Table hypotheses() {
      return pw.Table(
          // defaultColumnWidth: pw.FixedColumnWidth(18.0),
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            // for (int i = 0; i < dA.length; i++)

            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Type de prêt',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 8.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Prêt immobilier à taux fixe',
                    style: pw.TextStyle(
                      fontSize: 8.0,
                      font: fontMontserrat,
                    )),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Montant du prêt',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 8.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.credit_immobilier) + ' €',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                    )),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Durée du prêt',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 8.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.duree_du_pret) + ' ans',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                    )),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Taux du crédit',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex('#3f5e59'),
                    )),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(getValueDossier(value_dossier.teg) + ' %',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                    )),
              ),
            ]),
        
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Taux assurance associé 1',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex('#3f5e59'),
                    )),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier
                            .taux_de_lassurance_emprunteur_assure_1_quotite) +
                        ' %',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 8.0,
                    )),
              ),
            ]),

            isSecondClientSelect
                ? pw.TableRow(children: [
                    pw.Container(
                      color: PdfColor.fromHex('#eaebeb'),
                      width: 128,
                      height: 17,
                      padding: pw.EdgeInsets.all(3),
                      alignment: pw.Alignment.center,
                      child: pw.Text('Taux assurance associé 2',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 8.0,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColor.fromHex('#3f5e59'),
                          )),
                    ),
                    pw.Container(
                      width: 128,
                      height: 17,
                      padding: pw.EdgeInsets.all(3),
                      alignment: pw.Alignment.center,
                      child: pw.Text(
                          getValueDossier(value_dossier
                                  .taux_de_lassurance_emprunteur_assure_2_quotite) +
                              ' %',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 8.0,
                          )),
                    ),
                  ])
                : pw.TableRow(children: []),
            //--------
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Montant du crédit mensuel de la société',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 6.5,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex('#3f5e59'),
                    )),
              ),
              pw.Container(
                  width: 128,
                  height: 17,
                  alignment: pw.Alignment.center,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [

                        pw.Text(getValueDossier(value_dossier.montant_credit_mensuel_societe),
                
                    style: pw.TextStyle(font: font, fontSize: 7.0)),

                      ])),
            ]),

         
          ]);
    }

    pw.Table revisionsAnnuelles() {
      return pw.Table(
          // defaultColumnWidth: FixedColumnWidth(18.0),
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            // for (int i = 0; i < dA.length; i++)

            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Loyers',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 7.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(getValueDossier(value_dossier.loyers) + ' %',
                
                    style: pw.TextStyle(font: font, fontSize: 7.0)),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Taxe foncière',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 7.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.taxe_fonciere) + ' %',
                    style: pw.TextStyle(font: font, fontSize: 7.0)),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                color: PdfColor.fromHex('#eaebeb'),
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text('Entretien & autres charges',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 7.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
              pw.Container(
                width: 128,
                height: 17,
                padding: pw.EdgeInsets.all(3),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.entretien_autres_charges) +
                        ' %',
                    style: pw.TextStyle(font: font, fontSize: 7.0)),
              ),
            ]),

            //--------
          ]);
    }

    pw.Table tableauDeBord() {
      return pw.Table(

          // defaultColumnWidth: FixedColumnWidth(18.0),
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            // for (int i = 0; i < dA.length; i++)

            pw.TableRow(children: [
              pw.Container(
                width: 289.1,
                height: 56.6,
                color: PdfColor.fromHex('#3f5e59'),
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: pw.Text(
                  'CRÉDIT IMMOBILIER DISPONIBLE IN LIMINE*',
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 9.0,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.white,
                  ),
                ),
              ),
              pw.Container(
                height: 56.6,
                width: 172.9,
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier
                            .credit_immobilier_disponible_in_limine) +
                        ' €',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 14.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                width: 289.1,
                height: 56.6,
                color: PdfColor.fromHex('#3f5e59'),
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: pw.Text('REMBOURSEMENT IN FINE DU COMPTE COURANT**',
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 9.0,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                    )),
              ),
              pw.Container(
                height: 56.6,
                width: 172.9,
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier
                            .remboursement_in_fine_du_compte_courant) +
                        ' €',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 14.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
            ]),
            pw.TableRow(children: [
              pw.Container(
                  height: 56.6,
                  width: 289.1,
                  color: PdfColor.fromHex('#3f5e59'),
                  padding: pw.EdgeInsets.all(5),
                  alignment: pw.Alignment.center,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'CHARGE MENSUELLE MOYENNE PENDANT LA DURÉE DU CRÉDIT: ',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 8.0,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.Text(
                          "Moyenne appel mensuel en compte courant d’associé (remboursé in fine)  : " +
                              getValueDossier(value_dossier
                                  .credit_immo_alacharge_de_la_sci) +
                              ' €',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 6,
                            color: PdfColors.white,
                          ),
                        ),
                        pw.Text(
                          "Moyenne loyer mensuel (si location à soi-même) : " +
                              getValueDossier(
                                  value_dossier.appel_de_tresorerie_de_la_sci) +
                              ' €',
                          style: pw.TextStyle(
                            font: font,
                            fontSize: 6,
                            color: PdfColors.white,
                          ),
                        ),
                      ])),
              pw.Container(
                height: 56.6,
                width: 172.9,
                padding: pw.EdgeInsets.all(5),
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier
                            .charge_mensuelle_pendant_la_duree_du_credit) +
                        ' €',

                    style: pw.TextStyle(
                        font: font,
                        fontSize: 14.0,
                        color: PdfColor.fromHex('#3f5e59'),
                        fontWeight: pw.FontWeight.bold)),
              ),
            ]),

            //--------
          ]);
    }

    pw.Table frais() {
      return pw.Table(
          border: pw.TableBorder.all(
              color: PdfColor.fromHex('#3f5e59'),
              style: pw.BorderStyle.solid,
              width: 0.5),
          children: [
            pw.TableRow(children: [
              pw.Container(
                height: 25.5,
                width: 116,
                color: PdfColor.fromHex('#e9ebeb'),
                alignment: pw.Alignment.center,
                child: pw.Text('Intérêt du crédit',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 9.0,
                        color: PdfColor.fromHex('#405f5a'))),
              ),
              pw.Container(
                height: 25.5,
                width: 116,
                color: PdfColor.fromHex('#e9ebeb'),
                alignment: pw.Alignment.center,
                child: pw.Text('Frais notaire',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 9.0,
                        color: PdfColor.fromHex('#405f5a'))),
              ),
              pw.Container(
                height: 25.5,
                width: 116,
                color: PdfColor.fromHex('#e9ebeb'),
                alignment: pw.Alignment.center,
                child: pw.Text('Impôts sur les sociétés',
                    style: pw.TextStyle(
                        font: font,
                        fontSize: 9.0,
                        color: PdfColor.fromHex('#405f5a'))),
              ),
              pw.Container(
                  height: 25.5,
                  width: 116,
                  color: PdfColor.fromHex('#e9ebeb'),
                  alignment: pw.Alignment.center,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Center(
                            child: pw.Text("Honoraire",
                                style: pw.TextStyle(
                                    font: font,
                                    fontSize: 7.0,
                                    color: PdfColor.fromHex('#405f5a')))),
                        pw.Center(
                          child: pw.Text(
                            'SEVENDREASOIMEME',
                            style: pw.TextStyle(
                                font: font,
                                fontSize: 7.0,
                                color: PdfColor.fromHex('#405f5a')),
                          ),
                        )
                      ])),
            ]),
            pw.TableRow(children: [
              pw.Container(
                height: 17,
                width: 116,
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.interet_du_credit) + ' €',

                    style: pw.TextStyle(font: font, fontSize: 6.0)),
              ),
              pw.Container(
                height: 17,
                width: 116,
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.frais_notaire) + ' €',
                    style: pw.TextStyle(font: font, fontSize: 6.0)),
              ),
              pw.Container(
                height: 17,
                width: 116,
                alignment: pw.Alignment.center,
                child: pw.Text(
                    getValueDossier(value_dossier.impots_sur_les_societes) +
                        ' €',
                    style: pw.TextStyle(font: font, fontSize: 6.0)),
              ),
              pw.Container(
                height: 17,
                width: 116,
                alignment: pw.Alignment.center,
                child: pw.Text(getValueDossier(value_dossier.honoraire) + ' €',
                    style: pw.TextStyle(font: font, fontSize: 6.0)),
              ),
            ]),
          ]);
    }

    doc.addPage(
      pw.Page(
        clip: true,
        pageFormat: PdfPageFormat.standard.landscape,
        orientation: pw.PageOrientation.landscape,
        theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(
          font: font,
        )),
        margin: pw.EdgeInsets.all(0),
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Container(
              width: 841,
              color: PdfColor.fromHex('#f4f4f4'),
              child: pw.Container(
                padding: pw.EdgeInsets.only(
                    left: 311.8, right: 311.8, top: 30.3, bottom: 30.3),
                child: pw.Image(
                    pw.MemoryImage(
                      byteList,
                    ),
                    fit: pw.BoxFit.contain),
              ),
            ),
            pw.SizedBox(height: 23),
            pw.Container(
              width: 762,
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Container(
                        decoration: pw.BoxDecoration(
                            color: PdfColor.fromHex('#3f5e59'),
                            border: pw.Border.all(
                              color: PdfColor.fromHex('#3f5e59'),
                              width: 1,
                            )),
                        width: 381,
                        height: 74,
                        child: pw.Padding(
                          padding: pw.EdgeInsets.all(0),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text(
                                'VASM',
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColors.white,
                                  fontSize: 22,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                'Tableau de bord financier prévisionnel',
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        )),
                    pw.Container(
                        decoration: pw.BoxDecoration(
                            color: PdfColors.white,
                            border: pw.Border.all(
                              color: PdfColor.fromHex('#3f5e59'),
                              width: 1,
                            )),
                        width: 381,
                        height: 74,
                        child: pw.Padding(
                          padding: pw.EdgeInsets.all(0),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.SizedBox(height: 7),
                              pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Text(
                                      'VALEUR VÉNALE DU BIEN : ',
                                      style: pw.TextStyle(
                                          font: font,
                                          color: PdfColor.fromHex('#3f5e59'),
                                          fontSize: 10),
                                    ),
                                    pw.Text(
                                      getValueDossier(
                                              value_dossier.valeur_du_bien) +
                                          ' €',
                                      style: pw.TextStyle(
                                          font: font,
                                          color: PdfColor.fromHex('#3f5e59'),
                                          fontSize: 12),
                                    ),
                                  ]),
                              pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Text(
                                      'CRÉDIT IMMOBILER : ',
                                      style: pw.TextStyle(
                                          font: font,
                                          color: PdfColor.fromHex('#3f5e59'),
                                          fontSize: 10),
                                    ),
                                    pw.Text(
                                      getValueDossier(
                                              value_dossier.credit_immobilier) +
                                          ' €',
                                      style: pw.TextStyle(
                                          font: font,
                                          color: PdfColor.fromHex('#3f5e59'),
                                          fontSize: 12),
                                    ),
                                  ]),
                            ],
                          ),
                        )),
                  ]),
            ),
            pw.SizedBox(height: 25),
            pw.Padding(
                padding: pw.EdgeInsets.only(
                    left: 39.6, right: 39.6, bottom: 0.00255),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          children: [
                            pw.Container(
                                child: pw.Center(
                                    child: pw.Text("HYPOTHÈSES",
                                        style: pw.TextStyle(
                                          font: font,
                                          fontStyle: pw.FontStyle.normal,
                                          fontWeight: pw.FontWeight.normal,
                                          fontSize: 11,
                                          color: PdfColor.fromHex('#3f5e59'),
                                        )))),
                            pw.SizedBox(height: 11),
                            hypotheses(),
                            pw.SizedBox(height: 17),
                            pw.Container(
                                child: pw.Center(
                                    child: pw.Text("RÉVISIONS ANNUELLES",
                                        style: pw.TextStyle(
                                            font: font,
                                            color: PdfColor.fromHex('#3f5e59'),
                                            fontSize: 11)))),
                            pw.SizedBox(height: 11),
                            revisionsAnnuelles(),
                            pw.SizedBox(height: 16.5),
                            pw.Container(
                                padding: pw.EdgeInsets.all(5),
                                margin: pw.EdgeInsets.only(left: 0),
                                width: 256,
                                color: PdfColors.grey100,
                                child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.SizedBox(height: 5),
                                      pw.Text("AVERTISSEMENT:",
                                          style: pw.TextStyle(
                                            font: font,
                                            fontSize: 7,
                                            fontWeight: pw.FontWeight.bold,
                                            color: PdfColor.fromHex('#3f5e59'),
                                          )),
                                      pw.SizedBox(height: 5),
                                      pw.Text(
                                          "LE PRÉSENT TABLEAU DE BORD PLURIANNUEL EST SIMPLEMENT PRÉVISIONNEL ET PEUT ÊTRE REMIS EN CAUSE PAR DES ÉVENTUELLES GROSSES RÉPARATIONS ET AUTRES SINISTRES OU EVENEMENTS IMPRÉVUS PAR LUI (ÉVÉNEMENT CLIMATIQUE, INCENDIE, INCIVILITÉS, ETC).",
                                          style: pw.TextStyle(
                                            font: font,
                                            fontSize: 5.5,
                                            color: PdfColor.fromHex('#3f5e59'),
                                          )),
                                      pw.SizedBox(height: 3),
                                      pw.Text(
                                          "* Montant du crédit immobilier payé par la Société au propriétaire dès après la réception de la vente par le notaire, déduction faite des sommes devant être remboursées par la Société à ses associés qui ont lui en ont consenti l'avance, et qui sont inscrits sur leurs comptes courants d'associés : frais & honoraires afférents à l'opération et éventuels appels de trésorerie.",
                                          style: pw.TextStyle(
                                            font: font,
                                            fontSize: 5.5,
                                            color: PdfColor.fromHex('#3f5e59'),
                                          )),
                                      pw.Text(
                                          "**Le compte courant d'associé (CCA) est un compte ouvert au nom de chaque associé dans les livres comptables de la Société qui, lorsqu'il est créditeur, établit la somme due par la Société à chaque associé devant lui être remboursée par elle. Ce compte inclut les frais dont les associés ont consenti l'avance à la Société : frais de notaire, honoraires, et éventuels appels de trésorerie.",
                                          style: pw.TextStyle(
                                            font: font,
                                            fontSize: 5.5,
                                            color: PdfColor.fromHex('#3f5e59'),
                                          )),
                                    ]))
                          ]),
                      pw.Column(children: [
                        pw.Text("TABLEAU DE BORD",
                            style: pw.TextStyle(
                              font: font,
                              color: PdfColor.fromHex('#3f5e59'),
                              fontSize: 11,
                            )),
                        pw.SizedBox(height: 11),
                        tableauDeBord(),
                        pw.SizedBox(height: 17),
                        pw.Center(
                            child: pw.Text("FRAIS",
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 11,
                                ))),
                        pw.SizedBox(height: 11.3),
                        frais(),
                        pw.SizedBox(height: 22.6),
                        pw.Container(
                          width: 462,
                          height: 0.5,
                          color: PdfColor.fromHex('#405f5a'),
                        ),
                        pw.Container(
                          height: 51,
                          width: 462,
                          padding: pw.EdgeInsets.only(top: 11.3),
                          child: pw.Row(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            children: [
                              pw.Text(
                                "",
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 6,
                                ),
                              ),
                              pw.Text(
                                "Projet",
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 30,
                                ),
                              ),
                              pw.Text(
                                "",
                                style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.Container(
                          width: 462,
                          height: 0.5,
                          color: PdfColor.fromHex('#405f5a'),
                        ),
                      ]),
                    ]))
          ]);
        },
      ),
    );


    doc.addPage(pw.Page(
        clip: true,
        pageFormat: PdfPageFormat.standard.landscape,
        orientation: pw.PageOrientation.landscape,
        theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(
          font: font,
        )),
        margin:
            pw.EdgeInsets.only(top: 25.5, left: 26, right: 26, bottom: 11.3),
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Container(
              width: double.infinity,
              height: 36.8,
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(
                color: PdfColor.fromHex('#3f5e59'),
                width: 1,
              )),
              child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                  children: [
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text("VASM",
                              style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("Tableau de bord financier prévisionnel",
                              style: pw.TextStyle(
                                  font: font,
                                  color: PdfColor.fromHex('#3f5e59'),
                                  fontSize: 9)),
                        ]),
                    pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "VALEUR VÉNALE DU BIEN :  ",
                                  style: pw.TextStyle(
                                      font: font,
                                      color: PdfColor.fromHex('#3f5e59'),
                                      fontSize: 9),
                                ),
                                pw.Text(
                                  getValueDossier(
                                          value_dossier.valeur_du_bien) +
                                      ' €',
                                  style: pw.TextStyle(
                                      font: font,
                                      color: PdfColor.fromHex('#3f5e59'),
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ]),
                          pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "CRÉDIT IMMOBILER :  ",
                                  style: pw.TextStyle(
                                      font: font,
                                      color: PdfColor.fromHex('#3f5e59'),
                                      fontSize: 9),
                                ),
                                pw.Text(
                                  getValueDossier(
                                          value_dossier.credit_immobilier) +
                                      ' €',
                                  style: pw.TextStyle(
                                      font: font,
                                      color: PdfColor.fromHex('#3f5e59'),
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 11),
                                ),
                              ]),
                        ])
                  ]),
            ),
            pw.SizedBox(height: 14.1),
            recettesAnuelles(0, 14),
            pw.SizedBox(height: 14.1),
            depensesAnnuelles(0, 14),
            pw.SizedBox(height: 10.34),
            pw.Row(children: [
              pw.Container(
                width: 274,
                padding: pw.EdgeInsets.all(5),
                color: PdfColors.grey100,
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "AVERTISSEMENT :",
                        style: pw.TextStyle(
                            font: font,
                            color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 7,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        "LE PRÉSENT TABLEAU DE BORD PLURIANNUEL EST SIMPLEMENT PRÉVISIONNEL ET PEUT ÊTRE REMIS EN CAUSE PAR DES ÉVENTUELLES GROSSES RÉPARATIONS ET AUTRES SINISTRES OU EVENEMENTS IMPRÉVUS PAR LUI (ÉVÉNEMENT CLIMATIQUE, INCENDIE, INCIVILITÉS, ETC).",
                        style: pw.TextStyle(
                            color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 6,
                            font: fontMontserrat),
                      )
                    ]),
              ),
              pw.SizedBox(width: 19.8),
              pw.Container(
                  child: pw.Column(children: [
                pw.Container(
                  width: 350,
                  height: 0.5,
                  color: PdfColor.fromHex('#405f5a'),
                ),
                pw.Container(
                  height: 51,
                  width: 350,
                  padding: pw.EdgeInsets.only(top: 11.3),
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Text(
                        "",
                        style: pw.TextStyle(
                          font: font,
                          color: PdfColor.fromHex('#3f5e59'),
                          fontSize: 6,
                        ),
                      ),
                      pw.Text(
                        "Projet",
                        style: pw.TextStyle(
                          font: font,
                          color: PdfColor.fromHex('#3f5e59'),
                          fontSize: 30,
                        ),
                      ),
                      pw.Text(
                        "",
                        style: pw.TextStyle(
                          font: font,
                          color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ),
                pw.Container(
                  width: 350,
                  height: 0.5,
                  color: PdfColor.fromHex('#405f5a'),
                ),
              ])),
              pw.Container(
                height: 100,
                width: 120,
                margin: pw.EdgeInsets.only(top: 0, left: 25),
                child: pw.Image(
                    pw.MemoryImage(
                      byteList,
                    ),
                    fit: pw.BoxFit.contain),
              ),
            ])
          ]);
        })); // Page

    if (this.dataOfTAbleau.length > 14) {
      doc.addPage(pw.Page(
          clip: true,
          pageFormat: PdfPageFormat.standard.landscape,
          orientation: pw.PageOrientation.landscape,
          theme: pw.ThemeData(
              defaultTextStyle: pw.TextStyle(
            font: font,
          )),
          margin:
              pw.EdgeInsets.only(top: 25.5, left: 26, right: 26, bottom: 11.3),
          build: (pw.Context context) {
            return pw.Column(children: [
              pw.Container(
                width: double.infinity,
                height: 36.8,
                decoration: pw.BoxDecoration(
                    border: pw.Border.all(
                  color: PdfColor.fromHex('#3f5e59'),
                  width: 1,
                )),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    children: [
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text("VASM",
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor.fromHex('#3f5e59'),
                                    fontSize: 12,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text("Tableau de bord financier prévisionnel",
                                style: pw.TextStyle(
                                    font: font,
                                    color: PdfColor.fromHex('#3f5e59'),
                                    fontSize: 9)),
                          ]),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                    "VALEUR VÉNALE DU BIEN :  ",
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor.fromHex('#3f5e59'),
                                        fontSize: 9),
                                  ),
                                  pw.Text(
                                    getValueDossier(
                                            value_dossier.valeur_du_bien) +
                                        ' €',
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor.fromHex('#3f5e59'),
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 11),
                                  ),
                                ]),
                            pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Text(
                                    "CRÉDIT IMMOBILER :  ",
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor.fromHex('#3f5e59'),
                                        fontSize: 9),
                                  ),
                                  pw.Text(
                                    getValueDossier(
                                            value_dossier.credit_immobilier) +
                                        ' €',
                                    style: pw.TextStyle(
                                        font: font,
                                        color: PdfColor.fromHex('#3f5e59'),
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 11),
                                  ),
                                ]),
                          ])
                    ]),
              ),
              pw.SizedBox(height: 14.1),
              recettesAnuelles(14, 28),
              pw.SizedBox(height: 14.1),
              depensesAnnuelles(14, 28),
              pw.SizedBox(height: 10.34),
              pw.Row(children: [
                pw.Container(
                  width: 274,
                  padding: pw.EdgeInsets.all(5),
                  color: PdfColors.grey100,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "AVERTISSEMENT :",
                          style: pw.TextStyle(
                              font: font,
                              color: PdfColor.fromHex('#3f5e59'),
                              fontSize: 7,
                              fontWeight: pw.FontWeight.bold),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "LE PRÉSENT TABLEAU DE BORD PLURIANNUEL EST SIMPLEMENT PRÉVISIONNEL ET PEUT ÊTRE REMIS EN CAUSE PAR DES ÉVENTUELLES GROSSES RÉPARATIONS ET AUTRES SINISTRES OU EVENEMENTS IMPRÉVUS PAR LUI (ÉVÉNEMENT CLIMATIQUE, INCENDIE, INCIVILITÉS, ETC).",
                          style: pw.TextStyle(
                              color: PdfColor.fromHex('#3f5e59'),
                              fontSize: 6,
                              font: fontMontserrat),
                        )
                      ]),
                ),
                pw.SizedBox(width: 19.8),
                pw.Container(
                    child: pw.Column(children: [
                  pw.Container(
                    width: 350,
                    height: 0.5,
                    color: PdfColor.fromHex('#405f5a'),
                  ),
                  pw.Container(
                    height: 51,
                    width: 350,
                    padding: pw.EdgeInsets.only(top: 11.3),
                    child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                      children: [
                        pw.Text(
                          "",
                          style: pw.TextStyle(
                            font: font,
                            color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 6,
                          ),
                        ),
                        pw.Text(
                          "Projet",
                          style: pw.TextStyle(
                            font: font,
                            color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 30,
                          ),
                        ),
                        pw.Text(
                          "",
                          style: pw.TextStyle(
                            font: font,
                            color: PdfColor.fromHex('#3f5e59'),
                            fontSize: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 350,
                    height: 0.5,
                    color: PdfColor.fromHex('#405f5a'),
                  ),
                ])),
                pw.Container(
                  height: 100,
                  width: 120,
                  margin: pw.EdgeInsets.only(top: 0, left: 25),
                  child: pw.Image(
                      pw.MemoryImage(
                        byteList,
                      ),
                      fit: pw.BoxFit.contain),
                ),
              ])
            ]);
          })); // Page

    }
      
    return doc.save();
  }

  // printPDF() async {
  //   await generateDocument(format).whenComplete(() async {
  //     saveAndLaunchFile(await doc.save(), 'sevendre.pdf')
  //     .whenComplete(() => Navigator.pushNamed(context, '/TableauDeBoard'));
  //   });
  // }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    // this is for printing pdf
    // generateDocument(format).whenComplete(() async {
    //   saveAndLaunchFile(await doc.save(), 'sevendre.pdf')
    //       .whenComplete(() => Navigator.pushNamed(context, '/TableauDeBoard'));
    // });

    return Scaffold(
      body: PdfPreview(
        previewPageMargin: EdgeInsets.all(0),
        build: (format) => generateDocument(format),
        canChangeOrientation: true,
      ),
    );
  }
}
