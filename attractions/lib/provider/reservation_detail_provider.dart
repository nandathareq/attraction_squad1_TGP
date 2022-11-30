import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/reservation_model.dart';

class ReservationProvider with ChangeNotifier {
  List<ReservationModel> _resers = <ReservationModel>[];

  List<ReservationModel> get resers {
    return [..._resers];
  }

  Future<void> fetchCodeBoking(kode) async {
    try {
      final resp = await http.get(Uri.parse(
          'http://10.0.2.2:5000/api/v1/subInvoice/detail?bookingCode=$kode'));

      print('http://10.0.2.2:5000/api/v1/subInvoice/detail?bookingCode=$kode');

      final ekstrakDatas = json.decode(resp.body);

      print(ekstrakDatas['items'].toString());
      print(ekstrakDatas.toString());

      List<ReservationModel> loadedDatas = [];

      final currentData = ReservationModel(
          bookingCode: ekstrakDatas['bookingCode'],
          total: ekstrakDatas['total'],
          items: ekstrakDatas['items']);

      loadedDatas.add(currentData);

      // ekstrakDatas.forEach((reser) {
      //   final currentData = ReservationModel(

      //   loadedDatas.add(currentData);
      // });

      _resers = loadedDatas;
    } catch (e) {
      rethrow;
    }
  }
}
