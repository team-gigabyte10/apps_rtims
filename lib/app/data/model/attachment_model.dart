import 'dart:convert';

import 'package:apps_rtims/app/core/core.dart';
/// attachmentID : 30
/// referenceType : 0
/// referenceID : 10
/// attachementTypeID : 1
/// fileFormat : ".png"
/// attachmentName : "31052023150636040_0000000010.png"
/// attachmentLink : "2023"
/// fileContent : null
/// notes : null
/// status : 0
/// createdBy : 27
/// createdDate : "2023-05-31T15:06:36.04"
/// updatedBy : 27
/// updatedDate : "2023-05-31T15:06:36.04"

AttachmentModel poAttachmentModelFromJson(String str) => AttachmentModel.fromJson(json.decode(str));
String poAttachmentModelToJson(AttachmentModel data) => json.encode(data.toJson());
class AttachmentModel extends Serializable {
  AttachmentModel({
      int? attachmentID, 
      int? referenceType, 
      int? referenceID, 
      int? attachementTypeID, 
      String? fileFormat, 
      String? attachmentName, 
      String? attachmentLink, 
      dynamic fileContent, 
      dynamic notes, 
      int? status, 
      int? createdBy, 
      String? createdDate, 
      int? updatedBy, 
      String? updatedDate,}){
    _attachmentID = attachmentID;
    _referenceType = referenceType;
    _referenceID = referenceID;
    _attachementTypeID = attachementTypeID;
    _fileFormat = fileFormat;
    _attachmentName = attachmentName;
    _attachmentLink = attachmentLink;
    _fileContent = fileContent;
    _notes = notes;
    _status = status;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _updatedBy = updatedBy;
    _updatedDate = updatedDate;
}

  AttachmentModel.fromJson(dynamic json) {
    _attachmentID = json['attachmentID'];
    _referenceType = json['referenceType'];
    _referenceID = json['referenceID'];
    _attachementTypeID = json['attachementTypeID'];
    _fileFormat = json['fileFormat'];
    _attachmentName = json['attachmentName'];
    _attachmentLink = json['attachmentLink'];
    _fileContent = json['fileContent'];
    _notes = json['notes'];
    _status = json['status'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _updatedBy = json['updatedBy'];
    _updatedDate = json['updatedDate'];
  }
  int? _attachmentID;
  int? _referenceType;
  int? _referenceID;
  int? _attachementTypeID;
  String? _fileFormat;
  String? _attachmentName;
  String? _attachmentLink;
  dynamic _fileContent;
  dynamic _notes;
  int? _status;
  int? _createdBy;
  String? _createdDate;
  int? _updatedBy;
  String? _updatedDate;
AttachmentModel copyWith({  int? attachmentID,
  int? referenceType,
  int? referenceID,
  int? attachementTypeID,
  String? fileFormat,
  String? attachmentName,
  String? attachmentLink,
  dynamic fileContent,
  dynamic notes,
  int? status,
  int? createdBy,
  String? createdDate,
  int? updatedBy,
  String? updatedDate,
}) => AttachmentModel(  attachmentID: attachmentID ?? _attachmentID,
  referenceType: referenceType ?? _referenceType,
  referenceID: referenceID ?? _referenceID,
  attachementTypeID: attachementTypeID ?? _attachementTypeID,
  fileFormat: fileFormat ?? _fileFormat,
  attachmentName: attachmentName ?? _attachmentName,
  attachmentLink: attachmentLink ?? _attachmentLink,
  fileContent: fileContent ?? _fileContent,
  notes: notes ?? _notes,
  status: status ?? _status,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  updatedBy: updatedBy ?? _updatedBy,
  updatedDate: updatedDate ?? _updatedDate,
);
  int? get attachmentID => _attachmentID;
  int? get referenceType => _referenceType;
  int? get referenceID => _referenceID;
  int? get attachementTypeID => _attachementTypeID;
  String? get fileFormat => _fileFormat;
  String? get attachmentName => _attachmentName;
  String? get attachmentLink => _attachmentLink;
  dynamic get fileContent => _fileContent;
  dynamic get notes => _notes;
  int? get status => _status;
  int? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  int? get updatedBy => _updatedBy;
  String? get updatedDate => _updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['attachmentID'] = _attachmentID;
    map['referenceType'] = _referenceType;
    map['referenceID'] = _referenceID;
    map['attachementTypeID'] = _attachementTypeID;
    map['fileFormat'] = _fileFormat;
    map['attachmentName'] = _attachmentName;
    map['attachmentLink'] = _attachmentLink;
    map['fileContent'] = _fileContent;
    map['notes'] = _notes;
    map['status'] = _status;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['updatedBy'] = _updatedBy;
    map['updatedDate'] = _updatedDate;
    return map;
  }

}