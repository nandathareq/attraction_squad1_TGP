import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/attraction_model.dart';

class AttractionProvider with ChangeNotifier {
  List<AttractionModel> _attractions = <AttractionModel>[];

  List<AttractionModel> get attractions {
    return [..._attractions];
  }

  Future<void> fetchAndSetAttractions(
      {String? cityParam = '',
      String? categoryParam = '',
      String? sortByParam = '',
      bool? descParam = false}) async {
    String? city = cityParam ?? '';
    String? category = categoryParam ?? '';
    bool? desc = descParam ?? false;
    String? sortBy = sortByParam.toString().toLowerCase() ?? '';
    String baseUrl = "http://10.0.2.2:8000/partnership/details";
    // print(cityParam);
    if (city != '' || category != '') {
      baseUrl =
          "http://10.0.2.2:8000/partnership/details?city=$city&category=$category&sortBy=$sortBy&descending=false";
    }

    // String? city = cityParam;
    try {
      // final resp = await http.get(Uri.parse(
      //     'http://10.0.2.2:8000/partnership/details?city=&category=&sortBy=&descending='));
      print(Uri.parse(baseUrl));
      final resp = await http.get(Uri.parse(baseUrl));

      final extractedDatas = json.decode(resp.body);

      print(resp == null);

      List<AttractionModel> loadedDatas = [];

      extractedDatas.forEach((attractions) {
        final currentData = AttractionModel(
            id: attractions['id'],
            placeName: attractions['placeName'].toString(),
            description: attractions['description'].toString(),
            category: attractions['category'].toString(),
            city: attractions['city'].toString(),
            price: int.parse(attractions['price'].toString()),
            lattitude: double.parse(attractions['lattitude'].toString()),
            longtitude: double.parse(attractions['longitude'].toString()),
            openHour: attractions['openHour'].toString(),
            closeHour: attractions['closeHour'].toString(),
            placeRating: double.parse(attractions['placeRating'].toString()),
            fasilities: attractions['facilities']
                .toString()
                .substring(1, attractions['facilities'].toString().length - 1),
            contactPerson: attractions['contactPerson'].toString(),
            picture: attractions['picture'].toString());

        loadedDatas.add(currentData);
      });
      _attractions = loadedDatas;
    } catch (e) {
      rethrow;
    }
  }
}
