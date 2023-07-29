import 'dart:convert';

import '../../../../core/model/data_response.dart';
import '../../new_inspection/dto/save_visit_dto.dart';

/// POID : 1
/// OccurenceType : 2
/// POLocation : 3
/// VisitingLocation : 4
/// OccurenceDate : "2023-04-05T14:36:42.0560809+06:00"
/// ShortNote : "sample string 6"
/// Video : {"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}
/// Audio : {"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}
/// lstImage : [{"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"},{"Name":"sample string 1","Content":"sample string 2","Format":"sample string 3"}]
/// POVisitID : 7
/// IsPOAndVisitingLocationSame : true
/// VisitLocation : {"Id":1,"LatitudeInt":2,"LongitudeInt":3,"Latitude":4.1,"Longitude":5.1,"LocationShort":"sample string 6","LocationDetails":"sample string 7","UnionID":8,"DivisionID":9,"DistrictID":10,"ThanaID":11,"VillageID":12,"CreatedBy":13,"CapturedDate":"2023-04-05T14:36:42.0560809+06:00","UpdatedBy":14,"UpdatedDate":"2023-04-05T14:36:42.0560809+06:00","Status":1,"POMasterID":1}
/// FIRType : "sample string 9"
/// FIRNo : "sample string 10"
/// Latitude : 11.1
/// Longitude : 12.1
/// LocationShort : "sample string 13"
/// AttachmentPath : "sample string 14"
/// RefDate : "2023-04-05T14:36:42.0560809+06:00"

SavePoDto savePoDtoFromJson(String str) => SavePoDto.fromJson(json.decode(str));

String savePoDtoToJson(SavePoDto data) => json.encode(data.toJson());

class SavePoDto extends Serializable {
  SavePoDto({
    int? poid,
    int? occurenceType,
    int? pOLocation,
    int? visitingLocation,
    String? occurenceDate,
    String? shortNote,
    Video? video,
    Audio? audio,
    List<LstImage>? lstImage,
    int? pOVisitID,
    bool? isPOAndVisitingLocationSame,
    VisitLocation? visitLocation,
    String? fIRType,
    String? fIRNo,
    double? latitude,
    double? longitude,
    String? locationShort,
    String? locationDetails,
    String? attachmentPath,
    String? refDate,
  }) {
    _poid = poid;
    _occurenceType = occurenceType;
    _pOLocation = pOLocation;
    _visitingLocation = visitingLocation;
    _occurenceDate = occurenceDate;
    _shortNote = shortNote;
    _video = video;
    _audio = audio;
    _lstImage = lstImage;
    _pOVisitID = pOVisitID;
    _isPOAndVisitingLocationSame = isPOAndVisitingLocationSame;
    _visitLocation = visitLocation;
    _fIRType = fIRType;
    _fIRNo = fIRNo;
    _latitude = latitude;
    _longitude = longitude;
    _locationShort = locationShort;
    _locationDetails = locationDetails;
    _attachmentPath = attachmentPath;
    _refDate = refDate;
  }

