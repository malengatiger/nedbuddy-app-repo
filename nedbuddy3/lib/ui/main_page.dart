import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nedbuddy3/bloc/api.dart';
import 'package:nedbuddy3/bloc/nedbloc.dart';
import 'package:nedbuddy3/onboard/onboarding.dart';
import 'package:nedbuddy3/ui/twopanels.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    print('🔆 🔆 🔆 setting state ... build animation controller');
    _buildItems();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 200), value: 1.0);
    nedBloc.sayHello();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get isPanelVisible {
    AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ned',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(),
          ),
          leading: IconButton(
            onPressed: () {
              print('🏓 🏓  menu button clicked 🏓 ');
              controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: controller.view,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.extension),
              onPressed: () async {
                await DataAPI.nedbankAuth();
              },
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Onboarding()));
              },
            ),
          ],
        ),
        body: TwoPanels(
          controller: controller,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _items = List();
  _buildItems() {
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.cloud), title: Text('Accounts')));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.add_a_photo), title: Text('Rewards')));
    _items.add(BottomNavigationBarItem(
        icon: Icon(Icons.alarm), title: Text('Payments')));
  }

  Future<bool> _exitApp(BuildContext context) {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Do you want to exit Ned?'),
            content: new Text('We hate to see you leave...'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
