import 'package:flutter/material.dart';
import 'package:nedbuddy3/bloc/nedbloc.dart';

import 'onboard/onboarding.dart';
import 'ui/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //Add Route to the main Page.
      routes: {'/mainPage': (context) => MainPage()},
      title: 'Fancy OnBoarding Demo',
      theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Raleway'),
      home: new StartApp(),
    );
  }
}

class StartApp extends StatefulWidget {
  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  bool showOnboarding = true;
  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  _checkStatus() {
    nedBloc.initialize();
    setState(() {
      showOnboarding = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showOnboarding) {
      return Onboarding();
    } else {
      return MainPage();
    }
  }
}
