import 'package:apps_rtims/app/core/widget/background.dart';
import 'package:apps_rtims/app/data/repository/bc_case_bi/model/BcCaseBiFileModel.dart';
import 'package:apps_rtims/app/modules/fileList/file_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '../../../../utils/dimensions.dart';
import '../../../utils/extensions.dart';
import '../../../utils/utils.dart';
import '../../routes/app_pages.dart';

class FileListView extends BaseView<FileListController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(
        context,
        (controller.data["for"] == Routes.TECHNICAL_REPORT)
            ? "BCCASE তদন্তের তালিকা"
            : "BCCASE তদন্তের তালিকা",
        enableBackButton: true, onBackPressed: () async {
      final leavePage = await Utils.leaveDialog(context,
          title: appLocalization.msgLeave,
          cancelLabel: appLocalization.titleCancel,
          doneLabel: appLocalization.titleLeave);
      if (leavePage) {
        Get.back();
      }
    });
  }

  @override
  Widget? drawer() {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return Background(
          child: ListView(
        children: [
          const SizedBox(height: Dimensions.paddingSizeSmall),
          for (BcCaseBiFileModel item in controller.bcCaseBiFileList)
            ListItem(item)
        ],
      ));
    });
  }

  Widget ListItem(BcCaseBiFileModel value) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // sets border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Ref. No:             '),
              Text('${value.refNo}'),
            ],
          ),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Assign Date:    '),
              Text('${value.assignDate?.substring(0, 10)}'),
            ],
          ),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Thana:               '),
              Text('${value.thanaNameBangla}'),
            ],
          ),
          2.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Mouza:              '),
              Text('${value.mouzaNameBangla}'),
            ],
          ),
          2.height,
        ],
      ).paddingAll(10).onTap((() {
        if (controller.data["for"] == Routes.TECHNICAL_REPORT) {
          Get.toNamed(Routes.TECHNICAL_REPORT, arguments: {
            "applicationFileMasterID": value.applicationFileMasterID
          });
        } else {
          Get.toNamed(Routes.BC_CASE_BI, arguments: {
            "applicationFileMasterID": value.applicationFileMasterID
          });
        }
      })),
    );
  }
}
