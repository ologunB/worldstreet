import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceRepository {
  Future<List<Candle>> fetchCandles(
      {required String symbol, required String interval, int? endTime}) async {
    final uri =
        "https://api.binance.com/api/v3/klines?symbol=$symbol&interval=$interval${endTime != null ? "&endTime=$endTime" : ""}";
    final res = await Dio().get(uri);

    List<Candle> list = [];
    res.data.forEach((a) {
      list.add(Candle.fromJson(a));
    });

    return list;
  }

  Future<List<String>> fetchSymbols() async {
    const url = "https://api.binance.com/api/v3/ticker/price";
    final res = await Dio().get(url);
    return (jsonDecode(res.data) as List<dynamic>)
        .map((e) => e["symbol"] as String)
        .toList();
  }

  WebSocketChannel establishConnection(String symbol, String interval) {
    final channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    channel.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["$symbol@kline_$interval"],
          "id": 1
        },
      ),
    );
    return channel;
  }
}
