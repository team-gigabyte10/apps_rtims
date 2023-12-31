import 'package:flutter/material.dart';

import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/elevated_container.dart';
import '../../../utils/color_resources.dart';
import '../../../utils/utils.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.hideKeyboard();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorResources.kSemiTransparent,
      child: const Center(
        child: ElevatedContainer(
          padding: EdgeInsets.all(AppValues.margin),
          child: CircularProgressIndicator(
            color: AppColors.colorPrimary,
          ),
        ),
      ),
    );
  }
}
