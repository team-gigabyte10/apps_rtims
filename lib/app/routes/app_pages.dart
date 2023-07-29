import 'package:apps_rtims/app/data/repository/atp_fromat/atp_format_repository.dart';
import 'package:apps_rtims/app/modules/atp_format/atp_format_binding.dart';
import 'package:apps_rtims/app/modules/atp_format/atp_format_screen.dart';
import 'package:apps_rtims/app/modules/draft_man_report/draft_man_binding.dart';
import 'package:apps_rtims/app/modules/draft_man_report/draft_man_screen.dart';
import 'package:apps_rtims/app/modules/fileList/file_list_binding.dart';
import 'package:apps_rtims/app/modules/fileList/file_list_view.dart';
import 'package:apps_rtims/app/modules/sp_case/sp_case_binding.dart';
import 'package:apps_rtims/app/modules/sp_case/sp_case_screen.dart';
import 'package:apps_rtims/app/modules/uAttachment/bindings/upload_attach_binding.dart';
import 'package:apps_rtims/app/modules/uAttachment/upload_map_attachment_screen.dart';
import 'package:get/get.dart';
import '../modules/bc_case_bi/bc_case_bi_binding.dart';
import '../modules/bc_case_bi/bc_case_bi_screen.dart';
import '../modules/inspection_report/bindings/inspection_report_bindings.dart';
import '../modules/inspection_report/inspection_report_screen.dart';
import '../modules/new_inspection/bindings/new_inspection_binding.dart';
import '../modules/new_inspection/views/new_inspection_screen.dart';
import '../modules/technical_report/bindings/technical_report_binding.dart';
import '../modules/technical_report/views/technical_report_screen.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';
import '/app/modules/main/bindings/main_binding.dart';
import '/app/modules/main/views/main_view.dart';
import '/app/modules/other/bindings/other_binding.dart';
import '/app/modules/other/views/other_view.dart';
import '/app/modules/project_details/bindings/project_details_binding.dart';
import '/app/modules/project_details/views/project_details_view.dart';
import '/app/modules/settings/bindings/settings_binding.dart';
import '/app/modules/settings/views/settings_view.dart';
import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/login_screen.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/dashboard_screen.dart';
import '../modules/uAttachment/upload_attachment_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: _Paths.FILE_LIST,
        page: () => FileListView(),
        binding: FileListBinding()),
    GetPage(
        name: _Paths.BC_CASE_BI,
        page: () => BcCaseBiScreen(),
        binding: BcCaseBiBinding()),
    GetPage(
      name: _Paths.NEW_INSPECTION,
      page: () => NewInspectionView(),
      binding: NewInspectionBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_ATTACHMENT,
      page: () => UploadAttachmentView(),
      binding: UploadAttachBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_MAP_ATTACHMENT,
      page: () => UploadMapAttachmentView(),
      binding: UploadAttachBinding(),
    ),
    GetPage(
      name: _Paths.INSPECTION_REPORT,
      page: () => InspectionReportScreenView(),
      binding: InspectionReportBinding(),
    ),
    GetPage(
      name: _Paths.INVESTIGATION_REPORT,
      page: () => InspectionReportScreenView(),
      binding: InspectionReportBinding(),
    ),
    GetPage(
      name: _Paths.TECHNICAL_REPORT,
      page: () => TechnicalReportScreenView(),
      binding: TechnicalReportBinding(),
    ),
    GetPage(
      name: _Paths.ATP_FORMAT,
      page: () => AtpFormatScreenView(),
      binding: AtpFormatBinding(),
    ),
    GetPage(
      name: _Paths.DRAFT_MAN_REPORT,
      page: () => DraftManScreenView(),
      binding: DraftManBinding(),
    ),
    GetPage(
      name: _Paths.SP_CASE,
      page: () => SPCaseScreenView(),
      binding: SpCaseBinding(),
    ),

    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      page: () => OtherView(),
      binding: OtherBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAILS,
      page: () => ProjectDetailsView(),
      binding: ProjectDetailsBinding(),
    ),
  ];
}
