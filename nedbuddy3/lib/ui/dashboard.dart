import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double headerHeight = 48;

  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 12.0,
      color: Colors.brown.shade50,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.0),
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
            topRight: Radius.circular(45.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 12.0,
              color: Colors.purple.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/key.png'),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '),
                    Text(
                      'R12,546.99',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 12.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('assets/wallet.png'),
                      onTap: () {
                        print('🧩 🧩 🧩 Wallet tapped');
                      },
                    ),
                    Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s'),
                    Text(
                      'R348,546.03',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal.shade700),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