  SavePoDto.fromJson(dynamic json) {
    _poid = json['POID'];
    _occurenceType = json['OccurenceType'];
    _pOLocation = json['POLocation'];
    _visitingLocation = json['VisitingLocation'];
    _occurenceDate = json['OccurenceDate'];
    _shortNote = json['ShortNote'];
    _video = json['Video'] != null ? Video.fromJson(json['Video']) : null;
    _audio = json['Audio'] != null ? Audio.fromJson(json['Audio']) : null;
    if (json['lstImage'] != null) {
      _lstImage = [];
      json['lstImage'].forEach((v) {
        _lstImage?.add(LstImage.fromJson(v));
      });
    }
    _pOVisitID = json['POVisitID'];
    _isPOAndVisitingLocationSame = json['IsPOAndVisitingLocationSame'];
    _visitLocation = json['VisitLocation'] != null
        ? VisitLocation.fromJson(json['VisitLocation'])
        : null;
    _fIRType = json['FIRType'];
    _fIRNo = json['FIRNo'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _locationShort = json['LocationShort'];
    _locationDetails = json['LocationDetails'];
    _attachmentPath = json['AttachmentPath'];
    _refDate = json['RefDate'];
  }

  int? _poid;
  int? _occurenceType;
  int? _pOLocation;
  int? _visitingLocation;
  String? _occurenceDate;
  String? _shortNote;
  Video? _video;
  Audio? _audio;
  List<LstImage>? _lstImage;
  int? _pOVisitID;
  bool? _isPOAndVisitingLocationSame;
  VisitLocation? _visitLocation;
  String? _fIRType;
  String? _fIRNo;
  double? _latitude;
  double? _longitude;
  String? _locationShort;
  String? _locationDetails;
  String? _attachmentPath;
  String? _refDate;

  SavePoDto copyWith({
    int? poid,
    int? occurenceType,
    int? pOLocation,
    int? visitingLocation,
    String? occurenceDate,
    String? shortNote,
    Video? video,
    Audio? audio,
    List<LstImage>? lstImage,
    int? pOVisitID,
    bool? isPOAndVisitingLocationSame,
    VisitLocation? visitLocation,
    String? fIRType,
    String? fIRNo,
    double? latitude,
    double? longitude,
    String? locationShort,
    String? locationDetails,
    String? attachmentPath,
    String? refDate,
  }) =>
      SavePoDto(
        poid: poid ?? _poid,
        occurenceType: occurenceType ?? _occurenceType,
        pOLocation: pOLocation ?? _pOLocation,
        visitingLocation: visitingLocation ?? _visitingLocation,
        occurenceDate: occurenceDate ?? _occurenceDate,
        shortNote: shortNote ?? _shortNote,
        video: video ?? _video,
        audio: audio ?? _audio,
        lstImage: lstImage ?? _lstImage,
        pOVisitID: pOVisitID ?? _pOVisitID,
        isPOAndVisitingLocationSame:
            isPOAndVisitingLocationSame ?? _isPOAndVisitingLocationSame,
        visitLocation: visitLocation ?? _visitLocation,
        fIRType: fIRType ?? _fIRType,
        fIRNo: fIRNo ?? _fIRNo,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        locationShort: locationShort ?? _locationShort,
        locationDetails: locationDetails ?? _locationDetails,
        attachmentPath: attachmentPath ?? _attachmentPath,
        refDate: refDate ?? _refDate,
      );

  int? get poid => _poid;

  int? get occurenceType => _occurenceType;

  int? get pOLocation => _pOLocation;

  int? get visitingLocation => _visitingLocation;

  String? get occurenceDate => _occurenceDate;

  String? get shortNote => _shortNote;

  Video? get video => _video;

  Audio? get audio => _audio;

  List<LstImage>? get lstImage => _lstImage;

  int? get pOVisitID => _pOVisitID;

  bool? get isPOAndVisitingLocationSame => _isPOAndVisitingLocationSame;

  VisitLocation? get visitLocation => _visitLocation;

  String? get fIRType => _fIRType;

  String? get fIRNo => _fIRNo;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  String? get locationShort => _locationShort;

  String? get locationDetails => _locationDetails;

  String? get attachmentPath => _attachmentPath;

  String? get refDate => _refDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['POID'] = _poid;
    map['OccurenceType'] = _occurenceType;
    map['POLocation'] = _pOLocation;
    map['VisitingLocation'] = _visitingLocation;
    map['OccurenceDate'] = _occurenceDate;
    map['ShortNote'] = _shortNote;
    if (_video != null) {
      map['Video'] = _video?.toJson();
    }
    if (_audio != null) {
      map['Audio'] = _audio?.toJson();
    }
    if (_lstImage != null) {
      map['lstImage'] = _lstImage?.map((v) => v.toJson()).toList();
    }
    map['POVisitID'] = _pOVisitID;
    map['IsPOAndVisitingLocationSame'] = _isPOAndVisitingLocationSame;
    if (_visitLocation != null) {
      map['VisitLocation'] = _visitLocation?.toJson();
    }
    map['FIRType'] = _fIRType;
    map['FIRNo'] = _fIRNo;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['LocationShort'] = _locationShort;
    map['LocationDetails'] = _locationDetails;
    map['AttachmentPath'] = _attachmentPath;
    map['RefDate'] = _refDate;
    return map;
  }
}

/// Id : 1
/// LatitudeInt : 2
/// LongitudeInt : 3
/// Latitude : 4.1
/// Longitude : 5.1
/// LocationShort : "sample string 6"
/// LocationDetails : "sample string 7"
/// UnionID : 8
/// DivisionID : 9
/// DistrictID : 10
/// ThanaID : 11
/// VillageID : 12
/// CreatedBy : 13
/// CapturedDate : "2023-04-05T14:36:42.0560809+06:00"
/// UpdatedBy : 14
/// UpdatedDate : "2023-04-05T14:36:42.0560809+06:00"
/// Status : 1
/// POMasterID : 1

VisitLocation visitLocationFromJson(String str) =>
    VisitLocation.fromJson(json.decode(str));

String visitLocationToJson(VisitLocation data) => json.encode(data.toJson());

