//   const  BASE_URL = BuildConfig.BASE_URL
//const baseUrl = "http://10.1.0.12:8020/";
const baseUrl = "http://43.240.101.75:8020/";
const baseUrlApi = "${baseUrl}api/";

class Endpoints {
  //static const baseUrlApi = "${baseUrl}api/";

  static const loginUrl = "${baseUrlApi}Authenticate/authenticate";
  static const getListByAssingedPersonUrl = "${baseUrlApi}ApplicationFileMaster/getListByAssingedPerson";
  static const getFileByIDWithInspectionDetailsUrl = "${baseUrlApi}ApplicationFileMaster/getFileByIDWithInspectionDetails";
  static const inspectionDetailsBCCaseUrl = "${baseUrlApi}InspectionDetailsBCSPCase";
  static const updateApplicationFileGeofenceUrl = "${baseUrlApi}ApplicationFileMaster/updateApplicationFileGeofence";
  static const saveApplicationFileAttachmentsUrl = "${baseUrlApi}ApplicationFileMaster/saveApplicationFileAttachments";

  static const beatVisitUtilsUrl = "${baseUrlApi}beat/visit/utils";
  static const getLocationAndVillageByBeatUrl =
      "${baseUrlApi}beat/getlocationandvillagebybeat";
  static const unionByBeatIdUrl = "${baseUrlApi}Union/getUnionByBeatID";
  static const getVillageByUnionUrl =
      "${baseUrlApi}GeoLocation/getVillageByUnion";
  static const saveVillageUrl = "${baseUrlApi}Village/saveVillage";
  static const uploadUrl = "${baseUrlApi}po/upload";
  static const saveVisitUrl = "${baseUrlApi}beat/visit/save";
  static const saveBeatVisitAudioWithBeatIDUrl =
      "${baseUrlApi}beat/saveAudioWithBeat";
  static const updateBeatAttachmentUrl =
      "${baseUrlApi}beat/updateBeatAttachment";

  static const searchTypeUrl = "${baseUrlApi}po/search/type";
  static const poSaveUrl = "${baseUrlApi}po/save/withoutdocument";
  static const savePOVisitAudioWithPOIDUrl =
      "${baseUrlApi}po/saveAudioWithPOID";
  static const updatePOAttachmentUrl = "${baseUrlApi}po/updatePOAttachment";
  static const occurenceUrl =
      "${baseUrlApi}po/fir/utils_mobile"; // lstOccurence
  static const geolocationUrl = "${baseUrlApi}geolocation/utils";
  static const locationByPoIdUrl = "${baseUrlApi}po/getlocationbypoid";
  static const divisionUrl = "${baseUrlApi}geofence/getDivision";
  static const districtByDivisionUrl =
      "${baseUrlApi}GeoLocation/getDistrictbyDivision";
  static const thanabyDistUrl = "${baseUrlApi}GeoLocation/getThanabyDistrict";
  static const unionByThanaUrl = "${baseUrlApi}GeoLocation/getUnionByThana";
  static const villageByUnionUrl = "${baseUrlApi}GeoLocation/getVillageByUnion";
  static const newGDSaveUrl = "${baseUrlApi}po/gdSaveNew";
  static const updateGDAttachmentUrl = "${baseUrlApi}po/updatePOAttachment";
  static const newLocationSaveUrl = "${baseUrlApi}po/newlocation";
  static const passwordChangeUrl = "${baseUrlApi}secuirity/changepassword";

  // Beat visit report
  static const beatReportUrl = "${baseUrlApi}beat/getBeatVisitReportMobile";
  static const nonVisitedReportUrl =
      "${baseUrlApi}po/GetPONonVisitReportMobile";
  static const visitedReportUrl = "${baseUrlApi}po/GetPOVisitReportMobile";

  //Account transfer
  static const getUserDetailByBPNumberUrl =
      "${baseUrlApi}user/getUserDetailByBPNumber";
  static const getAccountTransferListUrl =
      "${baseUrlApi}user/getAccountTransferList";
  static const getUnitByUnitTypeIDUrl =
      "${baseUrlApi}GeoLocation/getUnitbyUnitTypeID";
  static const getDistrictByUnitIDUrl =
      "${baseUrlApi}GeoLocation/getDistrictbyUnitID";
  static const getCircleByDistrictIDUrl =
      "${baseUrlApi}GeoLocation/getCirclebyDistrictID";
  static const getThanaByCircleIDUrl =
      "${baseUrlApi}GeoLocation/getThanabyCircleID";
  static const sendTransferRequestUrl = "${baseUrlApi}user/sendTransferRequest";
}
