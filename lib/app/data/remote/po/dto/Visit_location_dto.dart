import 'dart:convert';

/// visitLocationID : 9321
/// LocationShort : "9321238912"
/// LocationDetails : "12345"

VisitLocationDto visitLocationDtoFromJson(String str) =>
    VisitLocationDto.fromJson(json.decode(str));

String visitLocationDtoToJson(VisitLocationDto data) =>
    json.encode(data.toJson());

class VisitLocationDto {
  VisitLocationDto({
    int? visitLocationID,
    String? locationShort,
    String? locationDetails,
  }) {
    _visitLocationID = visitLocationID;
    _locationShort = locationShort;
    _locationDetails = locationDetails;
  }

  VisitLocationDto.fromJson(dynamic json) {
    _visitLocationID = json['visitLocationID'];
    _locationShort = json['LocationShort'];
    _locationDetails = json['LocationDetails'];
  }

  int? _visitLocationID;
  String? _locationShort;
  String? _locationDetails;

  VisitLocationDto copyWith({
    int? visitLocationID,
    String? locationShort,
    String? locationDetails,
  }) =>
      VisitLocationDto(
        visitLocationID: visitLocationID ?? _visitLocationID,
        locationShort: locationShort ?? _locationShort,
        locationDetails: locationDetails ?? _locationDetails,
      );

  int? get visitLocationID => _visitLocationID;

  String? get locationShort => _locationShort;

  String? get locationDetails => _locationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['visitLocationID'] = _visitLocationID;
    map['LocationShort'] = _locationShort;
    map['LocationDetails'] = _locationDetails;
    return map;
  }
}
