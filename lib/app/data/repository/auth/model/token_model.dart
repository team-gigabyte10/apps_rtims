import 'package:apps_rtims/app/data/repository/auth/model/user_model.dart';

/// message : null
/// responseObj : {"UserAutoID":1238,"UserName":"rangedigmymensingh","UserImage":null,"AccessRight":1,"AppsVersion":"V_2.3.0","DivisionID":4,"IsAllowBRMS":true}
/// statusCode : 1
/// Token : "P3gETwBJbImt8uVU1vslaoqMQLuftQPOIX/UDJwd+x8aA1bEuB9xIYeVY+f5+aIonlCoiFrSyI3Sddy7Z/vH9t3p9UqGLloImdmc6lUNTGA1v5q13QcuBOePv9fEHcOYF+QYE6TjYJj+/6LMm2fewFxeJamRlCGd+yTlBDWeR0+9i2l273y+yak+P2lZ1rwCEE1xKhkGBDONAVA4lee9iFn+2FD2hGQehjPLWObjpHQk5ylHS5P8cH172Qwh/kplbpPEuSFqA1Dh8Cb2fMauBTQjJi9TZtMonMpXKDC/IPhNKemYkjWK/k1E0SHxCEhB5PKH4B7yy8QXX6/hHIJi2CFSDWFt+JMzfJg1iRMddauRsoA6Zgl6J3zhzeBX6Yty"

class TokenModel {
  TokenModel({
    dynamic message,
    UserModel? responseObj,
    num? statusCode,
    String? token,
  }) {
    _message = message;
    _responseObj = responseObj;
    _statusCode = statusCode;
    _token = token;
  }

  TokenModel.fromJson(dynamic json) {
    _message = json?['message'];
    _responseObj = json['responseObj'] != null
        ? UserModel.fromJson(json['responseObj'])
        : null;
    _statusCode = json?['statusCode'];
    _token = json?['token'];
  }

  dynamic _message;
  UserModel? _responseObj;
  num? _statusCode;
  String? _token;

  TokenModel copyWith({
    dynamic message,
    UserModel? responseObj,
    num? statusCode,
    String? token,
  }) =>
      TokenModel(
        message: message ?? _message,
        responseObj: responseObj ?? _responseObj,
        statusCode: statusCode ?? _statusCode,
        token: token ?? _token,
      );

  dynamic get message => _message;

  UserModel? get responseObj => _responseObj;

  num? get statusCode => _statusCode;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
/*    if (_responseObj != null) {
      map['responseObj'] = _responseObj?.toJson();
    }*/
    map['statusCode'] = _statusCode;
    map['token'] = _token;
    return map;
  }
}
