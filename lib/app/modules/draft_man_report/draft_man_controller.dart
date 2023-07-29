import 'package:apps_rtims/app/data/repository/draft_man_report/draftman_report_repository.dart';
import 'package:get/get.dart';
import '../../core/base/base_controller.dart';
import '../bc_case_bi/bc_case_bi_controller.dart';

class DraftManController extends BaseController {
  final DraftManReportRepository _draftManReportRepository =
      Get.find(tag: (DraftManReportRepository).toString());

  Rx<BoolType> isOwnership = BoolType.NOTHING.obs;
  Rx<BoolType> isFieldPlace = BoolType.NOTHING.obs;
  Rx<BoolType> isFieldMap = BoolType.NOTHING.obs;
  Rx<BoolType> isAlignmentDamaged = BoolType.NOTHING.obs;



}
