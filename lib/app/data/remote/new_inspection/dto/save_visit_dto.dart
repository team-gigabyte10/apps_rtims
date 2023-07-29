import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// lstImage : [{"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"},{"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}]
/// BeatID : 1
/// VillageID : 2
/// VisitingLocation : 3
/// lstTaskHistory : [{"Id":1,"VisitID":2,"TaskId":3},{"Id":1,"VisitID":2,"TaskId":3}]
/// LocationShort : "sample string 4"
/// LocationDetails : "sample string 5"
/// VisitorReport : "sample string 6"
/// Latitude : 7.1
/// Longitude : 8.1
/// MobileNo : "sample string 9"
/// Audio : {"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}
/// BeatVisitID : 10
/// Video : {"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}
/// BeatNo : "sample string 11"

SaveVisitDto saveVisitDtoFromJson(String str) =>
    SaveVisitDto.fromJson(json.decode(str));

String saveVisitDtoToJson(SaveVisitDto data) => json.encode(data.toJson());

class SaveVisitDto extends Serializable {
  SaveVisitDto({
    List<LstImage>? lstImage,
    int? beatID,
    int? villageID,
    int? visitingLocation,
    List<LstTaskHistory>? lstTaskHistory,
    String? locationShort,
    String? locationDetails,
    String? visitorReport,
    double? latitude,
    double? longitude,
    String? mobileNo,
    Audio? audio,
    int? beatVisitID,
    Video? video,
    String? beatNo,
  }) {
    _lstImage = lstImage;
    _beatID = beatID;
    _villageID = villageID;
    _visitingLocation = visitingLocation;
    _lstTaskHistory = lstTaskHistory;
    _locationShort = locationShort;
    _locationDetails = locationDetails;
    _visitorReport = visitorReport;
    _latitude = latitude;
    _longitude = longitude;
    _mobileNo = mobileNo;
    _audio = audio;
    _beatVisitID = beatVisitID;
    _video = video;
    _beatNo = beatNo;
  }

  SaveVisitDto.fromJson(dynamic json) {
    if (json['lstImage'] != null) {
      _lstImage = [];
      json['lstImage'].forEach((v) {
        _lstImage?.add(LstImage.fromJson(v));
      });
    }
    _beatID = json['BeatID'];
    _villageID = json['VillageID'];
    _visitingLocation = json['VisitingLocation'];
    if (json['lstTaskHistory'] != null) {
      _lstTaskHistory = [];
      json['lstTaskHistory'].forEach((v) {
        _lstTaskHistory?.add(LstTaskHistory.fromJson(v));
      });
    }
    _locationShort = json['LocationShort'];
    _locationDetails = json['LocationDetails'];
    _visitorReport = json['VisitorReport'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _mobileNo = json['MobileNo'];
    _audio = json['Audio'] != null ? Audio.fromJson(json['Audio']) : null;
    _beatVisitID = json['BeatVisitID'];
    _video = json['Video'] != null ? Video.fromJson(json['Video']) : null;
    _beatNo = json['BeatNo'];
  }

  List<LstImage>? _lstImage;
  int? _beatID;
  int? _villageID;
  int? _visitingLocation;
  List<LstTaskHistory>? _lstTaskHistory;
  String? _locationShort;
  String? _locationDetails;
  String? _visitorReport;
  double? _latitude;
  double? _longitude;
  String? _mobileNo;
  Audio? _audio;
  int? _beatVisitID;
  Video? _video;
  String? _beatNo;

  SaveVisitDto copyWith({
    List<LstImage>? lstImage,
    int? beatID,
    int? villageID,
    int? visitingLocation,
    List<LstTaskHistory>? lstTaskHistory,
    String? locationShort,
    String? locationDetails,
    String? visitorReport,
    double? latitude,
    double? longitude,
    String? mobileNo,
    Audio? audio,
    int? beatVisitID,
    Video? video,
    String? beatNo,
  }) =>
      SaveVisitDto(
        lstImage: lstImage ?? _lstImage,
        beatID: beatID ?? _beatID,
        villageID: villageID ?? _villageID,
        visitingLocation: visitingLocation ?? _visitingLocation,
        lstTaskHistory: lstTaskHistory ?? _lstTaskHistory,
        locationShort: locationShort ?? _locationShort,
        locationDetails: locationDetails ?? _locationDetails,
        visitorReport: visitorReport ?? _visitorReport,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        mobileNo: mobileNo ?? _mobileNo,
        audio: audio ?? _audio,
        beatVisitID: beatVisitID ?? _beatVisitID,
        video: video ?? _video,
        beatNo: beatNo ?? _beatNo,
      );

  List<LstImage>? get lstImage => _lstImage;

  int? get beatID => _beatID;

  int? get villageID => _villageID;

  int? get visitingLocation => _visitingLocation;

  List<LstTaskHistory>? get lstTaskHistory => _lstTaskHistory;

  String? get locationShort => _locationShort;

  String? get locationDetails => _locationDetails;

  String? get visitorReport => _visitorReport;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  String? get mobileNo => _mobileNo;

  Audio? get audio => _audio;

  int? get beatVisitID => _beatVisitID;

  Video? get video => _video;

  String? get beatNo => _beatNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_lstImage != null) {
      map['lstImage'] = _lstImage?.map((v) => v.toJson()).toList();
    }
    map['BeatID'] = _beatID;
    map['VillageID'] = _villageID;
    map['VisitingLocation'] = _visitingLocation;
    if (_lstTaskHistory != null) {
      map['lstTaskHistory'] = _lstTaskHistory?.map((v) => v.toJson()).toList();
    }
    map['LocationShort'] = _locationShort;
    map['LocationDetails'] = _locationDetails;
    map['VisitorReport'] = _visitorReport;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['MobileNo'] = _mobileNo;
    if (_audio != null) {
      map['Audio'] = _audio?.toJson();
    }
    map['BeatVisitID'] = _beatVisitID;
    if (_video != null) {
      map['Video'] = _video?.toJson();
    }
    map['BeatNo'] = _beatNo;
    return map;
  }
}

