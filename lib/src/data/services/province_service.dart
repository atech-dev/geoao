import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geoao/src/data/models/province_model.dart';

class ProvinceService {
  Future<String> _loadProvincesFromAsset() async {
    try {
      return await rootBundle.loadString("assets/json/provinces.json");
    } catch(e, stackTrace) {
      print("ERROR loading from assets");
      print(e);
      print(stackTrace);

      throw Exception("Error loading assets from device. Please check available space");
    }

  }

  Future<void> _loadProvincesFromNetwork() async {
    /// TODO: Implement load from network
  }

  Future<ProvincesModel> _loadProvinces() async {
    var res = await _loadProvincesFromAsset();

    if(res != null) {
      return ProvincesModel.fromJson(json.decode(res));
    }

    return null;
  }

  getProvinces() async {
    var provincesModel = await _loadProvinces();

    if(provincesModel != null) {

      return provincesModel;

    } else {
      throw FlutterError("Error loading provinces.");
    }
  }
}
