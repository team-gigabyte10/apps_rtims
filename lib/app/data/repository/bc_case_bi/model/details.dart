

import 'package:apps_rtims/app/core/core.dart';
import 'package:apps_rtims/safe_convert.dart';

class Details extends Serializable {
  // 1
  int inspectionDetailsBCSPCaseID;
  // 10
    int applicationFileMasterID;
  String investigationDate;
  // Ali Akram
  String landOwnerName;
  // null
  bool? isLandUnderLease;
  // 2001
  int leaseYear;
  // aaaaaaaaaa
  String actualProposedSizeNorth;
  // null
  String actualProposedSizeSouth;
  // null
  String actualProposedSizeEast;
  // null
  String actualProposedSizeWest;
  // null
  String actualProposedSizeLandQty;
  // null
  bool? isApplicantLandOwner;
  // null
  String landTopShil;
  // null
  String rsKhotian;
  // null
  String layOutPlotNo;
  // null
  String landArea;
  // null
  String proposedBuldingEnvelop1stFloor;
  // null
  String proposedBuldingEnvelopTillTopFloor;
  // null
  String proposedBuldingEnvelopFrom2ndFloor;
  // null
  String proposedBuldingEnvelopStair;
  // null
  String proposedBuldingEnvelopStairTotal;
  // null
  String proposedBuldingEnvelopParkingSpace;
  // null
  bool? isAnyExistingBuilding;
  // 1
  int existingBuildingNature;
  // null
  String existingBuildingSize;
  // null
  String structureToProsture;
  // null
  bool? isNearbyOpenSpaceOk;
  // null
  String connectedRoadName;
  // null
  String connectedRoadWidth;
  // null
  String connectedRoadDirection;
  // null
  String connectedRoadType;
  // null
  String connectedRoadProposedType;
  // null
  bool? isLandSiteWorkStart;
  // null
  String hasPreviousStructureApproval;
  // null
  String has3BOrOtherNotice;
  // null
  bool? isApplicationInformationOK;
  // null
  String connectedMainRoadName;
  // null
  String isInKpiArea30M;
  // null
  bool? isHillLand;
  // null
  bool? isHillNear;
  // null
  String hIllDistance;
  // 1
  int proposedLandType;
  // null
  bool? isVisibleAllStructureIn12M;
  // null
  String visibleAllStructureIn12MNorth;
  // null
  String visibleAllStructureIn12MSouth;
  // null
  String visibleAllStructureIn12MEast;
  // null
  String visibleAllStructureIn12MWest;
  // null
  bool? isNearDrain;
  // null
  String drainLength;
  // null
  String drainType;
  // null
  bool? isEffectedNaturalWaterFlow;
  // null
  bool? isPossibleToConnectDrain;
  // null
  bool? hasElectricStructureIn10M;
  // null
  String electricStructureIn10MDistance;
  // 1
  int nearElectricLineType;
  // null
  bool? hasNearDefenceStructure;
  // null
  String nearDefenceStructureDetails;
  // null
  bool? isLakeInProposedLand;
  // null
  bool? isHistoricalStructureInProposedLand;
  // null
  bool? isLandFillFromLake;
  // null
  bool? hasNaturalEffection;
  // null
  String landClearanceNo;
  // null
  String landSpecialClearanceNo;
  // 1
  int investigationOfficerID;
  // null
  String investigationOfficerSignetureDate;
  // 1
  int deptHeadID;
  // null
  String deptHeadSignetureDate;
  // null
  bool? isDelete;
  // null
  String tRStructureuse;
  // null
  String tRStructurefloor;
  // null
  String tRStructurearea;
  // null
  String tRFloorsize1st;
  // null
  String tRFloorsizetilltypical;

