
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class ScreenPdf extends StatefulWidget {
  Map<String, Object> dataDossier = {};
  var dataOfTAbleau;
  ScreenPdf(this.dataDossier, this.dataOfTAbleau, {Key key}) : super(key: key);

  @override
  _ScreePdfState createState() => _ScreePdfState();
}

class _ScreePdfState extends State<ScreenPdf> {
  final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
  PdfPageFormat format = PdfPageFormat.standard;
  List reparation = [];

  @override
  void initState() {
    super.initState();

    setList();
    printPDF();
  }

  

  setList() async {
    setState(() {

      reparation = widget.dataDossier["reparation"];
    });
    font = await PdfGoogleFonts.latoBold();

  }
  var font;

  pw.Table dataDepense(int start, int lenght) {
    
    return pw.Table(
        // defaultColumnWidth: FixedColumnWidth(18.0),
        border: pw.TableBorder.all(
            color: PdfColors.black, style: pw.BorderStyle.solid, width: 2),
        children: [
          // for (int i = 0; i < dA.length; i++)

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("DEPENSES ANNUELLES",
                    style: pw.TextStyle(
                        fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text("An ${i + 1}",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
          //--------

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Frais de constitution",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      // (Frais de notaire + la valeur de bien ) * 0,06
                      //     i == 0
                      //  ?  ( double.parse(widget.dataDossier["fraisDeConstitution"]) + double.parse(widget.dataDossier["valeur_du_bien_estimee_par_le_client"])
                      //  * 0.06).toString()

                      //     :
                      widget.dataOfTAbleau[i]["fraisDeConstitution"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Administration / Gestion",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["admistation gestion"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          // pw.TableRow(children: [
          //   pw.Container(
          //       width: 300,
          //       padding: pw.EdgeInsets.all(5),
          //       child: pw.Text("loyer annuel",
          //           style: pw.TextStyle(fontSize: 8.0))),
          //   for (int i = start; i < lenght; i++)
          //     pw.Container(
          //         alignment: pw.Alignment.center,
          //         width: 300,
          //         padding: pw.EdgeInsets.all(5),
          //         child: pw.Text(
          //             widget.dataOfTAbleau[i]["loyer annuel"].toString() ?? "0",
          //             style: pw.TextStyle(fontSize: 8.0)))
          // ]),
          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Taxe foncière",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["taxe fonciere"].toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child:
                    pw.Text("Assurance", style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["assurance"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child:
                    pw.Text("Entretien", style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["entretien"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Banque",
                    style: pw.TextStyle(
                      fontSize: 8.0,
                    ))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["fraisDeBank"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("PTT", style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["fraisDePTT"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Agence immobilière",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["Agence immobilière"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Amortissement crédit",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["Amortissement crédit"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),



          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Montant associé propriétaire 1",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["MontantAssurance_pro1"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Montant associé propriétaire 2",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["MontantAssurance_pro2"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),






          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Intérêts emprunt",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                    widget.dataOfTAbleau[i]["interet"].toString() + ' €' ?? "0",
                    style: pw.TextStyle(
                      fontSize: 8.0,
                      font: font,
                    ),
                  ))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Grose réparation",
                  style: pw.TextStyle(
                    fontSize: 8.0,
                    font: font,
                  ),
                )),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["grossRepartioon"].toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Impôt sur les sociétés",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["impot"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Amortissement Immeuble",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["amortissement immeuble"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Total charges déductibles",
                    style: pw.TextStyle(fontSize: 6.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["totalDesChargeDeductible"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("TOTAL DEPENSES",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["Total des depense"].toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("RESULTAT COMPTABLE",
                    style: pw.TextStyle(fontSize: 6.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["RESULTAT COMPTABLE"]
                              .toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("Report des pertes",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["Report des pertes"].toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child:
                    pw.Text("TRESORERIE", style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["TRESORERIE"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("APPEL CCA / mois",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["APPEL CCA / mois"].toString() ??
                          "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
        ]);
  }

  pw.Table dataReccete(int start, int lenght) {
    return pw.Table(
        // defaultColumnWidth: FixedColumnWidth(18.0),
        border: pw.TableBorder.all(
            color: PdfColors.black, style: pw.BorderStyle.solid, width: 2),
        children: [
          // for (int i = 0; i < dA.length; i++)
          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("RECETTES ANNUELLES",
                    style: pw.TextStyle(
                        fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text("An ${i + 1}",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),

          pw.TableRow(children: [
            pw.Container(
                width: 300,
                padding: pw.EdgeInsets.all(5),
                child: pw.Text("loyer annuel",
                    style: pw.TextStyle(fontSize: 8.0))),
            for (int i = start; i < lenght; i++)
              pw.Container(
                  alignment: pw.Alignment.center,
                  width: 300,
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text(
                      widget.dataOfTAbleau[i]["loyer annuel"].toString() ?? "0",
                      style: pw.TextStyle(fontSize: 8.0)))
          ]),
        ]);
  }

  pw.Column data2() {
    return pw.Column(
      children: [
/////////
        pw.Container(
          color: PdfColors.grey,
          child: pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.6),
                1: pw.FractionColumnWidth(0.2)
              },
              // defaultColumnWidth: FixedColumnWidth(18.0),
              border: pw.TableBorder(
                  left: pw.BorderSide(color: PdfColors.black, width: 1),
                  right: pw.BorderSide(color: PdfColors.black, width: 1),
                  top: pw.BorderSide(color: PdfColors.black, width: 1),
                  bottom: pw.BorderSide(color: PdfColors.black, width: 1)),
              children: [
                // for (int i = 0; i < dA.length; i++)

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,

                      height: 20,
                      child: pw.Text(" COMPTE COURANT D'ASSICIE CUMULE",
                          style: pw.TextStyle(fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,

                      height: 20,
                      child: pw.Text("38.444 ",
                          style: pw.TextStyle(fontSize: 10))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,

                      width: 700,
                      height: 20,
                      child: pw.Text(" REMBOURSEMENT ANNUEL DU CCA",
                          style: pw.TextStyle(fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,

                      height: 20,
                      child: pw.Text("38.444 ",
                          style: pw.TextStyle(fontSize: 10))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,

                      height: 20,
                      child: pw.Text(" DUREE REMBOURCSEMENT (ANNEES)",
                          style: pw.TextStyle(fontSize: 10))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,

                      width: 700,
                      height: 20,
                      child: pw.Text("38.444 ",
                          style: pw.TextStyle(
                            fontSize: 10,
                          )))
                ]),
              ]),
        ),
        pw.SizedBox(height: 20),
        pw.Container(
          color: PdfColors.grey,
          child: pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.2),
                1: pw.FractionColumnWidth(0.2)
              },
              // defaultColumnWidth: FixedColumnWidth(18.0),
              border: pw.TableBorder(
                  left: pw.BorderSide(color: PdfColors.black, width: 1),
                  right: pw.BorderSide(color: PdfColors.black, width: 1),
                  top: pw.BorderSide(color: PdfColors.black, width: 1)),
              children: [
                // for (int i = 0; i < dA.length; i++)

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,

                      width: 700,
                      height: 20,
                      child: pw.Text(
                          "RECAPITULATIF DES FRAIS JUSQUE REMBOURSEMENT DU PRÊT",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontSize: 13))),
                ]),
              ]),
        ),
        pw.Container(
          color: PdfColors.grey,
          child: pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.2),
                1: pw.FractionColumnWidth(0.2)
              },
              // defaultColumnWidth: FixedColumnWidth(18.0),
              border: pw.TableBorder.symmetric(
                  outside: pw.BorderSide(width: 2, color: PdfColors.black)),
              children: [
                // for (int i = 0; i < dA.length; i++)

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child:
                          pw.Text("NOTAIRE", style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,
                      height: 20,
                      child: pw.Text(" 36.483",
                          style: pw.TextStyle(fontSize: 8.0))),
                  pw.Container(
                      height: 20,
                      child: pw.Text("Remboursés in fine au vendeur",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,

                      // width: 300,
                      height: 20,
                      child: pw.Text(" 0", style: pw.TextStyle(fontSize: 8.0))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text("svasm pevoyance :Architecture ",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,
                      height: 20,
                      child: pw.Text("36.483 \ ",
                          style: pw.TextStyle(fontSize: 8.0))),
                  pw.Container(
                      width: 100,
                      height: 20,
                      child: pw.Text("Remboursés in fine au vendeur",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      // width: 300,
                      height: 20,
                      child: pw.Text(" 0", style: pw.TextStyle(fontSize: 8.0))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text(
                          "SVASM GESTION :Frais de gestion de la SCI ",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,
                      height: 20,
                      child: pw.Text(" 36.483 \ ",
                          style: pw.TextStyle(fontSize: 8.0))),
                  pw.Container(
                      width: 100,
                      height: 20,
                      child: pw.Text("A la charge de la SCI",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      // width: 300,
                      height: 20,
                      child:
                          pw.Text(" 0\ ", style: pw.TextStyle(fontSize: 8.0))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text(
                          "BANQUE : Intéret d'emprunt & Assurence crédit",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(

                      // width: 300,
                      height: 20,
                      child: pw.Text(" 36.483 \ ",
                          style: pw.TextStyle(fontSize: 8.0))),
                  pw.Container(
                      width: 100,
                      height: 20,
                      child: pw.Text("A la charge de la SCI",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      // width: 300,
                      height: 20,
                      child:
                          pw.Text(" 0\ ", style: pw.TextStyle(fontSize: 8.0))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text("FISC : Impot sur les sociétés",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(

                      // width: 300,
                      height: 20,
                      child: pw.Text(" 36.483 \ ",
                          style: pw.TextStyle(fontSize: 8.0))),
                  pw.Container(
                      width: 100,
                      height: 20,
                      child: pw.Text("A la charge de la SCI",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      // width: 300,
                      height: 20,
                      child:
                          pw.Text(" 0\ ", style: pw.TextStyle(fontSize: 8.0))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child:
                          pw.Text("Total", style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text("", style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text("", style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,

                      // width: 300,
                      height: 20,
                      child: pw.Text(" 36.483 \ ",
                          style: pw.TextStyle(fontSize: 8.0))),
                ]),

                //--------
              ]),
        )
        /////////
      ],
    );
  }

  pw.Column data3() {
    return pw.Column(
      children: [
/////////

        pw.SizedBox(height: 20),
        pw.Container(
          color: PdfColors.grey,
          child: pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.2),
                1: pw.FractionColumnWidth(0.2)
              },
              // defaultColumnWidth: FixedColumnWidth(18.0),
              border: pw.TableBorder(
                  left: pw.BorderSide(color: PdfColors.black, width: 1),
                  right: pw.BorderSide(color: PdfColors.black, width: 1),
                  top: pw.BorderSide(color: PdfColors.black, width: 1)),
              children: [
                // for (int i = 0; i < dA.length; i++)

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.center,
                      // width: 300,

                      width: 700,
                      height: 20,
                      child: pw.Text("TABLEAU DE BORD",
                          style: pw.TextStyle(
                              // decoration: pw.TextDecoration.underline,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 13))),
                ]),
              ]),
        ),
        pw.Container(
          color: PdfColors.grey,
          child: pw.Table(
              columnWidths: {
                0: pw.FractionColumnWidth(0.2),
                1: pw.FractionColumnWidth(0.2)
              },
              // defaultColumnWidth: FixedColumnWidth(18.0),
              border: pw.TableBorder.symmetric(
                  outside: pw.BorderSide(width: 2, color: PdfColors.black)),
              children: [
                // for (int i = 0; i < dA.length; i++)

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,

                      height: 20,
                      child: pw.Text(" CREDIT IMMOBILIER DISPONIBLE IN LIMINE ",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.center,
                      height: 20,
                      child: pw.Text(": ",
                          style: pw.TextStyle(
                              fontSize: 8, fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier[
                                  'CREDIT_IMMOBILIER_DISPONIBLE_IN_LIMINE']
                              .toString(),
                          style: pw.TextStyle(
                              fontSize: 8.0, fontWeight: pw.FontWeight.bold))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text(
                          " REMBOURSEMENT DU COMPTE COURANT  IN FINE ",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.center,
                      height: 20,
                      child: pw.Text(": ",
                          style: pw.TextStyle(
                              fontSize: 8, fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier[
                                  'remboursement_in_fine_du_compte_courant']
                              .toString(),
                          style: pw.TextStyle(
                              fontSize: 8, fontWeight: pw.FontWeight.bold))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text(
                          "CHARGE MENSUELLE PENDANT LA DUREE DU CREDIT ",
                          style: pw.TextStyle(
                              decoration: pw.TextDecoration.underline,
                              fontSize: 8,
                              fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.center,
                      height: 20,
                      child: pw.Text(": ",
                          style: pw.TextStyle(
                              fontSize: 8, fontWeight: pw.FontWeight.bold))),
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      // width: 300,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier[
                                  'CHARGE_MENSUELLE_PENDANT_LA_DUREE_DU_CREDIT']
                              .toString(),
                          style: pw.TextStyle(
                              fontSize: 8, fontWeight: pw.FontWeight.bold))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      height: 20,
                      child: pw.Text(
                          "Crédit immobilier (pour rappel : à la charge de la SCI) : ",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,

                      // width: 300,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier['Credit_immobilier_de_la_SCI)']
                              .toString(),
                          style: pw.TextStyle(fontSize: 8.0))),
                ]),

                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      height: 20,
                      child: pw.Text("Appel de trésorerie de la SCI : ",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      // width: 300,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier['Appel_de_tresorerie_de_la_SCI']
                              .toString(),
                          style: pw.TextStyle(fontSize: 8.0))),
                ]),
                pw.TableRow(children: [
                  pw.Container(
                      alignment: pw.Alignment.centerRight,
                      height: 20,
                      child: pw.Text("Loyer initial payé à la SCI : ",
                          style: pw.TextStyle(fontSize: 8))),
                  pw.Container(
                      alignment: pw.Alignment.centerLeft,
                      height: 20,
                      child: pw.Text(
                          widget.dataDossier['Loyer_initial_paye_à_la_SCI']
                              .toString(),
                          style: pw.TextStyle(fontSize: 8))),
                ]),

                // pw.TableRow(children: [
                //   pw.Container(
                //       alignment: pw.Alignment.centerLeft,
                //       // width: 300,

                //       height: 20,
                //       child: pw.Text(
                //           " CHARGE MENSUELLE APRES REMBOURSEMENT DU CREDIT DU CREDIT ",
                //           style: pw.TextStyle(
                //               decoration: pw.TextDecoration.underline,
                //               fontSize: 8,
                //               fontWeight: pw.FontWeight.bold))),
                //   pw.Container(
                //       alignment: pw.Alignment.center,
                //       height: 20,
                //       child: pw.Text(": ",
                //           style: pw.TextStyle(
                //               fontSize: 8, fontWeight: pw.FontWeight.bold))),
                //   pw.Container(
                //       alignment: pw.Alignment.centerRight,
                //       // width: 300,
                //       height: 20,
                //       child: pw.Text(
                //           widget.dataDossier[
                //                   'CHARGE_MENSUELLE_APRES_REMBOURSEMENT_DU_CREDIT_DU_CREDIT']
                //               .toString(),
                //           style: pw.TextStyle(
                //               fontSize: 8.0, fontWeight: pw.FontWeight.bold))),
                // ]),

                // pw.TableRow(children: [
                //   pw.Container(
                //       alignment: pw.Alignment.centerRight,
                //       height: 20,
                //       child: pw.Text("Loyer révisé (pour rappel) : ",
                //           style: pw.TextStyle(fontSize: 8))),
                //   pw.Container(
                //       alignment: pw.Alignment.centerLeft,

                //       // width: 300,
                //       height: 20,
                //       child: pw.Text(
                //           widget.dataDossier['Loyer_revis'].toString(),
                //           style: pw.TextStyle(fontSize: 8.0))),
                // ]),

                // pw.TableRow(children: [
                //   pw.Container(
                //       alignment: pw.Alignment.centerRight,
                //       height: 20,
                //       child: pw.Text("Appel de trésorerie (SCI) : ",
                //           style: pw.TextStyle(fontSize: 8))),
                //   pw.Container(
                //       alignment: pw.Alignment.centerLeft,
                //       // width: 300,
                //       height: 20,
                //       child: pw.Text('0', style: pw.TextStyle(fontSize: 8.0))),
                // ]),
                // pw.TableRow(children: [
                //   pw.Container(
                //       alignment: pw.Alignment.centerRight,
                //       height: 20,
                //       child: pw.Text("Remboursement du compte courant : ",
                //           style: pw.TextStyle(fontSize: 8))),
                //   pw.Container(
                //       alignment: pw.Alignment.centerLeft,
                //       height: 20,
                //       child: pw.Text(
                //           widget.dataDossier['REMBOURSEMENT_DU_COMPTE_COURANT']
                //               .toString(),
                //           style: pw.TextStyle(fontSize: 8))),
                // ]),

                // //--------
              ]),
        )
        /////////
      ],
    );
  }

  printPDF() async {
    await _generatePdf(format, "Sevendre").whenComplete(() async {
      saveAndLaunchFile(await pdf.save(), 'sevendre.pdf')
          .whenComplete(() => Navigator.pushNamed(context, '/TableauDeBoard'));
    });
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final font = await PdfGoogleFonts.latoBold();

    pdf.addPage(
      
        pw.Page(
          pageFormat: format,
          margin: pw.EdgeInsets.all(5),
          build: (context) {
            return pw.Center(
                child: pw.Column(children: [
              pw.Center(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    children: [
                      pw.Center(
                        child: pw.Container(
                          padding: pw.EdgeInsets.all(10),
                          decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  bottom: pw.BorderSide(width: 1),
                                  top: pw.BorderSide(width: 1),
                                  left: pw.BorderSide(width: 1),
                                  right: pw.BorderSide(width: 1))),
                          child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.Text('VASM / SCI LAZARRA',
                                  style: pw.TextStyle(

                                    font: font,
                                    fontSize: 20,
                                    fontWeight: pw.FontWeight.bold,
                                  )),
                              pw.Text('Tableau de bord financier prévisionnel'),
                            ],
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 30),
                      pw.Container(
                        alignment: pw.Alignment.center,
                        decoration: pw.BoxDecoration(
                            border: pw.Border(
                                bottom: pw.BorderSide(
                                  width: 1,
                                  color: PdfColors.black,
                                ),
                                top: pw.BorderSide(
                                  width: 1,
                                  color: PdfColors.black,
                                ),
                                left: pw.BorderSide(
                                  width: 1,
                                  color: PdfColors.black,
                                ),
                                right: pw.BorderSide(
                                  width: 1,
                                  color: PdfColors.black,
                                ))),
                        child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.SizedBox(height: 15),
                            pw.Center(
                              child: pw.Container(
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text('VALEUR VENALE DU BIEN : ',
                                        style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.bold,
                                        )),
                                    pw.Text(
                                        widget.dataDossier[
                                                'valeur_du_bien_estimee_par_le_client']
                                            .toString(),
                                        style: pw.TextStyle(
                                          color: PdfColors.red,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            pw.Center(
                              child: pw.Container(
                                decoration: pw.BoxDecoration(),
                                child: pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.center,
                                  children: [
                                    pw.Text('CREDIT IMMOBILER     : ',
                                        style: pw.TextStyle(
                                          fontSize: 12,
                                          fontWeight: pw.FontWeight.bold,
                                        )),
                                    pw.Text(
                                        widget.dataDossier[
                                                'montant_du_credit_bancaire_demande']
                                            .toString(),
                                        style: pw.TextStyle(
                                          color: PdfColors.red,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            pw.SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ]),
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                // color: PdfColors.grey,
                child: pw.Table(
                    columnWidths: {
                      0: pw.FractionColumnWidth(0.35),
                      1: pw.FractionColumnWidth(0.35),
                      2: pw.FractionColumnWidth(0.3),
                      3: pw.FractionColumnWidth(0.1)
                    },
                    // defaultColumnWidth: FixedColumnWidth(18.0),
                    border: pw.TableBorder.symmetric(
                        outside:
                            pw.BorderSide(width: 2, color: PdfColors.black)),
                    children: [
                      // for (int i = 0; i < dA.length; i++)

                      pw.TableRow(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,

                            width: 700,
                            height: 20,
                            child: pw.Text("HYPOTHESES",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    decoration: pw.TextDecoration.underline,
                                    fontSize: 9))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,
                            height: 20,
                            child: pw.Text(" ",
                                style: pw.TextStyle(fontSize: 8.0))),
                        pw.Container(
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,
                            padding: pw.EdgeInsets.all(8),
                            width: 700,
                            height: 20,
                            child: pw.Text("REVISIONS ANNUELLES",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    decoration: pw.TextDecoration.underline,
                                    fontSize: 9))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,

                            // width: 300,
                            height: 20,
                            child: pw.Text(" ",
                                style: pw.TextStyle(
                                    fontSize: 11.0, color: PdfColors.red))),
                      ]),
                      pw.TableRow(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            height: 20,
                            child: pw.Text("Type de prêt",
                                style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,
                            height: 20,
                            child: pw.Text("Prêt immobilier à taux fixe",
                                style: pw.TextStyle(fontSize: 8.0))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            height: 20,
                            child: pw.Text("Loyers",
                                style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerRight,

                            // width: 300,
                            height: 20,
                            child: pw.Text(
                                widget.dataDossier['inflationloyerAnnuel'],
                                style: pw.TextStyle(
                                    fontSize: 8.0, color: PdfColors.red))),
                      ]),
                      pw.TableRow(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            height: 20,
                            child: pw.Text("Montant du prêt ",
                                style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,
                            height: 20,
                            child: pw.Text(
                                widget.dataDossier[
                                    'montant_du_credit_bancaire_demande'],
                                style: pw.TextStyle(fontSize: 8.0))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            width: 100,
                            height: 20,
                            child: pw.Text("Taxe foncière",
                                style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),

                            // width: 300,
                            alignment: pw.Alignment.centerRight,
                            height: 20,
                            child: pw.Text(
                                widget.dataDossier['inflationTaxFoncier'],
                                style: pw.TextStyle(
                                    fontSize: 8.0, color: PdfColors.red))),
                      ]),
                      pw.TableRow(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            height: 20,
                            child: pw.Text("TEG",
                                style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            // width: 300,
                            height: 20,
                            child: pw.Text(
                                widget.dataDossier['Taux_interet_Moyen_en_%']
                                    .toString(),
                                style: pw.TextStyle(
                                  fontSize: 8.0,
                                ))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            width: 100,
                            height: 20,
                            child:
                                pw.Text("Entretien & autres charges diverses",
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                    ))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),

                            // width: 300,
                            alignment: pw.Alignment.centerRight,
                            height: 20,
                            child: pw.Text(widget.dataDossier['inflationAutre'],
                                style: pw.TextStyle(
                                    fontSize: 8.0, color: PdfColors.red))),
                      ]),

                      pw.TableRow(children: [
                        pw.Container(
                            padding: pw.EdgeInsets.all(2),
                            alignment: pw.Alignment.centerLeft,
                            height: 20,
                            child: pw.Text("Grosses réparations prévisibles",
                                style: pw.TextStyle(fontSize: 6))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(2),

                            // width: 300,
                            height: 20,
                            child: pw.Text(
                                "  A RENSEIGNER SELON LES DECLARATIONS DU CLIENT",
                                style: pw.TextStyle(fontSize: 5.0))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),
                            alignment: pw.Alignment.centerLeft,
                            height: 20,
                            child:
                                pw.Text("", style: pw.TextStyle(fontSize: 8))),
                        pw.Container(
                            padding: pw.EdgeInsets.all(8),

                            // width: 300,
                            height: 20,
                            child: pw.Text("",
                                style: pw.TextStyle(fontSize: 6.0))),
                      ]),

                      //--------
                    ]),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                // defaultColumnWidth: FixedColumnWidth(18.0),
                border: pw.TableBorder.all(
                    color: PdfColors.black,
                    style: pw.BorderStyle.solid,
                    width: 2),
                children: [
                  pw.TableRow(children: [
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Liquidités dégagées',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                            'Remboursement in fine du compte courant',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Appels mensuels au compte courant',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text(
                            'Durée du remboursement IN FINE du compte courant (en année)',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Intérêt du crédit',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Frais notaire',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Impôts sur les sociétés',
                            style: pw.TextStyle(fontSize: 8.0))),
                    pw.Container(
                        alignment: pw.Alignment.center,
                        width: 300,
                        padding: pw.EdgeInsets.all(5),
                        child: pw.Text('Honoraire se vendre à soi-même',
                            style: pw.TextStyle(fontSize: 8.0))),
                  ]),
                  pw.TableRow(children: [
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier["liquidites_degagees"],
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier[
                                      "remboursem_infirne_compte_courant"]
                                  .toString(),
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier[
                                  "Appel_de_tresorerie_de_la_SCI"]
                                  .toString(),
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier[
                                  "duree_du_remboursement_in_fine_du_compte_courant_(en annee)"],
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier['interet_demprins_cumul']
                                  .toString(),
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(widget.dataDossier["frais_de_notaire"],
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier["impot_sur_les_societes"],
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                    pw.Column(children: [
                      pw.Container(
                          padding: pw.EdgeInsets.all(5),
                          child: pw.Text(
                              widget.dataDossier[
                                  "Honoraire_se_vendre_a_asoi-meme"],
                              style: pw.TextStyle(fontSize: 8.0)))
                    ]),
                  ]),
                ],
              ),
              pw.SizedBox(height: 20),
              data3()
            ]));
          },
        ),
        index: 0);

    for (int j = 0;
        j < int.parse(widget.dataDossier["duree_de_remboursement"]) + 3 ?? 1;
        j++) {
      if (j == 0) {

        pdf.addPage(
            pw.Page(
              margin: pw.EdgeInsets.all(5),
              pageFormat: format,
              build: (context) {
                return pw.Center(
                    child: pw.Column(
                  children: [
                    pw.Column(
                      children: [
                        dataReccete(
                            0,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    8
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 8),
                        pw.SizedBox(height: 20),
                        dataDepense(
                            0,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    8
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 8),
                        pw.SizedBox(height: 20),
                      ],
                    ),
                  ],
                ));
              },
            ),
            index: 1);
      }
      if (j == 8) {
        pdf.addPage(
            pw.Page(
              margin: pw.EdgeInsets.all(5),
              pageFormat: format,
              build: (context) {
                return pw.Center(
                    child: pw.Column(
                  children: [
                    pw.Column(
                      children: [
                        dataReccete(
                            8,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    13
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 13),
                        pw.SizedBox(height: 20),
                        dataDepense(
                            8,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    13
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 13),
                        pw.SizedBox(height: 20),
                      ],
                    ),
                  ],
                ));
              },
            ),
            index: 2);
      }

      if (j == 13) {
        pdf.addPage(
            pw.Page(
                margin: pw.EdgeInsets.all(5),
                pageFormat: format,
                build: (context) {
                  return pw.Center(
                      child: pw.Column(
                    children: [
                      pw.Column(
                        children: [
                          dataReccete(
                              13,
                              int.parse(widget.dataDossier[
                                              "duree_de_remboursement"]) +
                                          3 <=
                                      18
                                  ? int.parse(widget.dataDossier[
                                          "duree_de_remboursement"]) +
                                      3
                                  : 18),
                          pw.SizedBox(height: 20),
                          dataDepense(
                              13,
                              int.parse(widget.dataDossier[
                                              "duree_de_remboursement"]) +
                                          3 <=
                                      18
                                  ? int.parse(widget.dataDossier[
                                          "duree_de_remboursement"]) +
                                      3
                                  : 18),
                          pw.SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ));
                }),
            index: 3);
      }
      if (j == 18) {
        pdf.addPage(
            pw.Page(
                margin: pw.EdgeInsets.all(5),
                pageFormat: format,
                build: (context) {
                  return pw.Center(
                      child: pw.Column(
                    children: [
                      pw.Column(
                        children: [
                          dataReccete(
                              18,
                              int.parse(widget.dataDossier[
                                              "duree_de_remboursement"]) +
                                          3 <=
                                      23
                                  ? int.parse(widget.dataDossier[
                                          "duree_de_remboursement"]) +
                                      3
                                  : 23),
                          pw.SizedBox(height: 20),
                          dataDepense(
                              18,
                              int.parse(widget.dataDossier[
                                              "duree_de_remboursement"]) +
                                          3 <=
                                      23
                                  ? int.parse(widget.dataDossier[
                                          "duree_de_remboursement"]) +
                                      3
                                  : 23),
                          pw.SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ));
                }),
            index: 4);
      }

      if (j == 23) {
        pdf.addPage(
            pw.Page(
              margin: pw.EdgeInsets.all(5),
              pageFormat: format,
              build: (context) {
                return pw.Center(
                    child: pw.Column(
                  children: [
                    pw.Column(
                      children: [
                        dataReccete(
                            23,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    28
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 28),
                        pw.SizedBox(height: 20),
                        dataDepense(
                            23,
                            int.parse(widget.dataDossier[
                                            "duree_de_remboursement"]) +
                                        3 <=
                                    28
                                ? int.parse(widget.dataDossier[
                                        "duree_de_remboursement"]) +
                                    3
                                : 28),
                        pw.SizedBox(height: 20),
                      ],
                    ),
                  ],
                ));
              },
            ),
            index: 5);
      }
    }

    //  pdf.addPage(
    //     pw.Page(
    //       pageFormat: format,
    //       build: (context) {
    //         return pw.Center(child:

    //         ));}),index: int.parse(widget.dataDossier["duree_de_remboursement"]) ==5 ?1:int.parse(widget.dataDossier["duree_de_remboursement"]) ==10 ?2:int.parse(widget.dataDossier["duree_de_remboursement"]) ==15 ?3:int.parse(widget.dataDossier["duree_de_remboursement"]) ==20?4:int.parse(widget.dataDossier["duree_de_remboursement"]) ==25?5:1 );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);
    return Scaffold(body: Container()
        // PdfPreview(
        //   build: (format) => _generatePdf(format, "title"),
        // ),
        );
  }

  double mensualiteDucredit() {
    var montemDeCredit =
        double.parse(widget.dataDossier['montant_du_credit_bancaire_demande']) *
            double.parse(widget.dataDossier['Taux_interet_Moyen_en_']) *
            double.parse(widget.dataDossier['duree_de_remboursement']) *
            12;

    double capacipte_de_remboursement_mensuel = double.parse(
        widget.dataDossier["capacite_maximal_de_rembouresement_mensuel"]);

    double montant_du_credit =
        double.parse(widget.dataDossier["montant_du_credit_bancaire_demande"]);

    double dure_remboursement =
        double.parse(widget.dataDossier["duree_de_remboursement"]);

    double taux_interet_moyen =
        double.parse(widget.dataDossier["Taux_interet_Moyen_en_%"]);

    var mensualite_du_credi = ((montant_du_credit * montemDeCredit / 12)) / 1 -
        pow((1 + (montemDeCredit / 12)),
            -(12 * int.parse(dure_remboursement.toString())));
    return mensualite_du_credi;
  }
}
