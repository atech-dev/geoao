import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geoao/src/data/models/county_model.dart';

class CountyService {
  Future<String> _loadCountiesFromAsset() async {
    try {
      return await rootBundle.loadString("assets/json/counties.json");
    } catch(e, stackTrace) {
      print("ERROR loading from assets");
      print(e);
      print(stackTrace);

      throw Exception("Error loading assets from device. Please check available space.");
    }
  }

  Future<void> _loadProvincesFromNetwork() async {
    /// TODO: Implement load from network
  }

  Future<CountiesModel> _loadCounties() async {
    var res = await _loadCountiesFromAsset();

    if(res != null) {
      return CountiesModel.fromJson(json.decode(res));
    }

    return null;
  }

  Future<List<CountyModel>> getCounties(int provinceId) async {
    var countiesModel = await _loadCounties();

    if(countiesModel != null) {

      return countiesModel.counties.where((e) => e.idProvince == provinceId).toList();

    } else {
      throw FlutterError("Error loading counties.");
    }
  }

  Future<CountyModel> getCountyById(int countyId) async {
    var countiesModel = await _loadCounties();

    if(countiesModel != null) {

      return countiesModel.counties.singleWhere((e) => e.idCounty == countyId, orElse: () => null);

    } else {
      throw FlutterError("Error loading county.");
    }
  }
}
