/* 
  Faire le fetch de l'API, car là ca ne marche pas il faut prendre le nom et l'id du data [1];


*/

import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:async';
import 'dart:convert';

void main() => runApp(CryptoTracker());

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
  Future<CryptoData> futureCryptoData;

  void initState() {
    super.initState();
    futureCryptoData = fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Okay"),
        CrypoCards(),
        FutureBuilder<CryptoData>(
          future: futureCryptoData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.name);
              return Text("t");
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}

class CrypoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card();
  }
}
