import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import '../../core/base/base_controller.dart';
import '../../data/repository/auth/auth_repository.dart';
import '../../data/repository/auth/model/token_model.dart';
import '../../data/repository/auth/model/user_model.dart';
import '../../network/exceptions/base_exception.dart';

class AuthController extends BaseController {
  final AuthRepository _authRepository =
      Get.find(tag: (AuthRepository).toString());

  final Rx<TokenModel> _loginResult = TokenModel().obs;

  TokenModel get loginResult => _loginResult.value;

  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  String password = "";

  void toggle() {
    obscureText.value = !obscureText.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  UserModel? _userModel;

  Future<UserModel?> get userModel async {
    {
      if (_userModel != null) {
        logD("UserModel ${_userModel?.userAutoID}");
        return _userModel;
      } else {
        UserModel userData = await _authRepository.getUserInfo();
        if (userData.userAutoID == null) {
          _userModel = null;
        } else {
          _userModel = userData;
        }
        return _userModel;
      }
    }
  }

  clearUser() {
    _userModel = null;
    _authRepository.clearAll();
  }

  //Login
  Future<void> login(HashMap<String, String> hashMap, Function callback) async {
    isLoading.value = true;
    clearUser();
    return callDataService(_authRepository.login(hashMap),
        onSuccess: (TokenModel data) {
      _loginResult.value = data;
      var accessToken = data.responseObj?.tokenResult;
      if (accessToken != null) {
        _authRepository.saveToken(accessToken.accessToken!);
        _authRepository.saveUserInfo(
            data.responseObj);
      }
      callback(data);
      isLoading.value = false;
    }, onError: (e) {
      callback(e);
      isLoading.value = false;
      // showSnackBar(Get.context!, (e as BaseApiException).message);
      Get.snackbar("Error", (e as BaseException).message,
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.red);
    });
  }
}
