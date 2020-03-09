import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'dart:async';

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
            onPressed: () {}, //refresh page
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
  IconData iconPick(String name) {
    switch (name) {
      case 'ADC':
        return CryptoFontIcons.ADC;
      case 'AEON':
        return CryptoFontIcons.AEON;
      case 'AMP':
        return CryptoFontIcons.AMP;
      case 'ANC':
        return CryptoFontIcons.ANC;
      case 'ARDR':
        return CryptoFontIcons.ARDR;
      case 'AUR':
        return CryptoFontIcons.AUR;
      case 'BAY':
        return CryptoFontIcons.BAY;
      case 'BCN':
        return CryptoFontIcons.BCN;
      case 'BRK':
        return CryptoFontIcons.BRK;
      case 'BRX':
        return CryptoFontIcons.BRX;
      case 'BSD':
        return CryptoFontIcons.BSD;
      case 'BTA':
        return CryptoFontIcons.BTA;
      case 'BTC':
        return CryptoFontIcons.BTC;
      case 'BTC_ALT':
        return CryptoFontIcons.BTC_ALT;
      case 'BTCD':
        return CryptoFontIcons.BTCD;
      case 'BTS':
        return CryptoFontIcons.BTS;
      case 'CLAM':
        return CryptoFontIcons.CLAM;
      case 'CLOAK':
        return CryptoFontIcons.CLOAK;
      case 'DASH':
        return CryptoFontIcons.DASH;
      case 'DCR':
        return CryptoFontIcons.DCR;
      case 'DGB':
        return CryptoFontIcons.DGB;
      case 'DGD':
        return CryptoFontIcons.DGD;
      case 'DGX':
        return CryptoFontIcons.DGX;
      case 'DMD':
        return CryptoFontIcons.DMD;
      case 'DOGE':
        return CryptoFontIcons.DOGE;
      case 'EMC':
        return CryptoFontIcons.EMC;
      case 'ERC':
        return CryptoFontIcons.ERC;
      case 'ETC':
        return CryptoFontIcons.ETC;
      case 'ETH':
        return CryptoFontIcons.ETH;
      case 'FCT':
        return CryptoFontIcons.FCT;
      case 'FLO':
        return CryptoFontIcons.FLO;
      case 'FRK':
        return CryptoFontIcons.FRK;
      case 'FTC':
        return CryptoFontIcons.FTC;
      case 'GAME':
        return CryptoFontIcons.GAME;
      case 'GLD':
        return CryptoFontIcons.GLD;
      case 'GNT':
        return CryptoFontIcons.GNT;
      case 'GRC':
        return CryptoFontIcons.GRC;
      case 'GRS':
        return CryptoFontIcons.GRS;
      case 'HEAT':
        return CryptoFontIcons.HEAT;
      case 'ICN':
        return CryptoFontIcons.ICN;
      case 'IFC':
        return CryptoFontIcons.IFC;
      case 'INCNT':
        return CryptoFontIcons.INCNT;
      case 'IOC':
        return CryptoFontIcons.IOC;
      case 'KMD':
        return CryptoFontIcons.KMD;
      case 'KOBO':
        return CryptoFontIcons.KOBO;
      case 'KORE':
        return CryptoFontIcons.KORE;
      case 'LBC':
        return CryptoFontIcons.LBC;
      case 'LDOGE':
        return CryptoFontIcons.LDOGE;
      case 'LSK':
        return CryptoFontIcons.LSK;
      case 'LTC':
        return CryptoFontIcons.LTC;
      case 'MAID':
        return CryptoFontIcons.MAID;
      case 'MINT':
        return CryptoFontIcons.MINT;
      case 'MONA':
        return CryptoFontIcons.MONA;
      case 'MUE':
        return CryptoFontIcons.MUE;
      case 'NEOS':
        return CryptoFontIcons.NEOS;
      case 'NLG':
        return CryptoFontIcons.NLG;
      case 'NMC':
        return CryptoFontIcons.NMC;
      case 'NOTE':
        return CryptoFontIcons.NOTE;
      case 'NUC':
        return CryptoFontIcons.NUC;
      case 'NXT':
        return CryptoFontIcons.NXT;
      case 'OK':
        return CryptoFontIcons.OK;
      case 'OMNI':
        return CryptoFontIcons.OMNI;
      case 'PINK':
        return CryptoFontIcons.PINK;
      case 'PIVX':
        return CryptoFontIcons.PIVX;
      case 'POT':
        return CryptoFontIcons.POT;
      case 'PPC':
        return CryptoFontIcons.PPC;
      case 'QRK':
        return CryptoFontIcons.QRK;
      case 'RBY':
        return CryptoFontIcons.RBY;
      case 'RDD':
        return CryptoFontIcons.RDD;
      case 'REP':
        return CryptoFontIcons.REP;
      case 'RISE':
        return CryptoFontIcons.RISE;
      case 'SJCX':
        return CryptoFontIcons.SJCX;
      case 'SLS':
        return CryptoFontIcons.SLS;
      case 'STEEM':
        return CryptoFontIcons.STEEM;
      case 'STRAT':
        return CryptoFontIcons.STRAT;
      case 'SYS':
        return CryptoFontIcons.SYS;
      case 'TRIG':
        return CryptoFontIcons.TRIG;
      case 'UBQ':
        return CryptoFontIcons.UBQ;
      case 'UNITY':
        return CryptoFontIcons.UNITY;
      case 'USDT':
        return CryptoFontIcons.USDT;
      case 'VRC':
        return CryptoFontIcons.VRC;
      case 'VTC':
        return CryptoFontIcons.VTC;
      case 'WAVES':
        return CryptoFontIcons.WAVES;
      case 'XCP':
        return CryptoFontIcons.XCP;
      case 'XEM':
        return CryptoFontIcons.XEM;
      case 'XMR':
        return CryptoFontIcons.XMR;
      case 'XRP':
        return CryptoFontIcons.XRP;
      case 'ZEC':
        return CryptoFontIcons.ZEC;
      default:
        return Icons.public;
    }
  }

  return Container(
    child: ListView.builder(
        itemCount: 20,
        padding: const EdgeInsets.all(2.0),
        itemBuilder: (context, position) {
          return Card(
            child: ListTile(
              leading: Icon(iconPick(data[position]['symbol'])),
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
