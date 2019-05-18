import 'dart:io';

import 'package:flutter/material.dart';

class MenuPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: new Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: Platform.isIOS ? 20 : 40),
            CircleAvatar(
              radius: Platform.isIOS ? 40 : 40,
              child: Image.asset('assets/banks.png'),
            ),
            SizedBox(
              height: Platform.isIOS ? 40 : 20,
            ),
            FlatButton(
              onPressed: () {
                print('☀️ ☀️ ☀️ Loans pressed  🧩 🧩 ');
              },
              child: Text(
                "Loans",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                print('☀️ ☀️ ☀️ History pressed 🧩 🧩 ');
              },
              child: Text(
                "History",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                print('☀️ ☀️ ☀️ Beneficiaries pressed 🧩 🧩 ');
              },
              child: Text(
                "Beneficiaries",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                print('☀️ ☀️ ☀️ Pending Transactions pressed 🧩 🧩  ');
              },
              child: Text(
                "Pending Transactions",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
