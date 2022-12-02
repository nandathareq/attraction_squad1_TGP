import 'dart:convert';

import 'package:attractions/model/reservation_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../model/gettiket_model.dart';

class GetTiketProvider with ChangeNotifier {
  List<GetTiketModel> _tikets = <GetTiketModel>[];

  List<GetTiketModel> get tikets {
    return [..._tikets];
  }

  List<GetUserModel> _users = <GetUserModel>[];

  List<GetUserModel> get users {
    return [..._users];
  }

  Future<void> fetchGetTikets(kode) async {
    try {
      final resp = await http.get(
          Uri.parse('$ipAddress:5000/api/v1/ticket/detail?bookingCode=$kode'));

      final ekstracDatas = json.decode(resp.body);
      print(ekstracDatas.toString());
      List<GetTiketModel> loadedDatas = [];

      List<GetUserModel> userDatas = [];
      final currentUser = GetUserModel(
        userEmail: ekstracDatas['user']['userEmail'].toString(),
        userName: ekstracDatas['user']['userName'].toString(),
        userMobileNumber: ekstracDatas['user']['userMobileNumber'].toString(),
      );
      userDatas.add(currentUser);

      ekstracDatas['tickets'].forEach((element) {
        final currentDatas = GetTiketModel(
          ticketCode: element['ticketCode'].toString(),
          placeName: element['placeName'].toString(),
          bookingCode: element['bookingCode'].toString(),
          attractionDate: element['attractionDate'].toString(),
        );

        loadedDatas.add(currentDatas);
      });
      _tikets = loadedDatas;
      _users = userDatas;
    } catch (e) {
      rethrow;
    }
  }
}
