import 'package:flutter/material.dart';
import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';
import 'package:plan_de_financement/Screens/Dossiers/Create/FormsScreen.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/CardDachboardWidget.dart';

import 'package:plan_de_financement/backend/backend.dart';
import 'package:plan_de_financement/backend/schema/clients_record.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListDesDossiers extends StatefulWidget {
  ListDesDossiers({Key key}) : super(key: key);

  @override
  State<ListDesDossiers> createState() => _ListDesDossiersState();
}

class _ListDesDossiersState extends State<ListDesDossiers> {
  saveIdDossier(String id) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('idDossier', id);

// Save an integer value to 'counter
  }

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<ProviderSM>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // TextFieldHelper2(
                  //   isText: true,
                  //   width: 300,
                  //   // controller: prenomController,
                  //   labelField: "Rechercher",
                  //   // hintText: "Rechercher",
                  //   labelText: "",
                  //   helperText: "Entrer une valeur ",
                  //   // validator: model.validatorTextFieldString,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       // recherche = val;

                  //       // dataView = __rows
                  //       //     .where((user) =>
                  //       //         user.firstName.contains("Jean"))
                  //       //     .toList();
                  //     });
                  //   },
                  // ),
                  SizedBox(width: 10),
                ],
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
                        Row(
                          children: [

                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/clients');
                              },
                              child: Container(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Table des clients",
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
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios_sharp),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    //                    <--- top side
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Les dossiers de client",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF06464b),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.folder,
                                      color: Color(0xFF06464b),
                                      // size:25
                                    ),
                                  )
                                ],
                              ),
                            ),
                             
                         
                          ],
                        ),
                        ButtonWidgetHelper(
                          width: 150,
                          height: 40,
                          textButton: "Ajouter ",
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 15,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/client/add');
                            // Navigator.pushNamed(context, '/folder/1');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("dossiers")
                                    .where("uidClient",
                                        isEqualTo: "Y5AO0ZhjQzEGeKJ08bz2")
                                    .snapshots(),
                                // queryClientsRecord(
                                //   // queryBuilder: widget.queryBuilder
                                //   ),
                                builder: (context,
                                    AsyncSnapshot<dynamic> snapshotMusic) {
                                  if (!snapshotMusic.hasData) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }

                                  // if (snapshotMusic.data.isEmpty)
                                  return SingleChildScrollView(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          for (int i = 0;
                                              i < snapshotMusic.data.docs.length;
                                              i++)
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 250,
                                                  child: CardDashboardWidget(                                              
                                                    color: Color(0xFF9abbc3),
                                                    text: i > 2
                                                        ? model.informationClient[
                                                                'assurence']
                                                            .toString()
                                                        : model.informationClient['assurence'],
                                                            // Timestamp.fromDate(convertedDateTime);
                                                    number: DateTime.fromMicrosecondsSinceEpoch(model.informationClient[
                                                            'created_at']).toString(),
                                                    icon: Icons.folder,
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: InkWell(
                                                      onTap: () {
                                                        var modification;
                                                        snapshotMusic.data.docs
                                                            .map((e) {
                                                          model.informationClient =
                                                              e.data();
                                                          modification = e.data();
                                                          print(model
                                                                  .informationClient[
                                                              "code_postal"]);
                                                          // value['docId'] = e.id;
                                                          saveIdDossier(e.id);
                                                          print(e.id);
                                                          return model
                                                              .informationClient;
                                                        }).toList();

                                                        // model.informationClient[
                                                        //       "assurence"] =
                                                        //   "2000";

                                                        // final DocumentSnapshot  ds = snapshotMusic.data.docs;
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => StepperScreen(
                                                           
                                                                    modification:
                                                                        modification,
                                                                    modifier: true
                                                                    // uidClient: row.reference.id,
                                                                    // adresseClient:row.adresse,
                                                                    )));
                                                      },
                                                      child: Icon(Icons.create,
                                                          color: Colors.white,
                                                          size: 18)),
                                                )
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
