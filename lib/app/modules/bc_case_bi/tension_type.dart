
import 'dart:convert';

/// Id : 13
/// Name : "অন্যান্য ধারার মামলা"

TensionType tensionTypeFromJson(String str) =>
    TensionType.fromJson(json.decode(str));

String tensionTypeToJson(TensionType data) =>
    json.encode(data.toJson());

class TensionType {
  TensionType({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  TensionType.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  TensionType copyWith({
    int? id,
    String? name,
  }) =>
      TensionType(
        id: id ?? _id,
        name: name ?? _name,
      );

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    return map;
  }
}
