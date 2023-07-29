import 'dart:convert';

import 'package:apps_rtims/app/core/core.dart';
/// applicationFileMasterID : 10
/// refNo : "২৫.৪৭.১৫০০.০৭২.৪৩.২১৩.২৩"
/// applicantName : "১.মোঃ নোমান ফারুকী,২.মোঃ ফাহাদ ইকবাল,৩.মোঃ ফজলুল করিম,৪.মোঃ ওমর ফারুক ৫.মোঃ আমান উল্লাহ ৬.মোঃ মাকসুদ হোসাইন পিতা: ১.নুরুল ইসলাম ফারুকী,২.মোঃ দুলা মিয়া,৩.মোঃ নুরুল করিম,৪.মোঃ আহসান উল্লাহ ৫.মোঃ শামসুল হক ৬.মোঃ আবুল কাশেম মিয়া"
/// approvalDate : "2023-05-26T00:00:00"
/// applicationType : 2
/// rsNo : "৪০৮৯(অংশ)"
/// bsNo : "পুর্ব নাসিরাবাদ"
/// thanaID : 259
/// mouzaID : 1008
/// dpzid : 0
/// road : "696161651"
/// isVisited : false
/// latitude : 100.000033
/// longitude : 200.00044
/// createdBy : 0
/// createdDate : "0001-01-01T00:00:00"
/// updatedBy : 0
/// updatedDate : "0001-01-01T00:00:00"
/// approvalDateSt : "26-05-2023"
/// thanaName : "Bandar"
/// thanaNameBangla : "Bandar"
/// mouzaName : "Char Mohora"
/// mouzaNameBangla : "চর মোহরা"
/// dpzName : null
/// dpzNameBangla : null
/// userID : 0
/// userFullName : null
/// assignBy : 0
/// assignByName : null
/// assignByNameBangla : null
/// targetDate : "0001-01-01T00:00:00"
/// assignDate : "2023-05-26T00:00:00"
/// applicationTypeSt : "BCCase"

BcCaseBiFileModel bcCaseBiFileModelFromJson(String str) => BcCaseBiFileModel.fromJson(json.decode(str));
String bcCaseBiFileModelToJson(BcCaseBiFileModel data) => json.encode(data.toJson());
class BcCaseBiFileModel  extends Serializable{
  BcCaseBiFileModel({
      int? applicationFileMasterID, 
      String? refNo, 
      String? applicantName, 
      String? approvalDate, 
      int? applicationType, 
      String? rsNo, 
      String? bsNo, 
      int? thanaID, 
      int? mouzaID, 
      int? dpzid, 
      String? road, 
      String? investigationOfficerID,
      bool? isVisited,
      double? latitude, 
      double? longitude, 
      int? createdBy, 
      String? createdDate, 
      int? updatedBy, 
      String? updatedDate, 
      String? approvalDateSt, 
      String? thanaName, 
      String? thanaNameBangla, 
      String? mouzaName, 
      String? mouzaNameBangla, 
      dynamic dpzName, 
      dynamic dpzNameBangla, 
      int? userID, 
      dynamic userFullName, 
      int? assignBy, 
      dynamic assignByName, 
      dynamic assignByNameBangla, 
      String? targetDate, 
      String? assignDate, 
      String? applicationTypeSt,}){
    _applicationFileMasterID = applicationFileMasterID;
    _refNo = refNo;
    _applicantName = applicantName;
    _approvalDate = approvalDate;
    _applicationType = applicationType;
    _rsNo = rsNo;
    _bsNo = bsNo;
    _thanaID = thanaID;
    _mouzaID = mouzaID;
    _dpzid = dpzid;
    _road = road;
    _investigationOfficerID = investigationOfficerID;
    _isVisited = isVisited;
    _latitude = latitude;
    _longitude = longitude;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _updatedBy = updatedBy;
    _updatedDate = updatedDate;
    _approvalDateSt = approvalDateSt;
    _thanaName = thanaName;
    _thanaNameBangla = thanaNameBangla;
    _mouzaName = mouzaName;
    _mouzaNameBangla = mouzaNameBangla;
    _dpzName = dpzName;
    _dpzNameBangla = dpzNameBangla;
    _userID = userID;
    _userFullName = userFullName;
    _assignBy = assignBy;
    _assignByName = assignByName;
    _assignByNameBangla = assignByNameBangla;
    _targetDate = targetDate;
    _assignDate = assignDate;
    _applicationTypeSt = applicationTypeSt;
}