class VisitLocation {
  VisitLocation({
    int? id,
    int? latitudeInt,
    int? longitudeInt,
    double? latitude,
    double? longitude,
    String? locationShort,
    String? locationDetails,
    int? unionID,
    int? divisionID,
    int? districtID,
    int? thanaID,
    int? villageID,
    int? createdBy,
    String? capturedDate,
    int? updatedBy,
    String? updatedDate,
    int? status,
    int? pOMasterID,
  }) {
    _id = id;
    _latitudeInt = latitudeInt;
    _longitudeInt = longitudeInt;
    _latitude = latitude;
    _longitude = longitude;
    _locationShort = locationShort;
    _locationDetails = locationDetails;
    _unionID = unionID;
    _divisionID = divisionID;
    _districtID = districtID;
    _thanaID = thanaID;
    _villageID = villageID;
    _createdBy = createdBy;
    _capturedDate = capturedDate;
    _updatedBy = updatedBy;
    _updatedDate = updatedDate;
    _status = status;
    _pOMasterID = pOMasterID;
  }

  VisitLocation.fromJson(dynamic json) {
    _id = json['Id'];
    _latitudeInt = json['LatitudeInt'];
    _longitudeInt = json['LongitudeInt'];
    _latitude = json['Latitude'];
    _longitude = json['Longitude'];
    _locationShort = json['LocationShort'];
    _locationDetails = json['LocationDetails'];
    _unionID = json['UnionID'];
    _divisionID = json['DivisionID'];
    _districtID = json['DistrictID'];
    _thanaID = json['ThanaID'];
    _villageID = json['VillageID'];
    _createdBy = json['CreatedBy'];
    _capturedDate = json['CapturedDate'];
    _updatedBy = json['UpdatedBy'];
    _updatedDate = json['UpdatedDate'];
    _status = json['Status'];
    _pOMasterID = json['POMasterID'];
  }

  int? _id;
  int? _latitudeInt;
  int? _longitudeInt;
  double? _latitude;
  double? _longitude;
  String? _locationShort;
  String? _locationDetails;
  int? _unionID;
  int? _divisionID;
  int? _districtID;
  int? _thanaID;
  int? _villageID;
  int? _createdBy;
  String? _capturedDate;
  int? _updatedBy;
  String? _updatedDate;
  int? _status;
  int? _pOMasterID;

  VisitLocation copyWith({
    int? id,
    int? latitudeInt,
    int? longitudeInt,
    double? latitude,
    double? longitude,
    String? locationShort,
    String? locationDetails,
    int? unionID,
    int? divisionID,
    int? districtID,
    int? thanaID,
    int? villageID,
    int? createdBy,
    String? capturedDate,
    int? updatedBy,
    String? updatedDate,
    int? status,
    int? pOMasterID,
  }) =>
      VisitLocation(
        id: id ?? _id,
        latitudeInt: latitudeInt ?? _latitudeInt,
        longitudeInt: longitudeInt ?? _longitudeInt,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        locationShort: locationShort ?? _locationShort,
        locationDetails: locationDetails ?? _locationDetails,
        unionID: unionID ?? _unionID,
        divisionID: divisionID ?? _divisionID,
        districtID: districtID ?? _districtID,
        thanaID: thanaID ?? _thanaID,
        villageID: villageID ?? _villageID,
        createdBy: createdBy ?? _createdBy,
        capturedDate: capturedDate ?? _capturedDate,
        updatedBy: updatedBy ?? _updatedBy,
        updatedDate: updatedDate ?? _updatedDate,
        status: status ?? _status,
        pOMasterID: pOMasterID ?? _pOMasterID,
      );

  int? get id => _id;

  int? get latitudeInt => _latitudeInt;

  int? get longitudeInt => _longitudeInt;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  String? get locationShort => _locationShort;

  String? get locationDetails => _locationDetails;

  int? get unionID => _unionID;

  int? get divisionID => _divisionID;

  int? get districtID => _districtID;

  int? get thanaID => _thanaID;

  int? get villageID => _villageID;

  int? get createdBy => _createdBy;

  String? get capturedDate => _capturedDate;

  int? get updatedBy => _updatedBy;

  String? get updatedDate => _updatedDate;

  int? get status => _status;

  int? get pOMasterID => _pOMasterID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['LatitudeInt'] = _latitudeInt;
    map['LongitudeInt'] = _longitudeInt;
    map['Latitude'] = _latitude;
    map['Longitude'] = _longitude;
    map['LocationShort'] = _locationShort;
    map['LocationDetails'] = _locationDetails;
    map['UnionID'] = _unionID;
    map['DivisionID'] = _divisionID;
    map['DistrictID'] = _districtID;
    map['ThanaID'] = _thanaID;
    map['VillageID'] = _villageID;
    map['CreatedBy'] = _createdBy;
    map['CapturedDate'] = _capturedDate;
    map['UpdatedBy'] = _updatedBy;
    map['UpdatedDate'] = _updatedDate;
    map['Status'] = _status;
    map['POMasterID'] = _pOMasterID;
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
