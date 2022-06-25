import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<String> currencyList = [
  'usd',
  'eur',
  'gbp',
];

class CoinData {
  Future<String> getPriceOfBtc(String currencyPair) async {
    var url = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=$currencyPair');
    http.Response response = await http.get(url);
    var btcPrice = await jsonDecode(response.body)['bitcoin'][currencyPair];
    return btcPrice.toString();
  }

  Future<String> getPriceOfEth(String currencyPair) async {
    var url = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=$currencyPair');
    http.Response response = await http.get(url);
    var ethPrice = await jsonDecode(response.body)['ethereum'][currencyPair];
    return ethPrice.toString();
  }

  Future<String> getPriceOfDot(String currencyPair) async {
    var url = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=polkadot&vs_currencies=$currencyPair');
    http.Response response = await http.get(url);
    var dotPrice = await jsonDecode(response.body)['polkadot'][currencyPair];
    return dotPrice.toString();
  }
}
