library geoao;

export 'package:geoao/src/data/models/county_model.dart';
export 'package:geoao/src/data/models/province_model.dart';

import 'package:geoao/src/data/models/county_model.dart';
import 'package:geoao/src/data/models/province_model.dart';
import 'package:geoao/src/data/services/county_service.dart';
import 'package:geoao/src/data/services/province_service.dart';

/// GEOAO
///
/// Geolocation Angola - Geoao
/// A package that uses geoao API aiming to expose all geolocation data referring to Angola
class Geoao {
  ProvinceService _provinceService;
  CountyService _countyService;

  Geoao() {
    _provinceService = ProvinceService();
    _countyService = CountyService();
  }

  /// getProvinces
  ///
  /// Get all provinces of Angola
  Future<ProvincesModel> getProvinces() async =>
      await _provinceService.getProvinces();

  /// getCounties
  ///
  /// Get all counties from a province [provinceId] of Angola
  Future<List<CountyModel>> getCounties(int provinceId) async =>
      await _countyService.getCounties(provinceId);

  /// getCountyById
  ///
  /// Get specific county [countyId] of Angola
  Future<CountyModel> getCountyById(int countyId) async =>
      await _countyService.getCountyById(countyId);
}
