import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/base/base_controller.dart';
import '../../core/resource.dart';
import '../../data/repository/auth/model/user_model.dart';
import '../../data/repository/inspection_report/inspection_report_repository.dart';
import '../auth/auth_controller.dart';
import '../dashboard/dashboard_controller.dart';

class InspectionReportController extends BaseController {
  final InspectionReportRepository _beatReportRepository =
      Get.find(tag: (InspectionReportRepository).toString());

  GoogleMapController? mapController;
  RxBool isMapLoading = false.obs;

  Rx<MyLocation> selectedLocation =
      MyLocation(longitude: 90.399452, latitude: 23.777176).obs;

  var dateRangeList = <String>[].obs;
  var selectedDateRange = 'Today'.obs;
  var rowsPerPage = 5;
  var sortIndex = 0;
  var sortAsc = true;

  RxBool isLoading = false.obs;
  Future<UserModel?> userModel = Get.find<AuthController>().userModel;

//ListData

  // final _reportData1 = <Map<String, dynamic>>[].obs;

  // List<Map<String, dynamic>> get reportData1 => _reportData1.toList();

  final reportDataNew = Resource.init(<Map<String, dynamic>>[], "").obs;

  // List<Map<String, dynamic>>? get reportDataNew => _reportDataNew.value.data;

  @override
  void onInit() {

    selectedDateRange.value = dateRangeList.isNotEmpty ? dateRangeList[0] : '';

    super.onInit();
  }



}