  BcCaseBiFileModel.fromJson(dynamic json) {
    _applicationFileMasterID = json['applicationFileMasterID'];
    _refNo = json['refNo'];
    _applicantName = json['applicantName'];
    _approvalDate = json['approvalDate'];
    _applicationType = json['applicationType'];
    _rsNo = json['rsNo'];
    _bsNo = json['bsNo'];
    _thanaID = json['thanaID'];
    _mouzaID = json['mouzaID'];
    _dpzid = json['dpzid'];
    _road = json['road'];
    _investigationOfficerID = json['investigationOfficerID'];
    _isVisited = json['isVisited'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _updatedBy = json['updatedBy'];
    _updatedDate = json['updatedDate'];
    _approvalDateSt = json['approvalDateSt'];
    _thanaName = json['thanaName'];
    _thanaNameBangla = json['thanaNameBangla'];
    _mouzaName = json['mouzaName'];
    _mouzaNameBangla = json['mouzaNameBangla'];
    _dpzName = json['dpzName'];
    _dpzNameBangla = json['dpzNameBangla'];
    _userID = json['userID'];
    _userFullName = json['userFullName'];
    _assignBy = json['assignBy'];
    _assignByName = json['assignByName'];
    _assignByNameBangla = json['assignByNameBangla'];
    _targetDate = json['targetDate'];
    _assignDate = json['assignDate'];
    _applicationTypeSt = json['applicationTypeSt'];
  }
  int? _applicationFileMasterID;
  String? _refNo;
  String? _applicantName;
  String? _approvalDate;
  int? _applicationType;
  String? _rsNo;
  String? _bsNo;
  int? _thanaID;
  int? _mouzaID;
  int? _dpzid;
  String? _road;
  String? _investigationOfficerID;
  bool? _isVisited;
  double? _latitude;
  double? _longitude;
  int? _createdBy;
  String? _createdDate;
  int? _updatedBy;
  String? _updatedDate;
  String? _approvalDateSt;
  String? _thanaName;
  String? _thanaNameBangla;
  String? _mouzaName;
  String? _mouzaNameBangla;
  dynamic _dpzName;
  dynamic _dpzNameBangla;
  int? _userID;
  dynamic _userFullName;
  int? _assignBy;
  dynamic _assignByName;
  dynamic _assignByNameBangla;
  String? _targetDate;
  String? _assignDate;
  String? _applicationTypeSt;
BcCaseBiFileModel copyWith({  int? applicationFileMasterID,
  String? refNo,
  String? applicantName,
  String? approvalDate,
  int? applicationType,
  String? rsNo,
  String? bsNo,
  int? thanaID,
  int? mouzaID,
  int? dpzid,
  String? road,
  String? investigationOfficerID,
  bool? isVisited,
  double? latitude,
  double? longitude,
  int? createdBy,
  String? createdDate,
  int? updatedBy,
  String? updatedDate,
  String? approvalDateSt,
  String? thanaName,
  String? thanaNameBangla,
  String? mouzaName,
  String? mouzaNameBangla,
  dynamic dpzName,
  dynamic dpzNameBangla,
  int? userID,
  dynamic userFullName,
  int? assignBy,
  dynamic assignByName,
  dynamic assignByNameBangla,
  String? targetDate,
  String? assignDate,
  String? applicationTypeSt,
}) => BcCaseBiFileModel(  applicationFileMasterID: applicationFileMasterID ?? _applicationFileMasterID,
  refNo: refNo ?? _refNo,
  applicantName: applicantName ?? _applicantName,
  approvalDate: approvalDate ?? _approvalDate,
  applicationType: applicationType ?? _applicationType,
  rsNo: rsNo ?? _rsNo,
  bsNo: bsNo ?? _bsNo,
  thanaID: thanaID ?? _thanaID,
  mouzaID: mouzaID ?? _mouzaID,
  dpzid: dpzid ?? _dpzid,
  road: road ?? _road,
  investigationOfficerID: investigationOfficerID ?? _investigationOfficerID,
  isVisited: isVisited ?? _isVisited,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  updatedBy: updatedBy ?? _updatedBy,
  updatedDate: updatedDate ?? _updatedDate,
  approvalDateSt: approvalDateSt ?? _approvalDateSt,
  thanaName: thanaName ?? _thanaName,
  thanaNameBangla: thanaNameBangla ?? _thanaNameBangla,
  mouzaName: mouzaName ?? _mouzaName,
  mouzaNameBangla: mouzaNameBangla ?? _mouzaNameBangla,
  dpzName: dpzName ?? _dpzName,
  dpzNameBangla: dpzNameBangla ?? _dpzNameBangla,
  userID: userID ?? _userID,
  userFullName: userFullName ?? _userFullName,
  assignBy: assignBy ?? _assignBy,
  assignByName: assignByName ?? _assignByName,
  assignByNameBangla: assignByNameBangla ?? _assignByNameBangla,
  targetDate: targetDate ?? _targetDate,
  assignDate: assignDate ?? _assignDate,
  applicationTypeSt: applicationTypeSt ?? _applicationTypeSt,
);
  int? get applicationFileMasterID => _applicationFileMasterID;
  String? get refNo => _refNo;
  String? get applicantName => _applicantName;
  String? get approvalDate => _approvalDate;
  int? get applicationType => _applicationType;
  String? get rsNo => _rsNo;
  String? get bsNo => _bsNo;
  int? get thanaID => _thanaID;
  int? get mouzaID => _mouzaID;
  int? get dpzid => _dpzid;
  String? get road => _road;
  String? get investigationOfficerID => _investigationOfficerID;
  bool? get isVisited => _isVisited;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  int? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  int? get updatedBy => _updatedBy;
  String? get updatedDate => _updatedDate;
  String? get approvalDateSt => _approvalDateSt;
  String? get thanaName => _thanaName;
  String? get thanaNameBangla => _thanaNameBangla;
  String? get mouzaName => _mouzaName;
  String? get mouzaNameBangla => _mouzaNameBangla;
  dynamic get dpzName => _dpzName;
  dynamic get dpzNameBangla => _dpzNameBangla;
  int? get userID => _userID;
  dynamic get userFullName => _userFullName;
  int? get assignBy => _assignBy;
  dynamic get assignByName => _assignByName;
  dynamic get assignByNameBangla => _assignByNameBangla;
  String? get targetDate => _targetDate;
  String? get assignDate => _assignDate;
  String? get applicationTypeSt => _applicationTypeSt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['applicationFileMasterID'] = _applicationFileMasterID;
    map['refNo'] = _refNo;
    map['applicantName'] = _applicantName;
    map['approvalDate'] = _approvalDate;
    map['applicationType'] = _applicationType;
    map['rsNo'] = _rsNo;
    map['bsNo'] = _bsNo;
    map['thanaID'] = _thanaID;
    map['mouzaID'] = _mouzaID;
    map['dpzid'] = _dpzid;
    map['road'] = _road;
    map['investigationOfficerID'] = _investigationOfficerID;
    map['isVisited'] = _isVisited;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['updatedBy'] = _updatedBy;
    map['updatedDate'] = _updatedDate;
    map['approvalDateSt'] = _approvalDateSt;
    map['thanaName'] = _thanaName;
    map['thanaNameBangla'] = _thanaNameBangla;
    map['mouzaName'] = _mouzaName;
    map['mouzaNameBangla'] = _mouzaNameBangla;
    map['dpzName'] = _dpzName;
    map['dpzNameBangla'] = _dpzNameBangla;
    map['userID'] = _userID;
    map['userFullName'] = _userFullName;
    map['assignBy'] = _assignBy;
    map['assignByName'] = _assignByName;
    map['assignByNameBangla'] = _assignByNameBangla;
    map['targetDate'] = _targetDate;
    map['assignDate'] = _assignDate;
    map['applicationTypeSt'] = _applicationTypeSt;
    return map;
  }

}