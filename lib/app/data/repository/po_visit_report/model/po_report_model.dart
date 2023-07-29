import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// POID : 134391
/// FIRNo : ""
/// gDNo : ""
/// FIRType : "GD"
/// RefDate : "2023-05-04T17:05:00"
/// GDDate : "2023-05-04T00:00:00"
/// PODate : "2023-05-03T00:00:00"
/// Dhara : "test "
/// OccurenceType : 20
/// OccurenceTypeName : "খুন মামলা"
/// FIRNote : "test note "
/// ResponsibleIO : 115
/// ResponsibleIOName : "মোঃ মকবুল হোসেন"
/// VisitDate : ""
/// VisitorReport : ""
/// Latitude : 23.254
/// Longitude : 90.222

PoReportModel poReportModelFromJson(String str) =>
    PoReportModel.fromJson(json.decode(str));

String poReportModelToJson(PoReportModel data) => json.encode(data.toJson());

class PoReportModel extends Serializable {
  PoReportModel({
    int? poid,
    String? fIRNo,
    String? gDNo,
    String? fIRType,
    String? refDate,
    String? gDDate,
    String? pODate,
    String? dhara,
    int? occurenceType,
    String? occurenceTypeName,
    String? fIRNote,
    int? responsibleIO,
    String? responsibleIOName,
    String? visitDate,
    String? visitorReport,
    double? latitude,
    double? longitude,
  }) {
    _poid = poid;
    _fIRNo = fIRNo;
    _gDNo = gDNo;
    _fIRType = fIRType;
    _refDate = refDate;
    _gDDate = gDDate;
    _pODate = pODate;
    _dhara = dhara;
    _occurenceType = occurenceType;
    _occurenceTypeName = occurenceTypeName;
    _fIRNote = fIRNote;
    _responsibleIO = responsibleIO;
    _responsibleIOName = responsibleIOName;
    _visitDate = visitDate;
    _visitorReport = visitorReport;
    _latitude = latitude;
    _longitude = longitude;
  }

  PoReportModel.fromJson(dynamic json) {
    _poid = json['POID'];
    _fIRNo = json['FIRNo'];
    _gDNo = json['GDNo'];
    _fIRType = json['FIRType'];
    _refDate = json['RefDate'];
    _gDDate = json['GDDate'];
    _pODate = json['PODate'];
    _dhara = json['Dhara'];
    _occurenceType = json['OccurenceType'];
    _occurenceTypeName = json['OccurenceTypeName'];
    _fIRNote = json['FIRNote'];
    _responsibleIO = json['ResponsibleIO'];
    _responsibleIOName = json['ResponsibleIOName'];
    _visitDate = json['VisitDate'];
    _visitorReport = json['VisitorReport'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
  }

  int? _poid;
  String? _fIRNo;
  String? _gDNo;
  String? _fIRType;
  String? _refDate;
  String? _gDDate;
  String? _pODate;
  String? _dhara;
  int? _occurenceType;
  String? _occurenceTypeName;
  String? _fIRNote;
  int? _responsibleIO;
  String? _responsibleIOName;
  String? _visitDate;
  String? _visitorReport;
  double? _latitude;
  double? _longitude;

  PoReportModel copyWith({
    int? poid,
    String? fIRNo,
    String? gDNo,
    String? fIRType,
    String? refDate,
    String? gDDate,
    String? pODate,
    String? dhara,
    int? occurenceType,
    String? occurenceTypeName,
    String? fIRNote,
    int? responsibleIO,
    String? responsibleIOName,
    String? visitDate,
    String? visitorReport,
    double? latitude,
    double? longitude,
  }) =>
      PoReportModel(
        poid: poid ?? _poid,
        fIRNo: fIRNo ?? _fIRNo,
        gDNo: gDNo ?? _gDNo,
        fIRType: fIRType ?? _fIRType,
        refDate: refDate ?? _refDate,
        gDDate: gDDate ?? _gDDate,
        pODate: pODate ?? _pODate,
        dhara: dhara ?? _dhara,
        occurenceType: occurenceType ?? _occurenceType,
        occurenceTypeName: occurenceTypeName ?? _occurenceTypeName,
        fIRNote: fIRNote ?? _fIRNote,
        responsibleIO: responsibleIO ?? _responsibleIO,
        responsibleIOName: responsibleIOName ?? _responsibleIOName,
        visitDate: visitDate ?? _visitDate,
        visitorReport: visitorReport ?? _visitorReport,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );

  int? get poid => _poid;

  String? get fIRNo => _fIRNo;

  String? get gDNo => _gDNo;

  String? get fIRType => _fIRType;

  String? get refDate => _refDate;

  String? get gDDate => _gDDate;

  String? get pODate => _pODate;

  String? get dhara => _dhara;

  int? get occurenceType => _occurenceType;

  String? get occurenceTypeName => _occurenceTypeName;

  String? get fIRNote => _fIRNote;

  int? get responsibleIO => _responsibleIO;

  String? get responsibleIOName => _responsibleIOName;

  String? get visitDate => _visitDate;

  String? get visitorReport => _visitorReport;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['POID'] = _poid;
    map['FIRNo'] = _fIRNo;
    map['GDNo'] = _gDNo;
    map['FIRType'] = _fIRType;
    map['RefDate'] = _refDate;
    map['GDDate'] = _gDDate;
    map['PODate'] = _pODate;
    map['Dhara'] = _dhara;
    map['OccurenceType'] = _occurenceType;
    map['OccurenceTypeName'] = _occurenceTypeName;
    map['FIRNote'] = _fIRNote;
    map['ResponsibleIO'] = _responsibleIO;
    map['ResponsibleIOName'] = _responsibleIOName;
    map['VisitDate'] = _visitDate;
    map['VisitorReport'] = _visitorReport;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    return map;
  }
}
