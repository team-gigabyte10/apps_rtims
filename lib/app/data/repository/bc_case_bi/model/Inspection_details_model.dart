import 'dart:convert';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';

import 'details.dart';

/// applicationFileMaster : {"applicationFileMasterID":10,"refNo":"২৫.৪৭.১৫০০.০৭২.৪৩.২১৩.২৩","applicantName":"১.মোঃ নোমান ফারুকী,২.মোঃ ফাহাদ ইকবাল,৩.মোঃ ফজলুল করিম,৪.মোঃ ওমর ফারুক ৫.মোঃ আমান উল্লাহ ৬.মোঃ মাকসুদ হোসাইন পিতা: ১.নুরুল ইসলাম ফারুকী,২.মোঃ দুলা মিয়া,৩.মোঃ নুরুল করিম,৪.মোঃ আহসান উল্লাহ ৫.মোঃ শামসুল হক ৬.মোঃ আবুল কাশেম মিয়া","approvalDate":"2023-05-26T00:00:00","applicationType":4,"rsNo":"৪০৮৯(অংশ)","bsNo":"পুর্ব নাসিরাবাদ","thanaID":259,"mouzaID":1008,"dpzid":0,"road":"696161651","isVisited":false,"latitude":100,"longitude":200,"createdBy":27,"createdDate":"2023-05-27T13:04:09.673","updatedBy":27,"updatedDate":"2023-05-28T14:42:17.857"}
/// details : {"inspectionDetailsBCCaseID":0,"applicationFileMasterID":0,"landOwnerName":null,"isLandUnderLease":false,"leaseYear":null,"actualProposedSizeNorth":null,"actualProposedSizeSouth":null,"actualProposedSizeEast":null,"actualProposedSizeWest":null,"actualProposedSizeLandQty":null,"isApplicantLandOwner":false,"asceticOfPlace":null,"rsKhotian":null,"layOutPlotNo":null,"landArea":null,"proposedBuldingEnvelop1stFloor":null,"proposedBuldingEnvelopFrom2ndFloor":null,"proposedBuldingEnvelopTillFloor":null,"proposedBuldingEnvelopStair":null,"proposedBuldingEnvelopTotal":null,"proposedBuldingEnvelopParkingSpace":null,"isAnyExistingBuilding":false,"existingBuildingNature":null,"existingBuildingSize":null,"structureToProsture":null,"isNearbyOpenSpaceOk":null,"connectedRoadName":null,"connectedRoadWidth":null,"connectedRoadDirection":null,"createdBy":0,"createdDate":"0001-01-01T00:00:00","updatedBy":0,"updatedDate":"0001-01-01T00:00:00"}

InspectionDetailsModel inspectionDetailsModelFromJson(String str) =>
    InspectionDetailsModel.fromJson(json.decode(str));

String inspectionDetailsModelToJson(InspectionDetailsModel data) =>
    json.encode(data.toJson());

class InspectionDetailsModel extends Serializable {
  InspectionDetailsModel({
    BcCaseBiFileModel? applicationFileMaster,
    Details? details,
  }) {
    _applicationFileMaster = applicationFileMaster;
    _details = details;
  }

  InspectionDetailsModel.fromJson(dynamic json) {
    _applicationFileMaster = json['applicationFileMaster'] != null
        ? BcCaseBiFileModel.fromJson(json['applicationFileMaster'])
        : null;
    _details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  BcCaseBiFileModel? _applicationFileMaster;
  Details? _details;

  InspectionDetailsModel copyWith({
    BcCaseBiFileModel? applicationFileMaster,
    Details? details,
  }) =>
      InspectionDetailsModel(
        applicationFileMaster: applicationFileMaster ?? _applicationFileMaster,
        details: details ?? _details,
      );

  BcCaseBiFileModel? get applicationFileMaster => _applicationFileMaster;

  Details? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_applicationFileMaster != null) {
      map['applicationFileMaster'] = _applicationFileMaster?.toJson();
    }
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    return map;
  }
}
