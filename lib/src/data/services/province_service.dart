import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:geoao/src/data/json/provinces.dart';
import 'package:geoao/src/data/models/province_model.dart';

/// A service tha provides data for provinces
class ProvinceService {

  /// Loads provinces from local file [provinces.json]
  ///
  /// Throws [Exception] if there was any error loading the file
  Future<String> _loadProvincesFromAsset() async {
    try {
      return jsonEncode(provinces);
    } catch(e, stackTrace) {
      print("ERROR loading from assets");
      print(e);
      print(stackTrace);

      throw Exception("Error loading assets from device. Please check available space");
    }

  }

  /// Loads provinces
  ///
  /// Throws [FlutterError] if there was any error loading the provinces.
  Future<ProvincesModel> _loadProvinces() async {
    var res = await _loadProvincesFromAsset();

    if(res != null) {
      return ProvincesModel.fromJson(json.decode(res));
    }

    return null;
  }

  /// Gets the provinces
  ///
  /// Throws [FlutterError] if there was any error loading the provinces.
  getProvinces() async {
    var provincesModel = await _loadProvinces();

    if(provincesModel != null) {

      return provincesModel;

    } else {
      throw FlutterError("Error loading provinces.");
    }
  }
}
