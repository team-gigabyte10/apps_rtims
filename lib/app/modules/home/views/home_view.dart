import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '../../../../data/count_item.dart';
import '../../../../utils/color_resources.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';

class HomeView extends BaseView<HomeController> {
  final List<CountItem> countItemList = [];

  HomeView() {}

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return getAppBar(
      context,
      "CIDMS",
    );
  }

  @override
  Widget? drawer() {
    return null;
  }

  @override
  Widget? floatingActionButton() {
    return const FloatingActionButton.extended(
      onPressed: null,
      tooltip: 'Create',
      label: Text("CREATE"),
      icon: Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: Dimensions.paddingSizeSmall),
      ],
    );
  }

  AppBar getAppBar(BuildContext context, title) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        ImagesAssets.rtimsLogo,
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 2.0,
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN, arguments: {});
            },
            icon: const Icon(
              Icons.person,
              color: ColorResources.kPrimaryColor,
            ))
      ],
    );
  }
}
