import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// paths : null
/// Id : 173860
/// ParentID : 0
/// GeoFenceName : null
/// FillColor : null
/// BorderColor : null
/// ThanaCircleID : 0
/// DistrictID : 0
/// DivisionID : 0
/// LocationDetails : "Baushi bazar (PO)"
/// LocationShort : "Haq villa "
/// IsPO : 1

LocationDetails locationDetailsFromJson(String str) =>
    LocationDetails.fromJson(json.decode(str));

String locationDetailsToJson(LocationDetails data) =>
    json.encode(data.toJson());

class LocationDetails extends Serializable {
  LocationDetails({
    dynamic paths,
    int? id,
    int? parentID,
    dynamic geoFenceName,
    dynamic fillColor,
    dynamic borderColor,
    int? thanaCircleID,
    int? districtID,
    int? divisionID,
    String? locationDetails,
    String? locationShort,
    int? isPO,
  }) {
    _paths = paths;
    _id = id;
    _parentID = parentID;
    _geoFenceName = geoFenceName;
    _fillColor = fillColor;
    _borderColor = borderColor;
    _thanaCircleID = thanaCircleID;
    _districtID = districtID;
    _divisionID = divisionID;
    _locationDetails = locationDetails;
    _locationShort = locationShort;
    _isPO = isPO;
  }

  LocationDetails.fromJson(dynamic json) {
    _paths = json['paths'];
    _id = json['Id'];
    _parentID = json['ParentID'];
    _geoFenceName = json['GeoFenceName'];
    _fillColor = json['FillColor'];
    _borderColor = json['BorderColor'];
    _thanaCircleID = json['ThanaCircleID'];
    _districtID = json['DistrictID'];
    _divisionID = json['DivisionID'];
    _locationDetails = json['LocationDetails'];
    _locationShort = json['LocationShort'];
    _isPO = json['IsPO'];
  }

  dynamic _paths;
  int? _id;
  int? _parentID;
  dynamic _geoFenceName;
  dynamic _fillColor;
  dynamic _borderColor;
  int? _thanaCircleID;
  int? _districtID;
  int? _divisionID;
  String? _locationDetails;
  String? _locationShort;
  int? _isPO;

  LocationDetails copyWith({
    dynamic paths,
    int? id,
    int? parentID,
    dynamic geoFenceName,
    dynamic fillColor,
    dynamic borderColor,
    int? thanaCircleID,
    int? districtID,
    int? divisionID,
    String? locationDetails,
    String? locationShort,
    int? isPO,
  }) =>
      LocationDetails(
        paths: paths ?? _paths,
        id: id ?? _id,
        parentID: parentID ?? _parentID,
        geoFenceName: geoFenceName ?? _geoFenceName,
        fillColor: fillColor ?? _fillColor,
        borderColor: borderColor ?? _borderColor,
        thanaCircleID: thanaCircleID ?? _thanaCircleID,
        districtID: districtID ?? _districtID,
        divisionID: divisionID ?? _divisionID,
        locationDetails: locationDetails ?? _locationDetails,
        locationShort: locationShort ?? _locationShort,
        isPO: isPO ?? _isPO,
      );

  dynamic get paths => _paths;

  int? get id => _id;

  int? get parentID => _parentID;

  dynamic get geoFenceName => _geoFenceName;

  dynamic get fillColor => _fillColor;

  dynamic get borderColor => _borderColor;

  int? get thanaCircleID => _thanaCircleID;

  int? get districtID => _districtID;

  int? get divisionID => _divisionID;

  String? get locationDetails => _locationDetails;

  String? get locationShort => _locationShort;

  int? get isPO => _isPO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['paths'] = _paths;
    map['Id'] = _id;
    map['ParentID'] = _parentID;
    map['GeoFenceName'] = _geoFenceName;
    map['FillColor'] = _fillColor;
    map['BorderColor'] = _borderColor;
    map['ThanaCircleID'] = _thanaCircleID;
    map['DistrictID'] = _districtID;
    map['DivisionID'] = _divisionID;
    map['LocationDetails'] = _locationDetails;
    map['LocationShort'] = _locationShort;
    map['IsPO'] = _isPO;
    return map;
  }
}
