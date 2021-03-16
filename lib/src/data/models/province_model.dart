class ProvincesModel {
  ProvincesModel({
    this.provinces,
  });

  List<ProvinceModel> provinces;

  factory ProvincesModel.fromJson(List<dynamic> json) =>
      ProvincesModel(
        provinces: json == null
            ? null
            : List<ProvinceModel>.from(
            json.map((x) => ProvinceModel.fromJson(x))),
      );

  List<dynamic> toJson() => [
    provinces == null
        ? null
        : List<dynamic>.from(provinces.map((x) => x.toJson())),
  ];
}

class ProvinceModel {
  ProvinceModel({
    this.id,
    this.matId,
    this.idProvince,
    this.provinceName,
    this.createdAt,
  });

  String id;
  String matId;
  int idProvince;
  String provinceName;
  DateTime createdAt;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    id: json["_id"] == null ? null : json["_id"],
    matId: json["mat_id"] == null ? null : json["mat_id"],
    idProvince: json["id_province"] == null ? null : json["id_province"],
    provinceName:
    json["province_name"] == null ? null : json["province_name"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "mat_id": matId == null ? null : matId,
    "id_province": idProvince == null ? null : idProvince,
    "province_name": provinceName == null ? null : provinceName,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
  };
}
