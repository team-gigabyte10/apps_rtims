import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// BeatID : 1623
/// BeatNo : "বিট নং-০৩"
/// VisitDate : "2023-04-16T09:03:39.437"
/// VisitorReport : "dfsdf"
/// Latitude : 90.3954383
/// Longitude : 23.7828583
/// VisitorID : 115
/// UserName : "মোঃ মকবুল হোসেন"

BeatReportModel beatReportModelFromJson(String str) =>
    BeatReportModel.fromJson(json.decode(str));

String beatReportModelToJson(BeatReportModel data) =>
    json.encode(data.toJson());

class BeatReportModel extends Serializable {
  BeatReportModel({
    int? beatID,
    String? beatNo,
    String? visitDate,
    String? visitorReport,
    double? latitude,
    double? longitude,
    int? visitorID,
    String? userName,
  }) {
    _beatID = beatID;
    _beatNo = beatNo;
    _visitDate = visitDate;
    _visitorReport = visitorReport;
    _latitude = latitude;
    _longitude = longitude;
    _visitorID = visitorID;
    _userName = userName;
  }

  BeatReportModel.fromJson(dynamic json) {
    _beatID = json['BeatID'];
    _beatNo = json['BeatNo'];
    _visitDate = json['VisitDate'];
    _visitorReport = json['VisitorReport'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _visitorID = json['VisitorID'];
    _userName = json['UserName'];
  }

  int? _beatID;
  String? _beatNo;
  String? _visitDate;
  String? _visitorReport;
  double? _latitude;
  double? _longitude;
  int? _visitorID;
  String? _userName;

  BeatReportModel copyWith({
    int? beatID,
    String? beatNo,
    String? visitDate,
    String? visitorReport,
    double? latitude,
    double? longitude,
    int? visitorID,
    String? userName,
  }) =>
      BeatReportModel(
        beatID: beatID ?? _beatID,
        beatNo: beatNo ?? _beatNo,
        visitDate: visitDate ?? _visitDate,
        visitorReport: visitorReport ?? _visitorReport,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        visitorID: visitorID ?? _visitorID,
        userName: userName ?? _userName,
      );

  int? get beatID => _beatID;

  String? get beatNo => _beatNo;

  String? get visitDate => _visitDate;

  String? get visitorReport => _visitorReport;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  int? get visitorID => _visitorID;

  String? get userName => _userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BeatID'] = _beatID;
    map['BeatNo'] = _beatNo;
    map['VisitDate'] = _visitDate;
    map['VisitorReport'] = _visitorReport;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['VisitorID'] = _visitorID;
    map['UserName'] = _userName;
    return map;
  }
}
