import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// Id : 850650
/// BeatVisitID : 406016
/// DocType : "Audio"
/// DocName : "1623_11042023144330119.wav"
/// DocFormat : ".wav"
/// IsMigrated : null
/// ImagePath : null

BeatVisitResponse beatVisitResponseFromJson(String str) =>
    BeatVisitResponse.fromJson(json.decode(str));

String beatVisitResponseToJson(BeatVisitResponse data) =>
    json.encode(data.toJson());

class BeatVisitResponse extends Serializable {
  BeatVisitResponse({
    int? id,
    int? beatVisitID,
    String? docType,
    String? docName,
    String? docFormat,
    dynamic isMigrated,
    dynamic imagePath,
  }) {
    _id = id;
    _beatVisitID = beatVisitID;
    _docType = docType;
    _docName = docName;
    _docFormat = docFormat;
    _isMigrated = isMigrated;
    _imagePath = imagePath;
  }

  BeatVisitResponse.fromJson(dynamic json) {
    _id = json['Id'];
    _beatVisitID = json['BeatVisitID'];
    _docType = json['DocType'];
    _docName = json['DocName'];
    _docFormat = json['DocFormat'];
    _isMigrated = json['IsMigrated'];
    _imagePath = json['ImagePath'];
  }

  int? _id;
  int? _beatVisitID;
  String? _docType;
  String? _docName;
  String? _docFormat;
  dynamic _isMigrated;
  dynamic _imagePath;

  BeatVisitResponse copyWith({
    int? id,
    int? beatVisitID,
    String? docType,
    String? docName,
    String? docFormat,
    dynamic isMigrated,
    dynamic imagePath,
  }) =>
      BeatVisitResponse(
        id: id ?? _id,
        beatVisitID: beatVisitID ?? _beatVisitID,
        docType: docType ?? _docType,
        docName: docName ?? _docName,
        docFormat: docFormat ?? _docFormat,
        isMigrated: isMigrated ?? _isMigrated,
        imagePath: imagePath ?? _imagePath,
      );

  int? get id => _id;

  int? get beatVisitID => _beatVisitID;

  String? get docType => _docType;

  String? get docName => _docName;

  String? get docFormat => _docFormat;

  dynamic get isMigrated => _isMigrated;

  dynamic get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['BeatVisitID'] = _beatVisitID;
    map['DocType'] = _docType;
    map['DocName'] = _docName;
    map['DocFormat'] = _docFormat;
    map['IsMigrated'] = _isMigrated;
    map['ImagePath'] = _imagePath;
    return map;
  }
}
