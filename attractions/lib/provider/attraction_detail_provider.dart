import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../model/attraction_model.dart';

class AttractionDetailProvider with ChangeNotifier {
  List<AttractionModel> _attractionDetails = <AttractionModel>[];

  List<AttractionModel> get attractionDetails {
    return [..._attractionDetails];
  }

  Future<void> fetchDetailAttractions(id) async {
    try {
      final resp = await http
          .get(Uri.parse('http://10.0.2.2:8000/partnership/details/$id'));

      final extractDatas = json.decode(resp.body);

      List<AttractionModel> loadedDatas = [];

      extractDatas.forEach((details) {
        final currentData = AttractionModel(
            id: details['id'],
            placeName: details['placeName'].toString(),
            description: details['description'].toString(),
            category: details['category'].toString(),
            city: details['city'].toString(),
            price: int.parse(details['price'].toString()),
            lattitude: double.parse(details['lattitude'].toString()),
            longtitude: double.parse(details['longitude'].toString()),
            openHour: details['openHour'].toString(),
            closeHour: details['closeHour'].toString(),
            placeRating: double.parse(details['placeRating'].toString()),
            fasilities: details['facilities']
                .toString()
                .substring(1, details['facilities'].toString().length - 1)
                .split(','),
            contactPerson: details['contactPerson'].toString(),
            picture: details['picture'].toString());

        loadedDatas.add(currentData);
      });
      _attractionDetails = loadedDatas;
    } catch (e) {
      rethrow;
    }
  }
}
