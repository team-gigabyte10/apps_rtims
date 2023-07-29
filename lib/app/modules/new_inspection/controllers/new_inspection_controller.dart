import 'package:get/get.dart';
import '../../../core/base/base_controller.dart';
import '../../../data/remote/new_inspection/dto/save_visit_dto.dart';
import '../../../data/repository/auth/model/user_model.dart';
import '../../../data/repository/beat_po/model/search_type_data.dart';
import '../../../data/repository/new_inspection/new_inspection_repository.dart';
import '../../auth/auth_controller.dart';

class NewInspectionController extends BaseController {
  final NewInspectionRepository _beatRepository =
      Get.find(tag: (NewInspectionRepository).toString());
  RxBool isLoading = false.obs;
  Future<UserModel?> userModel = Get.find<AuthController>().userModel;


//ListData

  final List<LstPo> lstPO = <LstPo>[].obs;

  Rx<Audio> recordedAudioFile = Audio(name: "").obs;

  final LstPo firTypeFirstValue = LstPo(fIRNo: "Select File");

  late Rx<LstPo> firSelectedValue = firTypeFirstValue.obs;


  RxBool isUnionVisible = false.obs;
  RxBool isAddVisitLocButtonClicked = false.obs;
  RxBool isInspectionInfoClicked = false.obs;

  @override
  void onInit() {

    lstPO.add(firSelectedValue.value);

    super.onInit();
  }


}
