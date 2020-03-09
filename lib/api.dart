import 'dart:async';
import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiUrl =
    "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

List<CryptoData> list;

Future<List<dynamic>> fetchCryptoData() async {
  final response = await http.get(apiUrl,
      headers: {'X-CMC_PRO_API_KEY': "3f0a40c0-f432-4857-85c4-1565e04b166b"});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    var data = json.decode(response.body);
    var rest = data["data"] as List;

    list = rest.map<CryptoData>((json) => CryptoData.fromJson(json)).toList();

    return rest;
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    print(response.statusCode);
    throw Exception('Failed to load CryptoData');
  }
}

class CryptoData {
  final int id;
  final String name;

  CryptoData({this.id, this.name});

  CryptoData.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
  Map toJson() {
    return {'id': id, 'name': name};
  }
}
