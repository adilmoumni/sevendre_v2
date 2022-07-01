import 'dart:convert';
import 'dart:html';

import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/Dossiers/Create/FormsScreen.dart';
import 'package:plan_de_financement/Screens/Dossiers/Get/ListDesDossiersScreen.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/CardDachboardWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/TextFieldWidget2.dart';

import 'package:plan_de_financement/backend/backend.dart';
import 'package:plan_de_financement/backend/schema/clients_record.dart';

import 'package:intl/intl.dart';
import 'package:plan_de_financement/backend/schema/dossier_record.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../FormInformationClient.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';

//Local imports

class ListDesClient2 extends StatefulWidget {
  final bool showTitle;
  final Query<Object> Function(Query<Object>) queryBuilder;
  const ListDesClient2({Key key, this.queryBuilder, this.showTitle = false})
      : super(key: key);

  @override
  State<ListDesClient2> createState() => _CleintsPageState();
}

List<ClientsRecord> dataView = [];

class _CleintsPageState extends State<ListDesClient2> {
  List<ClientsRecord> __rows = <ClientsRecord>[];
  List<ClientsRecord> usersFiltered = <ClientsRecord>[];
  TextEditingController textController = TextEditingController();
  void _sortColumn(int columnIndex, bool _) {
    setState(() {
      if (__rows.length >= 0) {
        _currentSortColumn = columnIndex;
        if (_isAscending == true) {
          _isAscending = false;
        } else {
          _isAscending = true;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      dataView = __rows.where((element) {
        return element.firstName
            .toLowerCase()
            .contains(textController.text.toLowerCase());
      }).toList();
      setState(() {});
    });

  }


  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  final List<ChartData> chartData = [
    ChartData('USA', 10, '70%'),
    ChartData('China', 11, '60%'),
    ChartData('Russia', 9, '52%'),
    ChartData('Germany', 10, '40%')
  ];


  int _currentSortColumn = 1;
  bool _isAscending = true;
  String recherche = "";

 


  @override
  Widget build(BuildContext context) {
      var checkWidth = (MediaQuery.of(context).size.width <= 420);

    return ChangeNotifierProvider(
      create: (context) => ProviderSM(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: widget.showTitle ? Colors.transparent : Color(0xFFFBFBFB),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width >= 1024)
                      ? MediaQuery.of(context).size.width
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Container(
                          //     child: SfCircularChart(series: <CircularSeries>[
                          //   PieSeries<ChartData, String>(
                          //     dataSource: chartData,
                          //     xValueMapper: (ChartData data, _) => data.x,
                          //     yValueMapper: (ChartData data, _) => data.y,
                          //     // Radius of pie
                          //     // pointRadiusMapper: (ChartData data, _) =>
                          //     //     data.size,
                          //     dataLabelSettings: DataLabelSettings(
                          //       isVisible: true,
                          //       showZeroValue: true,
                          //       showCumulativeValues: true,
                          //     ),
                          //     radius: '50%',
                          //     enableTooltip: true,
                          //   ),
                          //   // RadialBarSeries(
                          //   //    xValueMapper: (ChartData data, _) => data.x,
                          //   // yValueMapper: (ChartData data, _) => data.y,

                          //   // )
                          // ])),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  TextFieldHelper2(
                                    isText: true,
                                    width: 300,
                                    // controller: prenomController,
                                    labelField: "Rechercher",
                                    // hintText: "Rechercher",
                                    labelText: "",
                                    helperText: "Entrer une valeur ",
                                    // validator: model.validatorTextFieldString,
                                    onChanged: (val) {
                                      setState(() {
                                        recherche = val;

                                        dataView = __rows
                                            .where((user) =>
                                                user.firstName.contains("Jean"))
                                            .toList();
                                      });
                                    },
                                  ),
                                  Icon(Icons.search)
                                ],
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // runAlignment : WrapAlignment.end,
                              // alignment: WrapAlignment.end,
                              children: [
                                 StreamBuilder<List<DossierRecord>>(
                                             stream: queryDossierRecord( queryBuilder: widget.queryBuilder),
                                    builder: (context,
                                        AsyncSnapshot<dynamic> snapshot) {

                                              if (!snapshot.hasData)
                                      return CircularProgressIndicator();
                                      return Center(
                                        child: CardDashboardWidget(
                                          color: Color(0xFF9abbc3),
                                          text: "dossiers signés",
                                          number: snapshot.data.where((element) => element.status == 'sign').length.toString(),
                                          icon: Icons.folder,
                                        ),
                                      );
                                    }),
                                //  StreamBuilder<List<DossierRecord>>(
                                //       stream: queryDossierRecord( queryBuilder: widget.queryBuilder),
                                //     builder: (context,
                                //         AsyncSnapshot<dynamic> snapshot) {
                                //       return CardDashboardWidget(
                                //         color: Color(0xFF5e9793),
                                //         text: "non signés",
                                //         number:
                                //          snapshot.data
                                //             .where((element) =>
                                //                 element.status == 'noSign')
                                //             .length
                                //             .toString()
                                //             ,

                                //         icon: Icons.folder,
                                //       );
                                //     }),
                                StreamBuilder<List<ClientsRecord>>(
                                    stream: queryClientsRecord(
                                        queryBuilder: widget.queryBuilder),
                                    builder: (context, snapshot) {
                                      return CardDashboardWidget(
                                        text: "Total client",
                                        number: snapshot.hasData
                                            ? snapshot.data.length.toString()
                                            : snapshot.hasError ||
                                                    !snapshot.hasData
                                                ? ""
                                                : "",
                                      );
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    height: 80,
                    child: Card(
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText("Table des clients",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF06464b),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_circle_sharp,
                                    color: Color(0xFF06464b),
                                    // size:25
                                  ),
                                )
                              ],
                            ),
                            checkWidth 
                            ? InkWell(
                                onTap: () {
                                Navigator.pushNamed(context, '/client/add');

                                // _createPDF();
                              },
                              child: Container(
                                child: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                              ),
                            )
                           : ButtonWidgetHelper(
                              width:  130,
                              height: 40,
                              textButton:"Ajouter",
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/client/add');

                                // _createPDF();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                StreamBuilder<List<ClientsRecord>>(
                    stream:
                        queryClientsRecord(queryBuilder: widget.queryBuilder),
                    builder: (context, snapshotMusic) {
                      if (!snapshotMusic.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshotMusic.data.isEmpty)
                        return Center(
                            child: Text("Aucun Agent n'est disponible",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30)));

                      // if (__rows.length != snapshotMusic.data.length ||
                      //     __rows.length == 0) {

                      // }
                      __rows = snapshotMusic.data;
                      // _currentSortColumn = columnIndex;
                      if (_isAscending == false) {
                        __rows.sort((cellA, cellB) =>
                            cellB.firstName.compareTo(cellA.firstName));
                      } else {
                        __rows.sort((cellB, cellA) =>
                            cellB.firstName.compareTo(cellA.firstName));
                      }

                      if (textController.text.isEmpty)
                        dataView = __rows
                            .where((user) =>
                                (user.firstName + " " + user.lastName)
                                    .contains(recherche) ||
                                user.lastName.contains(recherche) ||
                                user.email.contains(recherche) ||
                                user.status.contains(recherche))
                            .toList();

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        // padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(00),
                            children: [
                              Theme(
                                data: Theme.of(context).copyWith(
                                  cardColor: Colors.white,
                                  dividerColor: Color(0xFFE9E9EC),
                                  bottomAppBarColor: Colors.blueGrey,
                                ),
                                child: PaginatedDataTable(
                                  initialFirstRowIndex: 0,
                                  sortAscending: _isAscending,
                                  sortColumnIndex: _currentSortColumn,
                                  rowsPerPage: 5,
                                  // showFirstLastButtons: false,
                                  showCheckboxColumn: false,
                                  availableRowsPerPage: [10, 100, 200],
                                  columns: [
                     
                                    DataColumn(
                                      label: const Text('Nom',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF5C5C70),
                                              fontWeight: FontWeight.w500)),
                                      onSort: (ci, sa) => _sortColumn(ci, sa),
                                    ),
                                    DataColumn(
                                      label: const Text('Prénom',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF5C5C70),
                                              fontWeight: FontWeight.w500)),
                                      onSort: (ci, sa) => _sortColumn(ci, sa),
                                    ),
                                    const DataColumn(
                                        label: Text('Email',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF5C5C70),
                                                fontWeight: FontWeight.w500))),
                                    const DataColumn(
                                        label: Text('Téléphone',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF5C5C70),
                                                fontWeight: FontWeight.w500))),
                                    const DataColumn(
                                        label: Text('Date création',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF5C5C70),
                                                fontWeight: FontWeight.w500))),



                                      
                                  const DataColumn(
                                  label: Text('Total Dossier',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF5C5C70),
                                          fontWeight: FontWeight.w500))),
                                  
                                    const DataColumn(
                                        label: Text('',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF5C5C70),
                                                fontWeight: FontWeight.w500))),
                                  ],
                                  source: _DataSource(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * .70,
                          height: 1,
                          color: Colors.grey[300]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Sevendre ©",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF06464b),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = dataView;
  }

  final BuildContext context;
  List<ClientsRecord> _rows;
  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      // selected: row.selected,
      onSelectChanged: (value) {
        // // Go to Edit or Details of this object
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return DetailAgenPage(agent: row);
        // }));
      },
      cells: [
        // DataCell(SelectableText(row.reference.id,
        //     style: TextStyle(color: Color(0xFF5C5C70)))),

        DataCell(
          Row(
            children: [
              Text(row.firstName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF262641))),
            ],
          ),
        ),

        DataCell(
          Row(
            children: [
              Text(row.lastName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF262641))),
            ],
          ),
        ),
        DataCell(Text(row.email, style: TextStyle(color: Color(0xFF5C5C70)))),
        DataCell(
            Text(row.telephone, style: TextStyle(color: Color(0xFF5C5C70)))),

        // DataCell(
        //   Chip(
        //     backgroundColor: Color(0xFFF7F6FA),
        //     avatar: CircleAvatar(
        //         backgroundColor:
        //             row.status == "sign" ? Colors.green : Colors.orange,
        //         radius: 5),
        //     label: Text(row.status == "sign" ? "Signe" : "Non signe",
        //         style: TextStyle(
        //             color: Color(0xFF9393A0),
        //             fontSize: 12,
        //             fontWeight: FontWeight.bold)),
        //   ),
        // ),

        // DataCell(Text("1 mois", style: TextStyle(color: Color(0xFF5C5C70)))),
        DataCell(
          Text(DateFormat('yyyy-MM-dd hh:mm').format(row.createdTime),
              style: TextStyle(color: Color(0xFF5C5C70))),
        ),

          DataCell(StreamBuilder<List<DossierRecord>>(
                  stream: queryDossierRecord(
                      queryBuilder: (query) =>
                          query.where("uidClient", isEqualTo: row.reference.id)),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return Text(snapshot.data.length.toString(),
                        style: TextStyle(
                            color: Color(0xFF5C5C70), fontWeight: FontWeight.w500));
                  })),



        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton<int>(

                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: (index) {
                  if (index == 1) {
                 Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StepperScreen(
                                      uidClient: row.reference.id,
                                      modifier:false,
                                       nombreCliet : row.firstName2.isNotEmpty ||row.firstName2.isNotEmpty ?2:1 ,
                                      // adresseClient:row.adresse,
                                    )));
                  } else if(index ==2)
                  {
           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListDesDossiers(
                                      uidClient: row.reference.id,
                                      nombreCliet : row.firstName2.isNotEmpty ||row.firstName2.isNotEmpty ?2:1 ,
                                      // adresseClient:row.adresse,
                                    )));
                  }
                  
                  else if (index == 3) {
               
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormInformationClient(
                                    uid: row.reference.id,
                                    nomClient: row.firstName,
                                    prenomClient: row.lastName,
                                    situationFamillialeClient:
                                        row.situatioFamiliale,
                                    phoneClient: row.telephone,
                                    emailClient: row.email,
                                    dateNaissanceClient: row.dateOfBirth,
                                    modifier: true,
                                    situationImmobillierClient:
                                        row.familySituation,
                                    statut: row.status,

                                    nomClient2: row.firstName2,
                                    prenomClient2: row.lastName2,
                                    situationFamillialeClient2:
                                        row.situatioFamiliale2,
                                    phoneClient2: row.telephone2,
                                    emailClient2: row.email2,
                                    dateNaissanceClient2: row.dateOfBirth2,

                                    situationImmobillierClient2:
                                        row.familySituation2,

                                    // adresseClient:row.adresse,
                                  )),
                        );
                  }
                },
                
                itemBuilder: (context) => [
                  PopupMenuItem(
                   
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Ajouter un dossier",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem( 
                    value: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.folder,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "les dossiers de client",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                  
                    value: 3,
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Modifier client",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                icon: Icon(Icons.more_vert_rounded, color: Color(0xFF9393A0)),
                offset: Offset(0, 40),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y, this.size);
  final String x;
  final double y;
  final String size;
}

