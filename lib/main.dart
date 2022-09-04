import 'dart:convert';
import 'dart:developer';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plan_de_financement/Screens/Login/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ExampleGrid.dart';
import 'Provider/Provider_StateManagemant.dart';
import 'Screens/Client/FormInformationClient.dart';
import 'Screens/Client/AgentScreen.dart';
import 'Screens/Client/ScreenComencerSimulation.dart';
import 'Screens/Dossiers/Create/FormEvaluationFinaciere.dart';
import 'Screens/Dossiers/Create/FormRevenuNetmesuelDeCredit.dart';
import 'Screens/Dossiers/Create/FormsScreen.dart';
import 'Screens/Dossiers/Get/ListDesDossiersScreen.dart';
import 'Screens/Dossiers/PdfScreen_new.dart';
import 'Screens/Dossiers/Update/ScreenModifierProfile.dart';
import 'Screens/Login/ForgetPasswordScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Screens/Client/Dashboard/ListDesClientScreen.dart';
import 'Screens/Stepper/StepperHorizontalWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: (context) => ProviderSM(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    ;
    return MaterialColor(color.value, swatch);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUsertUId();
  }

  String uid;
  getUsertUId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("uidUser");
    });
  }

  bool isWaiting = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1440, 1068),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
          routes: {},
          localizationsDelegates: [GlobalMaterialLocalizations.delegate],
          // supportedLocales: [const Locale('fr')],
          title: 'PRÉVISIONNEL - SVASM',
          theme: ThemeData(
              textTheme: GoogleFonts.montserratTextTheme(
                Theme.of(context).textTheme,
              ),
              fontFamily: 'Neometric',
              primaryColor: Color(0xFF3a6259),
              primarySwatch: createMaterialColor(Color(0xFF3a6259))),
          debugShowCheckedModeBanner: false,

             
           home:StepperScreen(),
          // onGenerateRoute: RouteGenerator.generateRoute,
          ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Text("z"),
    );
  }
}

//  Selector<ProviderSM, bool>(
//                           selector: (context, getterRessetpassword) =>
//                               getterRessetpassword.resetPassword,
//                           builder: (context, model, child) {
//                             return
