import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';

import 'package:plan_de_financement/Provider/Provider_StateManagemant.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DataListClient.dart';

class ListDesClient extends StatefulWidget {
  const ListDesClient({Key key}) : super(key: key);

  @override
  _ListDesClientState createState() => _ListDesClientState();
}

class _ListDesClientState extends State<ListDesClient> {

String idUser = "";
getidUser()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     
      setState(() {
          idUser = prefs.getString("uidUser");
      });
   
}

  @override
  void initState() {
    getidUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderSM(),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
          body: SingleChildScrollView(
            child: Column(children: [
              ListDesClient2(
                  queryBuilder: (query) => query.where( "UIDuser",
    isEqualTo: idUser)
                  ),
            ]),
          ),
        ));
  }
}
