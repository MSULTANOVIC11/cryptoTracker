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
        appBar: AppBar(title: Text("CryptoCurrency"), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {}, //faire raffraichir la page
          )
        ]),
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
  Future<List<dynamic>> futureCryptoData;
  int i = 0;

  void initState() {
    super.initState();
    futureCryptoData = fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureCryptoData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listViewWidget(snapshot.data);
            //Create a listView with each crypto
          }

          return CircularProgressIndicator();
          // By default, show a loading spinner.
        },
      ),
    );
  }
}

Widget listViewWidget(List<dynamic> data) {
  return Container(
    child: ListView.builder(
        itemCount: 20,
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (context, position) {
          return Card(
            child: ListTile(
              title: Text(
                data[position]['name'],
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                data[position]['quote']['USD']['percent_change_24h']
                        .toString() +
                    " %",
                style: percentChange(
                    data[position]['quote']['USD']['percent_change_24h']),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              subtitle: Text(
                data[position]['quote']['USD']['price'].toString() + " \$",
                style: TextStyle(
                    color: Colors.orange[600], fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
  );
}

TextStyle percentChange(double percent) {
  if (percent < 0.0) {
    return TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
  } else {
    return TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
  }
}