  String tRMGCFloorSizeTillTypical;
  // null
  String tRMgcgroundfloor;
  // null
  String tRMgclimit;
  // null
  String tRLandclearanceno;
  // null
  String tRLandclearancereceivedate;
  // null
  String tRLandclearancesubmitdate;
  // null
  String tRLandspecialclearanceno;
  // null
  String tRLandspecialclearancereceivedate;
  // null
  String tRLandspecialclearancesubmitdate;
  // null
  String tRConnectedroadname;
  // null
  String tRConnectedroadwidth;
  // null
  String tRConnectedroadwidthproposed;
  // null
  String tRRoadconcessions;
  // 1
  int tRThanaid;
  // 2
  int tRMouzaid;
  // null
  String tRDesigncompany;
  // null
  String tRDesigncompanymobile;
  // null
  String tRDesignengineer;
  // null
  String tRDesignengineermobile;
  // null
  String tRVoidno;
  // null
  String tRVoidsize;
  // 22
  int tRFlatcount;
  // 21
  int tRCarparkingcount;
  // 20
  int tRBikeparkingcount;
  // 2
  int tRAuthorisedby;
  // null
  String tRAuthoriseddate;
  // 27
  int createdBy;
  // 2023-06-14T12:54:22.7186283+06:00
  String createdDate;
  // 27
  int updatedBy;
  // 2023-06-14T12:54:23.9550192+06:00
  String updatedDate;
  String investigationOfficerName;

  Details({
    this.inspectionDetailsBCSPCaseID = 0,
    this.applicationFileMasterID = 0,
    this.investigationDate = "",
    this.landOwnerName = "",
    this.isLandUnderLease,
    this.leaseYear = 0,
    this.actualProposedSizeNorth = "",
    this.actualProposedSizeSouth = "",
    this.actualProposedSizeEast = "",
    this.actualProposedSizeWest = "",
    this.actualProposedSizeLandQty = "",
    this.isApplicantLandOwner,
    this.landTopShil = "",
    this.rsKhotian = "",
    this.layOutPlotNo = "",
    this.landArea = "",
    this.proposedBuldingEnvelop1stFloor = "",
    this.proposedBuldingEnvelopTillTopFloor = "",
    this.proposedBuldingEnvelopFrom2ndFloor = "",
    this.proposedBuldingEnvelopStair = "",
    this.proposedBuldingEnvelopStairTotal = "",
    this.proposedBuldingEnvelopParkingSpace = "",
    this.isAnyExistingBuilding,
    this.existingBuildingNature = 0,
    this.existingBuildingSize = "",
    this.structureToProsture = "",
    this.isNearbyOpenSpaceOk,
    this.connectedRoadName = "",
    this.connectedRoadWidth = "",
    this.connectedRoadDirection = "",
    this.connectedRoadType = "",
    this.connectedRoadProposedType = "",
    this.isLandSiteWorkStart,
    this.hasPreviousStructureApproval = "",
    this.has3BOrOtherNotice = "",
    this.isApplicationInformationOK,
    this.connectedMainRoadName = "",
    this.isInKpiArea30M = "",
    this.isHillLand,
    this.isHillNear,
    this.hIllDistance = "",
    this.proposedLandType = 0,
    this.isVisibleAllStructureIn12M,
    this.visibleAllStructureIn12MNorth = "",
    this.visibleAllStructureIn12MSouth = "",
    this.visibleAllStructureIn12MEast = "",
    this.visibleAllStructureIn12MWest = "",
    this.isNearDrain,
    this.drainLength = "",
    this.drainType = "",
    this.isEffectedNaturalWaterFlow,
    this.isPossibleToConnectDrain,
    this.hasElectricStructureIn10M,
    this.electricStructureIn10MDistance = "",
    this.nearElectricLineType = 0,
    this.hasNearDefenceStructure,
    this.nearDefenceStructureDetails = "",
    this.isLakeInProposedLand,
    this.isHistoricalStructureInProposedLand,
    this.isLandFillFromLake,
    this.hasNaturalEffection,
    this.landClearanceNo = "",
    this.landSpecialClearanceNo = "",
    this.investigationOfficerID = 0,
    this.investigationOfficerSignetureDate = "",
    this.deptHeadID = 0,
    this.deptHeadSignetureDate = "",
    this.isDelete,
    this.tRStructureuse = "",
    this.tRStructurefloor = "",
    this.tRStructurearea = "",
    this.tRFloorsize1st = "",
    this.tRFloorsizetilltypical = "",
    this.tRMGCFloorSizeTillTypical = "",
    this.tRMgcgroundfloor = "",
    this.tRMgclimit = "",
    this.tRLandclearanceno = "",
    this.tRLandclearancereceivedate = "",
    this.tRLandclearancesubmitdate = "",
    this.tRLandspecialclearanceno = "",
    this.tRLandspecialclearancereceivedate = "",
    this.tRLandspecialclearancesubmitdate = "",
    this.tRConnectedroadname = "",
    this.tRConnectedroadwidth = "",
    this.tRConnectedroadwidthproposed = "",
    this.tRRoadconcessions = "",
    this.tRThanaid = 0,
    this.tRMouzaid = 0,
    this.tRDesigncompany = "",
    this.tRDesigncompanymobile = "",
    this.tRDesignengineer = "",
    this.tRDesignengineermobile = "",
    this.tRVoidno = "",
    this.tRVoidsize = "",
    this.tRFlatcount = 0,
    this.tRCarparkingcount = 0,
    this.tRBikeparkingcount = 0,
    this.tRAuthorisedby = 0,
    this.tRAuthoriseddate = "",
    this.createdBy = 0,
    this.createdDate = "",
    this.updatedBy = 0,
    this.updatedDate = "",
    this.investigationOfficerName = "",
  });

