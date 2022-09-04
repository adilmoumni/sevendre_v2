import 'dart:convert';

import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import 'Screens/WidgetHelper/TextFieldWidget2.dart';

class PageEx extends StatefulWidget {
  const PageEx({Key key, this.width, this.dropdownEditingController, this.onChanged}) : super(key: key);
  final double width;
  final DropdownEditingController<CodePostal> dropdownEditingController;
  final ValueChanged<CodePostal> onChanged;

  @override
  State<PageEx> createState() => _PageExState();
}

class _PageExState extends State<PageEx> {

  List<CodePostal> codePostal =[];
  bool isLoadingCodes = true;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCodePostal();
  }



  getCodePostal() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/code_postal.json");
    final jsonResult = await jsonDecode(data); //latest Dart

    // convert json to object
   for (var item in jsonResult) 
        codePostal.add(CodePostal(item['code_postal'], item['nom_de_la_commune']));

  setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                    padding: EdgeInsets.only (                      left: 30),
                    child: Text(
                      "Code postal du bien",
                      style: TextStyle(
                          fontFamily: "Neometric",
                          color: Color(0xFF57565e),
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
        Container(
                  width: widget.width ?? 500,
                  height: 40,
                  padding: EdgeInsets.only(left:20, right: 20),
                  child: DropdownFormField<CodePostal>(
                      controller: widget.dropdownEditingController,
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
                      onChanged:(dynamic val)=> widget.onChanged(val as CodePostal),
                      displayItemFn: (dynamic item ) {

                        String name;
                        // check if item selected
                        if (widget.dropdownEditingController != null)
                          name = widget.dropdownEditingController.value.codePostal +
                              ' - ' +
                               widget.dropdownEditingController.value.nameDeLaComune;
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
                          item.nameDeLaComune
                                  .toLowerCase()
                                  .indexOf(str.toLowerCase()) >=
                              0 ||
                          item.codePostal
                              .toString()
                              .toLowerCase()
                              .startsWith(str.toLowerCase()),
                      dropdownItemFn: (dynamic item, position, focused,
                          dynamic lastSelectedItem, onTap) {
                            bool isSelected = false;

                            if( widget.dropdownEditingController != null && widget.dropdownEditingController.value.codePostal == item.codePostal && widget.dropdownEditingController.value.nameDeLaComune == item.nameDeLaComune)
                            isSelected= true;

                        return ListTile(
                          title: Text(item.codePostal),
                          subtitle: Text(item.nameDeLaComune ?? ''),
                          tileColor: isSelected
                              ? Colors.grey 
                              : Colors.transparent,
                          onTap: onTap,
                        );
                      }),
                ),
      ],
    );
  }
}


class CodePostal {
  String nameDeLaComune;
  String  codePostal;

  CodePostal(this.codePostal, this.nameDeLaComune);
}