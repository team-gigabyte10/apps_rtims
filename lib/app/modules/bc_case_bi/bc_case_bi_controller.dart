import 'dart:collection';

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/Inspection_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../data/repository/bc_case_bi/bc_case_bi_repository.dart';
import '../../data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import '../../data/repository/bc_case_bi/model/details.dart';
import '../../network/exceptions/base_exception.dart';
import '../dashboard/dashboard_controller.dart';

enum BoolType {
  YES,
  NO,
  NOT_APPLICABLE,
  NOTHING,
}

enum BuildingType { NOTHING, Null }

extension BuildingTypeExtension on BuildingType {
  int get number {
    switch (this) {
      case BuildingType.Null:
        return 1;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case BuildingType.Null:
        return "খালি";
      default:
        return "প্রকৃতি নির্বাচন করুন";
    }
  }
}

enum LandType { NOTHING, FirmingLand, LivingLand }

extension LandTypeExtension on LandType {
  int get number {
    switch (this) {
      case LandType.FirmingLand:
        return 1;
      case LandType.LivingLand:
        return 2;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case LandType.FirmingLand:
        return "কৃষি জমি";
      case LandType.LivingLand:
        return "বসত বাড়ি";
      default:
        return "জমি নির্বাচন করুন";
    }
  }
}

enum ElectricLineType { NOTHING, LowTension, HighTension }

extension ElectricLineTypeExtension on ElectricLineType {
  int get number {
    switch (this) {
      case ElectricLineType.LowTension:
        return 1;
      case ElectricLineType.HighTension:
        return 2;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case ElectricLineType.LowTension:
        return "লো টেনশন";
      case ElectricLineType.HighTension:
        return "হাই টেনশন";
      default:
        return "বৈদ্যুতিক লাইন নির্বাচন করুন";
    }
  }
}

enum DrainType { NOTHING, Ripe, Raw }

extension DrainTypeTypeExtension on DrainType {
  int get number {
    switch (this) {
      case DrainType.Ripe:
        return 1;
      case DrainType.Raw:
        return 2;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case DrainType.Ripe:
        return "পাকা";
      case DrainType.Raw:
        return "কাঁচা";
      default:
        return "ড্রেন নির্বাচন করুন";
    }
  }
}

class BcCaseBiController extends BaseController {
  final BcCaseBiRepository _bcCaseBiRepository =
      Get.find(tag: (BcCaseBiRepository).toString());

  Rx<BoolType> isLandUnderLease = BoolType.NOTHING.obs;
  Rx<BoolType> isApplicantLandOwner = BoolType.NOTHING.obs;
  Rx<BoolType> isAnyExistingBuilding = BoolType.NOTHING.obs;

  Rx<BoolType> isNearbyOpenSpaceOk = BoolType.NOTHING.obs;
  Rx<BoolType> isLandSiteWorkStart = BoolType.NOTHING.obs;
  Rx<BoolType> hasPreviousStructureApproval = BoolType.NOTHING.obs;
  Rx<BoolType> isApplicationInformationOK = BoolType.NOTHING.obs;
  Rx<BoolType> isHillLand = BoolType.NOTHING.obs;
  Rx<BoolType> isHillNear = BoolType.NOTHING.obs;
  Rx<BoolType> isVisibleAllStructureIn12M = BoolType.NOTHING.obs;
  Rx<BoolType> isNearDrain = BoolType.NOTHING.obs;
  Rx<BoolType> isEffectedNaturalWaterFlow = BoolType.NOTHING.obs;
  Rx<BoolType> isPossibleToConnectDrain = BoolType.NOTHING.obs;
  Rx<BoolType> hasElectricStructureIn10M = BoolType.NOTHING.obs;
  Rx<BoolType> hasNearDefenceStructure = BoolType.NOTHING.obs;
  Rx<BoolType> isLakeInProposedLand = BoolType.NOTHING.obs;
  Rx<BoolType> isLandFillFromLake = BoolType.NOTHING.obs;
  Rx<BoolType> isHistoricalStructureInProposedLand = BoolType.NOTHING.obs;
  Rx<BoolType> hasNaturalEffection = BoolType.NOTHING.obs;

