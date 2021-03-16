import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geoao/src/data/json/counties.dart';
import 'package:geoao/src/data/models/county_model.dart';

/// A service tha provides data for counties
class CountyService {

  /// Loads counties from local file [counties.json]
  ///
  /// Throws [Exception] if there was any error loading the file
  Future<String> _loadCountiesFromAsset() async {
    try {
      return jsonEncode(counties);
    } catch(e, stackTrace) {
      print("ERROR loading from assets");
      print(e);
      print(stackTrace);

      throw Exception("Error loading assets from device. Please check available space.");
    }
  }

  /// Gets the counties by province id
  ///
  /// Throws [FlutterError] if there was any error loading the counties.
  Future<CountiesModel> _loadCounties() async {
    var res = await _loadCountiesFromAsset();

    if(res != null) {
      return CountiesModel.fromJson(json.decode(res));
    }

    return null;
  }

  /// Gets the counties by province id
  ///
  /// Throws [FlutterError] if there was any error loading the counties.
  Future<List<CountyModel>> getCounties(int provinceId) async {
    var countiesModel = await _loadCounties();

    if(countiesModel != null) {

      return countiesModel.counties.where((e) => e.idProvince == provinceId).toList();

    } else {
      throw FlutterError("Error loading counties.");
    }
  }

  /// Get county by its id
  ///
  /// Throws [FlutterError] if there was any error loading the county data.
  Future<CountyModel> getCountyById(int countyId) async {
    var countiesModel = await _loadCounties();

    if(countiesModel != null) {

      return countiesModel.counties.singleWhere((e) => e.idCounty == countyId, orElse: () => null);

    } else {
      throw FlutterError("Error loading county.");
    }
  }

  /// TODO: Load counties from API
  ///
  /// Throws [Exception] if there was any error loading the file.
  /// Using the [http] package
}
