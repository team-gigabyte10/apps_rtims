import '../../../../core/model/data_response.dart';

class PoVisitResponse extends Serializable {
  final int? id;
  final int? pOID;
  final int? pOVisitID;
  final String? docName;
  final String? docType;
  final String? docFormat;
  final dynamic isMigrated;
  final dynamic imagePath;

  PoVisitResponse({
    this.id,
    this.pOID,
    this.pOVisitID,
    this.docName,
    this.docType,
    this.docFormat,
    this.isMigrated,
    this.imagePath,
  });

  PoVisitResponse copyWith({
    int? id,
    int? pOID,
    int? pOVisitID,
    String? docName,
    String? docType,
    String? docFormat,
    dynamic isMigrated,
    dynamic imagePath,
  }) {
    return PoVisitResponse(
      id: id ?? this.id,
      pOID: pOID ?? this.pOID,
      pOVisitID: pOVisitID ?? this.pOVisitID,
      docName: docName ?? this.docName,
      docType: docType ?? this.docType,
      docFormat: docFormat ?? this.docFormat,
      isMigrated: isMigrated ?? this.isMigrated,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  PoVisitResponse.fromJson(Map<String, dynamic> json)
      : id = json['Id'] as int?,
        pOID = json['POID'] as int?,
        pOVisitID = json['POVisitID'] as int?,
        docName = json['DocName'] as String?,
        docType = json['DocType'] as String?,
        docFormat = json['DocFormat'] as String?,
        isMigrated = json['IsMigrated'],
        imagePath = json['ImagePath'];

  Map<String, dynamic> toJson() => {
        'Id': id,
        'POID': pOID,
        'POVisitID': pOVisitID,
        'DocName': docName,
        'DocType': docType,
        'DocFormat': docFormat,
        'IsMigrated': isMigrated,
        'ImagePath': imagePath
      };
}
