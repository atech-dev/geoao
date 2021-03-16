class CountiesModel {
  CountiesModel({
    this.counties,
  });

  List<CountyModel> counties;

  factory CountiesModel.fromJson(List<dynamic> json) => CountiesModel(
    counties: json == null
        ? null
        : List<CountyModel>.from(
        json.map((x) => CountyModel.fromJson(x))),
  );

  List<dynamic> toJson() => [
    counties == null
        ? null
        : List<dynamic>.from(counties.map((x) => x.toJson())),
  ];
}

class CountyModel {
  CountyModel({
    this.id,
    this.idCounty,
    this.idProvince,
    this.countyName,
    this.createdAt,
  });

  String id;
  int idCounty;
  int idProvince;
  String countyName;
  DateTime createdAt;

  factory CountyModel.fromJson(Map<String, dynamic> json) => CountyModel(
    id: json["_id"] == null ? null : json["_id"],
    idCounty: json["id_county"] == null ? null : json["id_county"],
    idProvince: json["id_province"] == null ? null : json["id_province"],
    countyName: json["county_name"] == null ? null : json["county_name"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "id_county": idCounty == null ? null : idCounty,
    "id_province": idProvince == null ? null : idProvince,
    "county_name": countyName == null ? null : countyName,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
