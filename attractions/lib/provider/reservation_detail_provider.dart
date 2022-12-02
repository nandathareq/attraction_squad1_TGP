import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../model/reservation_model.dart';
import '../model/resi_model.dart';

class ReservationProvider with ChangeNotifier {
  List<ReservationModel> _resers = <ReservationModel>[];

  List<ReservationModel> get resers {
    return [..._resers];
  }

  ResiModel? _dataResi;

  ResiModel? get dataResi {
    return _dataResi;
  }

  Future<void> fetchCodeBoking(kode) async {
    try {
      final resp = await http.get(Uri.parse(
          '$ipAddress:5000/api/v1/subInvoice/detail?bookingCode=$kode'));

      // print('http://10.0.2.2:5000/api/v1/subInvoice/detail?bookingCode=$kode');

      final ekstrakDatas = json.decode(resp.body);

      // print(ekstrakDatas['items'].toString());
      // print(ekstrakDatas.toString());

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

  Future<void> fetchResi({bookingCode}) async {
    try {
      final response = await http.get(Uri.parse(
          '$ipAddress:5000/api/v1/subInvoice/detail?bookingCode=$bookingCode'));

      final resiData = json.decode(response.body);

      final data = ResiModel(
          total: resiData['total'].toString(),
          date: resiData['paidDate'].toString(),
          idTransaksi: resiData['idTransaksi'].toString(),
          nasabah: resiData['user']['userName'].toString(),
          rekening:
              "${resiData['rekeningInfo']['rekening']} - ${resiData['rekeningInfo']['nomorRekening']}",
          kodeBooking: resiData['bookingCode'].toString());

      _dataResi = data;
    } catch (e) {
      rethrow;
    }
  }
}
