import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';

import 'package:plan_de_financement/backend/schema/clients_record.dart';
// import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../FormInformationClient.dart';
// import 'Tab.dart';

class DetailClientPapge extends StatefulWidget {
  final ClientsRecord agent;
  const DetailClientPapge({Key key, this.agent}) : super(key: key);

  @override
  _DetailClientPapgeState createState() => _DetailClientPapgeState();
}

class _DetailClientPapgeState extends State<DetailClientPapge> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // TabAgent(
        //   items: ["Information", "Tableau"],
        //   index: indexTab,
        //   onTapChange: (index) {
        //     setState(() {
        //       indexTab = index;
        //     });
        //   },
        // ),
        // FormInformationClient(),
      ]),
    );
  }
}