/// Name : "sample string 1"
/// Content : "sample string 2"
/// Format : "sample string 3"

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    String? name,
    String? content,
    String? format,
  }) {
    _name = name;
    _content = content;
    _format = format;
  }

  Video.fromJson(dynamic json) {
    _name = json['Name'];
    _content = json['Content'];
    _format = json['Format'];
  }

  String? _name;
  String? _content;
  String? _format;

  Video copyWith({
    String? name,
    String? content,
    String? format,
  }) =>
      Video(
        name: name ?? _name,
        content: content ?? _content,
        format: format ?? _format,
      );

  String? get name => _name;

  String? get content => _content;

  String? get format => _format;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Content'] = _content;
    map['Format'] = _format;
    return map;
  }
}

/// Name : "sample string 1"
/// Content : "sample string 2"
/// Format : "sample string 3"

Audio audioFromJson(String str) => Audio.fromJson(json.decode(str));

String audioToJson(Audio data) => json.encode(data.toJson());

class Audio {
  Audio({
    String? name,
    String? content,
    String? format,
  }) {
    _name = name;
    _content = content;
    _format = format;
  }

  Audio.fromJson(dynamic json) {
    _name = json['Name'];
    _content = json['Content'];
    _format = json['Format'];
  }

  String? _name;
  String? _content;
  String? _format;

  Audio copyWith({
    String? name,
    String? content,
    String? format,
  }) =>
      Audio(
        name: name ?? _name,
        content: content ?? _content,
        format: format ?? _format,
      );

  String? get name => _name;

  String? get content => _content;

  String? get format => _format;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Content'] = _content;
    map['Format'] = _format;
    return map;
  }
}

/// Id : 1
/// VisitID : 2
/// TaskId : 3

LstTaskHistory lstTaskHistoryFromJson(String str) =>
    LstTaskHistory.fromJson(json.decode(str));

String lstTaskHistoryToJson(LstTaskHistory data) => json.encode(data.toJson());

class LstTaskHistory {
  LstTaskHistory({
    int? id,
    int? visitID,
    int? taskId,
  }) {
    _id = id;
    _visitID = visitID;
    _taskId = taskId;
  }

  LstTaskHistory.fromJson(dynamic json) {
    _id = json['Id'];
    _visitID = json['VisitID'];
    _taskId = json['TaskId'];
  }

  int? _id;
  int? _visitID;
  int? _taskId;

  LstTaskHistory copyWith({
    int? id,
    int? visitID,
    int? taskId,
  }) =>
      LstTaskHistory(
        id: id ?? _id,
        visitID: visitID ?? _visitID,
        taskId: taskId ?? _taskId,
      );

  int? get id => _id;

  int? get visitID => _visitID;

  int? get taskId => _taskId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['VisitID'] = _visitID;
    map['TaskId'] = _taskId;
    return map;
  }
}

/// Name : "sample string 1"
/// Content : "sample string 2"
/// Format : "sample string 3"

LstImage lstImageFromJson(String str) => LstImage.fromJson(json.decode(str));

String lstImageToJson(LstImage data) => json.encode(data.toJson());

class LstImage {
  LstImage({
    String? name,
    String? content,
    String? format,
  }) {
    _name = name;
    _content = content;
    _format = format;
  }

  LstImage.fromJson(dynamic json) {
    _name = json['Name'];
    _content = json['Content'];
    _format = json['Format'];
  }

  String? _name;
  String? _content;
  String? _format;

  LstImage copyWith({
    String? name,
    String? content,
    String? format,
  }) =>
      LstImage(
        name: name ?? _name,
        content: content ?? _content,
        format: format ?? _format,
      );

  String? get name => _name;

  String? get content => _content;

  String? get format => _format;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Content'] = _content;
    map['Format'] = _format;
    return map;
  }
}
