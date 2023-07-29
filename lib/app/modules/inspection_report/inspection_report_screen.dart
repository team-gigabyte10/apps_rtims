import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/extensions.dart';
import '../../core/base/base_view.dart';
import '../../core/widget/background.dart';
import 'inspection_report_controller.dart';


class InspectionReportScreenView extends BaseView<InspectionReportController> {
  final _formKey = GlobalKey<FormState>();


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, appLocalization.titleInspectionRecord, enableBackButton: true,
        onBackPressed: () async {
      Get.back();
    });
  }

  @override
  Widget body(BuildContext context) {
    double width = ContextExtensionss(context).width;

    return Obx(() {
      final data = controller.reportDataNew.value.data ?? [];
      return Background(
          child: ListView(
        children: [
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

              )
          )
        ],
      ));
    });
  }

}

