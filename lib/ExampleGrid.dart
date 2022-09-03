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

  getCodePostal() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/code_postal.json");
    final jsonResult = jsonDecode(data); //latest Dart
    setState(() {
      codePostal = jsonResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widget.width ?? 500,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: DropdownFormField<dynamic>(
                  onEmptyActionPressed: null,
                  emptyText: 'Aucune correspondance trouvée !',
                  emptyActionText: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  onSaved: (dynamic str) {},
                  onChanged: (dynamic str) {
                    print('================== str');
                    print(str);
                  },
                  displayItemFn: (dynamic item) {
                    String name;
                    // check if item selected
                    if (item != null)
                      name = item['code_postal'] +
                          ' - ' +
                          item['nom_de_la_commune'];
                    // return text with name
                    return Text(
                      name ?? '',
                      style: TextStyle(fontSize: 16),
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