  factory Details.fromJson(Map<String, dynamic>? json) => Details(
    inspectionDetailsBCSPCaseID: asT<int>(json, 'inspectionDetailsBCSPCaseID'),
    applicationFileMasterID: asT<int>(json, 'applicationFileMasterID'),
    investigationDate: asT<String>(json, 'investigationDate'),
    landOwnerName: asT<String>(json, 'landOwnerName'),
    isLandUnderLease: asT<bool?>(json, 'isLandUnderLease'),
    leaseYear: asT<int>(json, 'leaseYear'),
    actualProposedSizeNorth: asT<String>(json, 'actualProposedSizeNorth'),
    actualProposedSizeSouth: asT<String>(json, 'actualProposedSizeSouth'),
    actualProposedSizeEast: asT<String>(json, 'actualProposedSizeEast'),
    actualProposedSizeWest: asT<String>(json, 'actualProposedSizeWest'),
    actualProposedSizeLandQty: asT<String>(json, 'actualProposedSizeLandQty'),
    isApplicantLandOwner: asT<bool?>(json, 'isApplicantLandOwner'),
    landTopShil: asT<String>(json, 'landTopShil'),
    rsKhotian: asT<String>(json, 'rsKhotian'),
    layOutPlotNo: asT<String>(json, 'layOutPlotNo'),
    landArea: asT<String>(json, 'landArea'),
    proposedBuldingEnvelop1stFloor: asT<String>(json, 'proposedBuldingEnvelop1stFloor'),
    proposedBuldingEnvelopTillTopFloor: asT<String>(json, 'proposedBuldingEnvelopTillTopFloor'),
    proposedBuldingEnvelopFrom2ndFloor: asT<String>(json, 'proposedBuldingEnvelopFrom2ndFloor'),
    proposedBuldingEnvelopStair: asT<String>(json, 'proposedBuldingEnvelopStair'),
    proposedBuldingEnvelopStairTotal: asT<String>(json, 'proposedBuldingEnvelopStairTotal'),
    proposedBuldingEnvelopParkingSpace: asT<String>(json, 'proposedBuldingEnvelopParkingSpace'),
    isAnyExistingBuilding: asT<bool?>(json, 'isAnyExistingBuilding'),
    existingBuildingNature: asT<int>(json, 'existingBuildingNature'),
    existingBuildingSize: asT<String>(json, 'existingBuildingSize'),
    structureToProsture: asT<String>(json, 'structureToProsture'),
    isNearbyOpenSpaceOk: asT<bool?>(json, 'isNearbyOpenSpaceOk'),
    connectedRoadName: asT<String>(json, 'connectedRoadName'),
    connectedRoadWidth: asT<String>(json, 'connectedRoadWidth'),
    connectedRoadDirection: asT<String>(json, 'connectedRoadDirection'),
    connectedRoadType: asT<String>(json, 'connectedRoadType'),
    connectedRoadProposedType: asT<String>(json, 'connectedRoadProposedType'),
    isLandSiteWorkStart: asT<bool?>(json, 'isLandSiteWorkStart'),
    hasPreviousStructureApproval: asT<String>(json, 'hasPreviousStructureApproval'),
    has3BOrOtherNotice: asT<String>(json, 'has3BOrOtherNotice'),
    isApplicationInformationOK: asT<bool?>(json, 'isApplicationInformationOK'),
    connectedMainRoadName: asT<String>(json, 'connectedMainRoadName'),
    isInKpiArea30M: asT<String>(json, 'isInKpiArea30M'),
    isHillLand: asT<bool?>(json, 'isHillLand'),
    isHillNear: asT<bool?>(json, 'isHillNear'),
    hIllDistance: asT<String>(json, 'hIllDistance'),
    proposedLandType: asT<int>(json, 'proposedLandType'),
    isVisibleAllStructureIn12M: asT<bool?>(json, 'isVisibleAllStructureIn12M'),
    visibleAllStructureIn12MNorth: asT<String>(json, 'visibleAllStructureIn12MNorth'),
    visibleAllStructureIn12MSouth: asT<String>(json, 'visibleAllStructureIn12MSouth'),
    visibleAllStructureIn12MEast: asT<String>(json, 'visibleAllStructureIn12MEast'),
    visibleAllStructureIn12MWest: asT<String>(json, 'visibleAllStructureIn12MWest'),
    isNearDrain: asT<bool?>(json, 'isNearDrain'),
    drainLength: asT<String>(json, 'drainLength'),
    drainType: asT<String>(json, 'drainType'),
    isEffectedNaturalWaterFlow: asT<bool?>(json, 'isEffectedNaturalWaterFlow'),
    isPossibleToConnectDrain: asT<bool?>(json, 'isPossibleToConnectDrain'),
    hasElectricStructureIn10M: asT<bool?>(json, 'hasElectricStructureIn10M'),
    electricStructureIn10MDistance: asT<String>(json, 'electricStructureIn10MDistance'),
    nearElectricLineType: asT<int>(json, 'nearElectricLineType'),
    hasNearDefenceStructure: asT<bool?>(json, 'hasNearDefenceStructure'),
    nearDefenceStructureDetails: asT<String>(json, 'nearDefenceStructureDetails'),
    isLakeInProposedLand: asT<bool?>(json, 'isLakeInProposedLand'),
    isHistoricalStructureInProposedLand: asT<bool?>(json, 'isHistoricalStructureInProposedLand'),
    isLandFillFromLake: asT<bool?>(json, 'isLandFillFromLake'),
    hasNaturalEffection: asT<bool?>(json, 'hasNaturalEffection'),
    landClearanceNo: asT<String>(json, 'landClearanceNo'),
    landSpecialClearanceNo: asT<String>(json, 'landSpecialClearanceNo'),
    investigationOfficerID: asT<int>(json, 'investigationOfficerID'),
    investigationOfficerSignetureDate: asT<String>(json, 'investigationOfficerSignetureDate'),
    deptHeadID: asT<int>(json, 'deptHeadID'),
    deptHeadSignetureDate: asT<String>(json, 'deptHeadSignetureDate'),
    isDelete: asT<bool?>(json, 'isDelete'),
    tRStructureuse: asT<String>(json, 'tR_StructureUse'),
    tRStructurefloor: asT<String>(json, 'tR_StructureFloor'),
    tRStructurearea: asT<String>(json, 'tR_StructureArea'),
    tRFloorsize1st: asT<String>(json, 'tR_FloorSize1st'),
    tRFloorsizetilltypical: asT<String>(json, 'tR_FloorSizeTillTypical'),
    tRMgcgroundfloor: asT<String>(json, 'tR_MGCGroundFloor'),
    tRMgclimit: asT<String>(json, 'tR_MGCLimit'),
    tRLandclearanceno: asT<String>(json, 'tR_LandClearanceNo'),
    tRLandclearancereceivedate: asT<String>(json, 'tR_LandClearanceReceiveDate'),
    tRLandclearancesubmitdate: asT<String>(json, 'tR_LandClearanceSubmitDate'),
    tRLandspecialclearanceno: asT<String>(json, 'tR_LandSpecialClearanceNo'),
    tRLandspecialclearancereceivedate: asT<String>(json, 'tR_LandSpecialClearanceReceiveDate'),
    tRLandspecialclearancesubmitdate: asT<String>(json, 'tR_LandSpecialClearanceSubmitDate'),
    tRConnectedroadname: asT<String>(json, 'tR_ConnectedRoadName'),
    tRConnectedroadwidth: asT<String>(json, 'tR_ConnectedRoadWidth'),
    tRConnectedroadwidthproposed: asT<String>(json, 'tR_ConnectedRoadWidthProposed'),
    tRRoadconcessions: asT<String>(json, 'tR_RoadConcessions'),
    tRThanaid: asT<int>(json, 'tR_ThanaID'),
    tRMouzaid: asT<int>(json, 'tR_MouzaID'),
    tRDesigncompany: asT<String>(json, 'tR_DesignCompany'),
    tRDesigncompanymobile: asT<String>(json, 'tR_DesignCompanyMobile'),
    tRDesignengineer: asT<String>(json, 'tR_DesignEngineer'),
    tRDesignengineermobile: asT<String>(json, 'tR_DesignEngineerMobile'),
    tRVoidno: asT<String>(json, 'tR_VOIDNo'),
    tRVoidsize: asT<String>(json, 'tR_VOIDSize'),
    tRFlatcount: asT<int>(json, 'tR_FlatCount'),
    tRCarparkingcount: asT<int>(json, 'tR_CarParkingCount'),
    tRBikeparkingcount: asT<int>(json, 'tR_BikeParkingCount'),
    tRAuthorisedby: asT<int>(json, 'tR_AuthorisedBy'),
    tRAuthoriseddate: asT<String>(json, 'tR_AuthorisedDate'),
    createdBy: asT<int>(json, 'createdBy'),
    createdDate: asT<String>(json, 'createdDate'),
    updatedBy: asT<int>(json, 'updatedBy'),
    updatedDate: asT<String>(json, 'updatedDate'),
    investigationOfficerName: asT<String>(json, 'investigationOfficerName'),
  );

