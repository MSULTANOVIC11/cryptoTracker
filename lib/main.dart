import 'package:flutter/material.dart';

void main() => runApp(CryptoTracker());

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: CryptoPage(),
          ),
        ),
      ),
    );
  }
}

class CryptoPage extends StatefulWidget {
  @override
  _CryptoPage createState() => _CryptoPage();
}

class _CryptoPage extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text("Okay"),
      ],
    );
  }
}