  Rx<ElectricLineType> selectedElectricLineType = ElectricLineType.NOTHING.obs;
  Rx<BuildingType> selectedBuildingType = BuildingType.NOTHING.obs;
  Rx<LandType> selectedLandType = LandType.NOTHING.obs;
  Rx<DrainType> selectedDrainType = DrainType.NOTHING.obs;

  Rx<Details> inspectionDetails = Details().obs;
  Rx<BcCaseBiFileModel> fileMaster = BcCaseBiFileModel().obs;

  @override
  void onInit() {
    super.onInit();
    getFileByIDWithInspectionDetails(
        Get.arguments["applicationFileMasterID"].toString(),
        (response) {}); //Get.arguments["id"]
  }

  Future<void> getFileByIDWithInspectionDetails(
      String id, Function callback) async {
    return callDataService(
        _bcCaseBiRepository.getFileByIDWithInspectionDetails(id),
        onSuccess: (DataResponse data) {
      if (data.statusCode == 1) {
        if (data.responseObj is InspectionDetailsModel) {
          final inspectionResponse = data.responseObj as InspectionDetailsModel;
          var details = inspectionResponse.details;
          var applicationFileMaster = inspectionResponse.applicationFileMaster;

          inspectionDetails.value.applicationFileMasterID = Get.arguments["applicationFileMasterID"];
          if (applicationFileMaster != null) {
            fileMaster.value = applicationFileMaster;
          }
          if (details != null) {
            inspectionDetails.value = details;
            isLandUnderLease.value = (details.isLandUnderLease == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isLandUnderLease == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isApplicantLandOwner.value = (details.isApplicantLandOwner == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isApplicantLandOwner == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isAnyExistingBuilding.value =
                (details.isAnyExistingBuilding == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isAnyExistingBuilding == true)
                        ? BoolType.YES
                        : BoolType.NO;
            isNearbyOpenSpaceOk.value = (details.isNearbyOpenSpaceOk == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isNearbyOpenSpaceOk == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isLandSiteWorkStart.value = (details.isLandSiteWorkStart == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isLandSiteWorkStart == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isApplicationInformationOK.value =
                (details.isApplicationInformationOK == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isApplicationInformationOK == true)
                        ? BoolType.YES
                        : BoolType.NO;
            isHillLand.value = (details.isHillLand == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isHillLand == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isHillNear.value = (details.isHillNear == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isHillNear == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isVisibleAllStructureIn12M.value =
                (details.isVisibleAllStructureIn12M == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isVisibleAllStructureIn12M == true)
                        ? BoolType.YES
                        : BoolType.NO;
            isNearDrain.value = (details.isNearDrain == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isNearDrain == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isEffectedNaturalWaterFlow.value =
                (details.isEffectedNaturalWaterFlow == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isEffectedNaturalWaterFlow == true)
                        ? BoolType.YES
                        : BoolType.NO;
            isPossibleToConnectDrain.value =
                (details.isPossibleToConnectDrain == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isPossibleToConnectDrain == true)
                        ? BoolType.YES
                        : BoolType.NO;
            hasElectricStructureIn10M.value =
                (details.hasElectricStructureIn10M == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.hasElectricStructureIn10M == true)
                        ? BoolType.YES
                        : BoolType.NO;
            hasNearDefenceStructure.value =
                (details.hasNearDefenceStructure == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.hasNearDefenceStructure == true)
                        ? BoolType.YES
                        : BoolType.NO;
            isLakeInProposedLand.value = (details.isLakeInProposedLand == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isLakeInProposedLand == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isLandFillFromLake.value = (details.isLandFillFromLake == null)
                ? BoolType.NOT_APPLICABLE
                : (details.isLandFillFromLake == true)
                    ? BoolType.YES
                    : BoolType.NO;
            isHistoricalStructureInProposedLand.value =
                (details.isHistoricalStructureInProposedLand == null)
                    ? BoolType.NOT_APPLICABLE
                    : (details.isHistoricalStructureInProposedLand == true)
                        ? BoolType.YES
                        : BoolType.NO;

            hasNaturalEffection.value = (details.hasNaturalEffection == null)
                ? BoolType.NOT_APPLICABLE
                : (details.hasNaturalEffection == true)
                    ? BoolType.YES
                    : BoolType.NO;

/*            selectedDrainType.value =
                (details.drainType == DrainType.Ripe.number)
                    ? DrainType.Ripe
                    : (details.drainType == DrainType.Raw.number)
                        ? DrainType.Raw
                        : (details.drainType == DrainType.NOT_APPLICABLE.number)
                            ? DrainType.NOT_APPLICABLE
                            : DrainType.NOTHING;*/
            selectedLandType.value =
                (details.proposedLandType == LandType.FirmingLand.number)
                    ? LandType.FirmingLand
                    : (details.proposedLandType == LandType.LivingLand.number)
                        ? LandType.LivingLand
                        : LandType.NOTHING;

            selectedBuildingType.value =
                (details.existingBuildingNature == BuildingType.Null.number)
                    ? BuildingType.Null
                    : BuildingType.NOTHING;

            selectedElectricLineType.value = (details.nearElectricLineType ==
                    ElectricLineType.LowTension.number)
                ? ElectricLineType.LowTension
                : (details.nearElectricLineType ==
                        ElectricLineType.HighTension.number)
                    ? ElectricLineType.HighTension
                    : ElectricLineType.NOTHING;
          }
        }
      } else {
        showErrorMessage(data.message);
      }
      callback(data);
    }, onError: (e) {
      callback(e);
      // showSnackBar(Get.context!, (e as BaseApiException).message);
      Get.snackbar("Error", (e as BaseException).message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    });
  }

  void removeEmptyOrNullValues(Map<String, dynamic> map) {
    map.removeWhere((key, value) =>
        value == null ||
        value.toString().isEmpty ||
        value.toString() == "0" ||
        key == "updatedDate" ||
        key == "createdDate");
  }

  Future<void> saveInspectionDetailsBCCase(Function callback) async {
    final map = inspectionDetails.value.toJson();
    final Map<String, dynamic> hashMap = HashMap();

    hashMap["latitude"] = myPosition.value.latitude;
    hashMap["longitude"] = myPosition.value.longitude;
    hashMap["investigationOfficerID"] = fileMaster.value.investigationOfficerID;
    removeEmptyOrNullValues(map);
    hashMap.addAll(map);
    print(map);
    //return;

    if (inspectionDetails.value.inspectionDetailsBCSPCaseID > 0) {
      return callDataService(
          _bcCaseBiRepository.updateInspectionDetailsBCCase(hashMap),
          onSuccess: (DataResponse data) {
        if (data.statusCode == 1) {
          if (data.responseObj is Details) {
            var details = data.responseObj;
            if (details != null) {
              inspectionDetails.value = details as Details;
            }
          }
        } else {
          showErrorMessage(data.message);
        }
        callback(data);
      }, onError: (e) {
        callback(e);
        // showSnackBar(Get.context!, (e as BaseApiException).message);
        Get.snackbar("Error", (e as BaseException).message,
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
      });
    } else {
      return callDataService(
          _bcCaseBiRepository.saveInspectionDetailsBCCase(hashMap),
          onSuccess: (DataResponse data) {
        if (data.statusCode == 1) {
          if (data.responseObj is Details) {
            var details = data.responseObj;
            if (details != null) {
              inspectionDetails.value = details as Details;
            }
          }
        } else {
          showErrorMessage(data.message);
        }
        callback(data);
      }, onError: (e) {
        callback(e);
        // showSnackBar(Get.context!, (e as BaseApiException).message);
        Get.snackbar("Error", (e as BaseException).message,
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
      });
    }
  }

  Future<void> updateApplicationFileGeofence(Function callback) async {
    final map = inspectionDetails.value.toJson();
    final HashMap<String, dynamic> hashMap = HashMap();

    hashMap["applicationFileMasterID"] =
        inspectionDetails.value.applicationFileMasterID;
    hashMap["latitude"] = myPosition.value.latitude;
    hashMap["longitude"] = myPosition.value.longitude;
    hashMap.addAll(map);
    return callDataService(
        _bcCaseBiRepository.updateApplicationFileGeofence(hashMap),
        onSuccess: (DataResponse data) {
      if (data.statusCode == 1) {
        if (data.responseObj is BcCaseBiFileModel) {
          var details = data.responseObj;
          if (details != null) {}
        }
      } else {
        showErrorMessage(data.message);
      }
      callback(data);
    }, onError: (e) {
      callback(e);
      // showSnackBar(Get.context!, (e as BaseApiException).message);
      Get.snackbar("Error", (e as BaseException).message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    });
  }
}