  Map<String, dynamic> toJson() => {
    'inspectionDetailsBCSPCaseID': inspectionDetailsBCSPCaseID,
    'applicationFileMasterID': applicationFileMasterID,
    'investigationDate': investigationDate,
    'landOwnerName': landOwnerName,
    'isLandUnderLease': isLandUnderLease,
    'leaseYear': leaseYear,
    'actualProposedSizeNorth': actualProposedSizeNorth,
    'actualProposedSizeSouth': actualProposedSizeSouth,
    'actualProposedSizeEast': actualProposedSizeEast,
    'actualProposedSizeWest': actualProposedSizeWest,
    'actualProposedSizeLandQty': actualProposedSizeLandQty,
    'isApplicantLandOwner': isApplicantLandOwner,
    'landTopShil': landTopShil,
    'rsKhotian': rsKhotian,
    'layOutPlotNo': layOutPlotNo,
    'landArea': landArea,
    'proposedBuldingEnvelop1stFloor': proposedBuldingEnvelop1stFloor,
    'proposedBuldingEnvelopTillTopFloor': proposedBuldingEnvelopTillTopFloor,
    'proposedBuldingEnvelopFrom2ndFloor': proposedBuldingEnvelopFrom2ndFloor,
    'proposedBuldingEnvelopStair': proposedBuldingEnvelopStair,
    'proposedBuldingEnvelopStairTotal': proposedBuldingEnvelopStairTotal,
    'proposedBuldingEnvelopParkingSpace': proposedBuldingEnvelopParkingSpace,
    'isAnyExistingBuilding': isAnyExistingBuilding,
    'existingBuildingNature': existingBuildingNature,
    'existingBuildingSize': existingBuildingSize,
    'structureToProsture': structureToProsture,
    'isNearbyOpenSpaceOk': isNearbyOpenSpaceOk,
    'connectedRoadName': connectedRoadName,
    'connectedRoadWidth': connectedRoadWidth,
    'connectedRoadDirection': connectedRoadDirection,
    'connectedRoadType': connectedRoadType,
    'connectedRoadProposedType': connectedRoadProposedType,
    'isLandSiteWorkStart': isLandSiteWorkStart,
    'hasPreviousStructureApproval': hasPreviousStructureApproval,
    'has3BOrOtherNotice': has3BOrOtherNotice,
    'isApplicationInformationOK': isApplicationInformationOK,
    'connectedMainRoadName': connectedMainRoadName,
    'isInKpiArea30M': isInKpiArea30M,
    'isHillLand': isHillLand,
    'isHillNear': isHillNear,
    'hIllDistance': hIllDistance,
    'proposedLandType': proposedLandType,
    'isVisibleAllStructureIn12M': isVisibleAllStructureIn12M,
    'visibleAllStructureIn12MNorth': visibleAllStructureIn12MNorth,
    'visibleAllStructureIn12MSouth': visibleAllStructureIn12MSouth,
    'visibleAllStructureIn12MEast': visibleAllStructureIn12MEast,
    'visibleAllStructureIn12MWest': visibleAllStructureIn12MWest,
    'isNearDrain': isNearDrain,
    'drainLength': drainLength,
    'drainType': drainType,
    'isEffectedNaturalWaterFlow': isEffectedNaturalWaterFlow,
    'isPossibleToConnectDrain': isPossibleToConnectDrain,
    'hasElectricStructureIn10M': hasElectricStructureIn10M,
    'electricStructureIn10MDistance': electricStructureIn10MDistance,
    'nearElectricLineType': nearElectricLineType,
    'hasNearDefenceStructure': hasNearDefenceStructure,
    'nearDefenceStructureDetails': nearDefenceStructureDetails,
    'isLakeInProposedLand': isLakeInProposedLand,
    'isHistoricalStructureInProposedLand': isHistoricalStructureInProposedLand,
    'isLandFillFromLake': isLandFillFromLake,
    'hasNaturalEffection': hasNaturalEffection,
    'landClearanceNo': landClearanceNo,
    'landSpecialClearanceNo': landSpecialClearanceNo,
    'investigationOfficerID': investigationOfficerID,
    'investigationOfficerSignetureDate': investigationOfficerSignetureDate,
    'deptHeadID': deptHeadID,
    'deptHeadSignetureDate': deptHeadSignetureDate,
    'isDelete': isDelete,
    'tR_StructureUse': tRStructureuse,
    'tR_StructureFloor': tRStructurefloor,
    'tR_StructureArea': tRStructurearea,
    'tR_FloorSize1st': tRFloorsize1st,
    'tR_FloorSizeTillTypical': tRFloorsizetilltypical,
    'tR_MGCFloorSizeTillTypical': tRMGCFloorSizeTillTypical,
    'tR_MGCGroundFloor': tRMgcgroundfloor,
    'tR_MGCLimit': tRMgclimit,
    'tR_LandClearanceNo': tRLandclearanceno,
    'tR_LandClearanceReceiveDate': tRLandclearancereceivedate,
    'tR_LandClearanceSubmitDate': tRLandclearancesubmitdate,
    'tR_LandSpecialClearanceNo': tRLandspecialclearanceno,
    'tR_LandSpecialClearanceReceiveDate': tRLandspecialclearancereceivedate,
    'tR_LandSpecialClearanceSubmitDate': tRLandspecialclearancesubmitdate,
    'tR_ConnectedRoadName': tRConnectedroadname,
    'tR_ConnectedRoadWidth': tRConnectedroadwidth,
    'tR_ConnectedRoadWidthProposed': tRConnectedroadwidthproposed,
    'tR_RoadConcessions': tRRoadconcessions,
    'tR_ThanaID': tRThanaid,
    'tR_MouzaID': tRMouzaid,
    'tR_DesignCompany': tRDesigncompany,
    'tR_DesignCompanyMobile': tRDesigncompanymobile,
    'tR_DesignEngineer': tRDesignengineer,
    'tR_DesignEngineerMobile': tRDesignengineermobile,
    'tR_VOIDNo': tRVoidno,
    'tR_VOIDSize': tRVoidsize,
    'tR_FlatCount': tRFlatcount,
    'tR_CarParkingCount': tRCarparkingcount,
    'tR_BikeParkingCount': tRBikeparkingcount,
    'tR_AuthorisedBy': tRAuthorisedby,
    'tR_AuthorisedDate': tRAuthoriseddate,
    'createdBy': createdBy,
    'createdDate': createdDate,
    'updatedBy': updatedBy,
    'updatedDate': updatedDate,
    'investigationOfficerName': investigationOfficerName,
  };
}

