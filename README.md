# Geoao

A package that uses Geoao API developed by ATECH, aiming to expose all geolocation data referring to Angola.

## MainClass ✨ 
```dart
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
```

## Usage 🤳
```dart
import 'package:geoao/geoao.dart';

_exampleUsage() async {
  Geoao _geoao;
  
  ProvincesModel provincesModel;
  List<CountyModel> counties;
  CountyModel countyModel;

  int idProvince = 1;
  int idCounty = 1;

  provincesModel = await _geoao.getProvinces();
  counties = await _geoao.getCounties(idProvince);
  countyModel = await _geoao.getCountyById(idCounty);
}
```

### MIT License
