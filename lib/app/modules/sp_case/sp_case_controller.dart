import 'package:get/get.dart';
import '../../core/base/base_controller.dart';
import '../../data/repository/sp_case/sp_case_repository.dart';
import '../bc_case_bi/bc_case_bi_controller.dart';
import '../bc_case_bi/tension_type.dart';


class SPCaseController extends BaseController {
  final SPCaseRepository _spCaseRepository =
      Get.find(tag: (SPCaseRepository).toString());

  Rx<BoolType> isLeased = BoolType.NOTHING.obs;
  Rx<BoolType> isExistingOpenField = BoolType.NOTHING.obs;
  Rx<BoolType> isStartingWork = BoolType.NOTHING.obs;
  Rx<BoolType> isPermitted = BoolType.NOTHING.obs;
  Rx<BoolType> isNoticed = BoolType.NOTHING.obs;
  Rx<BoolType> isValidStatement = BoolType.NOTHING.obs;
  Rx<BoolType> isLessThan30Meter = BoolType.NOTHING.obs;
  Rx<BoolType> isHillGround = BoolType.NOTHING.obs;
  Rx<BoolType> isExistHill = BoolType.NOTHING.obs;
  Rx<BoolType> isStructureWithin12Meter = BoolType.NOTHING.obs;
  Rx<BoolType> isWhetherTheApplicantIsTheActualOwnerOfTheLandMentionedInTheSaidDocument = BoolType.NOTHING.obs;
  Rx<BoolType> isWtaitaootlmitsd = BoolType.NOTHING.obs;
  Rx<BoolType> isExistDrain = BoolType.NOTHING.obs;
  Rx<BoolType> isDangerForWatering = BoolType.NOTHING.obs;
  Rx<BoolType> isPossibleConnectWithDrain = BoolType.NOTHING.obs;
  Rx<BoolType> isElectricLineAround10Meters = BoolType.NOTHING.obs;
  Rx<BoolType> isExistDefenceConstruction = BoolType.NOTHING.obs;
  Rx<BoolType> isExistAnyPond = BoolType.NOTHING.obs;
  Rx<BoolType> isHistoricalBuildings = BoolType.NOTHING.obs;
  Rx<BoolType> isPondFilled = BoolType.NOTHING.obs;
  Rx<BoolType> isAffectOnEnvironment = BoolType.NOTHING.obs;

  final List<TensionType> lstVehicleType = <TensionType>[].obs;
  Rx<TensionType> selectedVehicleType =
      TensionType(name: "Select Tension").obs;

  @override
  void onInit() {
    lstVehicleType.add(selectedVehicleType.value);
    super.onInit();
  }

}
