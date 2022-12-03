import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../model/reservation_model.dart';
import '../model/getinvoice_model.dart';

class InvoiceProvider with ChangeNotifier {
  List<InvoiceModel> _invoices = <InvoiceModel>[];

  List<InvoiceModel> get invoices {
    return [..._invoices];
  }

  InvoiceModel? _dataInvoice;

  InvoiceModel? get dataInvoice {
    return _dataInvoice;
  }

  Future<void> fetchInvoice(userId) async {
    try {
      final resp = await http
          .get(Uri.parse('$ipAddress:5000/api/v1/subInvoice?userId=$userId'));

      // print('http://10.0.2.2:5000/api/v1/subInvoice/detail?bookingCode=$kode');

      final ekstrakDatas = json.decode(resp.body);

      List<InvoiceModel> loadedDatas = [];

      ekstrakDatas.forEach((invoices) {
        final currentData = InvoiceModel(
            id: invoices['id'],
            grandInvoiceId: invoices['grandInvoice']['id'],
            bookingCode: invoices['bookingCode'].toString(),
            total: invoices['total'],
            raisedDate: invoices['raisedDate'].toString(),
            status: invoices['status']);

        loadedDatas.add(currentData);
      });

      _invoices = loadedDatas;
    } catch (e) {
      rethrow;
    }
  }
}
