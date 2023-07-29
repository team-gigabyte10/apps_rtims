import 'dart:collection';
import 'package:apps_rtims/app/data/repository/beat_po/model/search_type_data.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:get/get.dart';
import '../../../../utils/color_resources.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/utils.dart';
import '../../../../widget/dynamic_dropdown_button.dart';
import '../../../core/base/base_view.dart';
import '../../../core/model/data_response.dart';
import '../../../core/model/list_response.dart';
import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../../../core/widget/background.dart';
import '../../../data/repository/auth/model/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../dashboard/dashboard_controller.dart';
import '../../dashboard/dashboard_screen.dart';
import '../controllers/new_inspection_controller.dart';

Widget verticalDivider = const VerticalDivider(
  color: CupertinoColors.systemGrey,
  thickness: 1,
);

@immutable
class NewInspectionView extends BaseView<NewInspectionController> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();

  String locationShort = "";
  String shortNote = "";
  String locationDetails = "";

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(context, "New Inspection", enableBackButton: true,
        onBackPressed: () async {
      final leavePage = await Utils.leaveDialog(context);
      if (leavePage) {
        Get.back();
      }
    });
  }

  @override
  Widget body(BuildContext context) {
    double width = ContextExtensionss(context).width;
    return WillPopScope(
      onWillPop: () async {
        bool leavePage = await Utils.leaveDialog(context);
        return leavePage;
      },
      child: Obx(() {
        return Background(
            child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

              ),
            ).paddingAll(10),
            //SimpleRecorder()
          ],
        ));
      }),
    );
  }

}
