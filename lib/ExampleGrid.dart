import 'dart:convert';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'Screens/WidgetHelper/TextFieldWidget2.dart';

class PageEx extends StatefulWidget {
  const PageEx({Key key, this.width}) : super(key: key);
  final double width;

  @override
  State<PageEx> createState() => _PageExState();
}

class _PageExState extends State<PageEx> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCodePostal();
  }

  List<dynamic> codePostal;
  bool isLoadingCodes = true;

  getCodePostal() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/code_postal.json");
    final jsonResult = jsonDecode(data); //latest Dart
    setState(() {
      codePostal = jsonResult;
      isLoadingCodes = true;

      print('================ codePostal[0]');
      print(codePostal[0]);

      dropdownEditingController = DropdownEditingController(
          value: "{nom_de_la_commune: VILLE DU PONT, code_postal: 25650}");
    });
  }

  DropdownEditingController dropdownEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              onPressed: (){
                  print(dropdownEditingController.value.toString());
                  setState(() {
                  dropdownEditingController.value = "{nom_de_la_commune: VILLERS GRELOT, code_postal: 25640}";  
                  });
                  
              },
              icon: Icon(Icons.ac_unit_outlined),
              

            ),
            Container(
              width: widget.width ?? 500,
              height: 40,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: DropdownFormField<dynamic>(
                  controller: dropdownEditingController,
                  onEmptyActionPressed: null,
                  emptyText: isLoadingCodes
                      ? 'En attente de données...'
                      : 'Aucune correspondance trouvée !',
                  emptyActionText: null,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.7),
                          borderSide: new BorderSide(width: 1.0)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Color(0xFFe0d4e4))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe0d4e4))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFe0d4e4))),
                      labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(153, 153, 153, 1))), 
                  onSaved: (dynamic str) {},
                  onChanged: (dynamic str) {
                    print('================== str');
                    print(str);
                    return str;
                  },
                  displayItemFn: (dynamic item) {
                    String name;
                    // check if item selected
                    if (item != null)
                      name = item['code_postal'] +
                          ' - ' +
                          item['nom_de_la_commune'];
                    // return text with name
                    return Container(
                      child: Text(
                        name ?? '',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                  findFn: (dynamic str) async => codePostal,
                  filterFn: (dynamic item, str) =>
                      item['nom_de_la_commune']
                              .toLowerCase()
                              .indexOf(str.toLowerCase()) >=
                          0 ||
                      item['code_postal']
                          .toString()
                          .toLowerCase()
                          .startsWith(str.toLowerCase()),
                  dropdownItemFn: (dynamic item, position, focused,
                      dynamic lastSelectedItem, onTap) {
                    return ListTile(
                      title: Text(item['code_postal']),
                      subtitle: Text(item['nom_de_la_commune'] ?? ''),
                      tileColor: focused
                          ? Color.fromARGB(20, 0, 0, 0)
                          : Colors.transparent,
                      onTap: onTap,
                    );
                  }),
            ),

            TextFieldHelper2()

          ],
        ),
      ),
    );
  }
}


class CodePostal {
  String nameDeLaComune;
  String  codePostal;

  CodePostal(this.codePostal, this.nameDeLaComune);
}