import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({Key key}) : super(key: key);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  List listPopMenu = [
    {"Icon": Icons.menu, "name": "Liste des clients"},
    {"Icon": Icons.account_circle_sharp, "name": "Profil"},
    {"Icon": Icons.logout, "name": "Déconnection"},
  ];

  // Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(10.0), // here the desired height
      child: AppBar(
        elevation: 0,
        // backgroundColor: Color(0xFF06464b),
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          child: SvgPicture.asset(
            "assets/images/Logo_Sevendre.svg",
            height: 30,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            offset: Offset(0, 50),
            child: Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
            ),
            

//---add onSelected to your PopupMenuButton
onSelected: (index) async {
              if (index == 2) {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
              }
    index == 0
                          ? window.location.href.contains("/clients")
                              ? {}
                              : Navigator.pushNamed(context, '/clients')
                          : index == 1
                              ?
                              // ignore: unnecessary_statements
                              Navigator.pushNamed(context, '/profile')
                              : index == 2
                          ? Navigator.pushNamed(context, '/Login')
                                  : {};
}, 
            itemBuilder: (context) {
              return List.generate(3, (index) {
                return PopupMenuItem(
                  value: index,
                  child: Row(
                    children: [
                      Icon(
                        listPopMenu[index]["Icon"],
                        color: Color(0xFF06464b),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("${listPopMenu[index]["name"]}"),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
