import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/AppbarWidget.dart';
import 'package:plan_de_financement/Screens/WidgetHelper/ButtonWidgetHelper.dart';

class CommencerLaSumilation extends StatefulWidget {
  CommencerLaSumilation({Key key}) : super(key: key);

  @override
  State<CommencerLaSumilation> createState() => _CommencerLaSumilationState();
}

class _CommencerLaSumilationState extends State<CommencerLaSumilation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60), child: AppbarWidget()),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: ButtonWidgetHelper(
              width: 400,
              height: 60,
              textButton: "commencer la simulation ",
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/clients');
                Navigator.pushNamed(context, '/client/add');
              },
            ),
          ),
        ));
  }
}
