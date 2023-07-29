import 'dart:convert';
/// userAutoID : 1
/// userID : "swl"
/// userTypeID : 1
/// organizationID : 1
/// designationID : 0
/// userFullName : "Solution Worl Limited"
/// userRoleID : 1
/// tokenResult : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RTZXJ2aWNlQWNjZXNzVG9rZW4iLCJqdGkiOiI2ODM4NjEyYi1hZDIxLTQ5M2MtYWMzOS0yZTkzYjU0ZjU0M2YiLCJpYXQiOiI1LzIyLzIwMjMgOTozNToxMyBBTSIsIlVzZXJJZCI6InN3bCIsIlVzZXJBdXRvSUQiOiIxIiwiVXNlclR5cGVJRCI6IjEiLCJPcmdhbml6YXRpb25JRCI6IjEiLCJEZXNpZ25hdGlvbklEIjoiMCIsIlVzZXJGdWxsTmFtZSI6IlNvbHV0aW9uIFdvcmwgTGltaXRlZCIsIlVzZXJSb2xlSUQiOiIxIiwiZXhwIjoxNjg0Nzg0MTEzLCJpc3MiOiJKV1RBdXRoZW50aWNhdGlvblNlcnZlciIsImF1ZCI6IkpXVFNlcnZpY2VQb3N0bWFuQ2xpZW50In0.8EitrYji1X2m11O9KpxuHFuI4q-pPTa1PU5M62OuPXA","expiration":"2023-05-22T19:35:13Z","userEmail":null,"statusCode":200,"message":"Success"}
/// permissions : [{"hasChild":false,"childList":null,"permissionID":34,"permissionName":"departments","displayName":"Department","parentPermissionID":5,"isActive":true,"iconName":null,"routePath":"settings/departments","permissionType":1,"orderNo":0,"createdBy":1,"createdDate":"2023-05-13T00:00:00","updatedBy":1,"updatedDate":"2023-05-13T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":35,"permissionName":"designations","displayName":"Designation","parentPermissionID":5,"isActive":true,"iconName":null,"routePath":"settings/designations","permissionType":1,"orderNo":0,"createdBy":1,"createdDate":"2023-05-13T00:00:00","updatedBy":1,"updatedDate":"2023-05-13T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":2035,"permissionName":"applicationMigration","displayName":"Application Migration","parentPermissionID":2034,"isActive":true,"iconName":null,"routePath":"cda/application-migration","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2023-05-17T00:00:00","updatedBy":1,"updatedDate":"2023-05-17T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":30,"permissionName":"administrativeUnit","displayName":"Administrative unit","parentPermissionID":5,"isActive":true,"iconName":null,"routePath":null,"permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2023-01-31T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":31,"permissionName":"organizationAdministrativeMap","displayName":"Organization Administrative Map","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/organization-administrative-map","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2023-02-01T00:00:00","updatedBy":1,"updatedDate":"2023-02-01T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":4,"permissionName":"userCreate","displayName":"User Create","parentPermissionID":2,"isActive":true,"iconName":"bx bx-home-circle","routePath":"settings/user/user-create/0","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2022-01-01T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":1,"permissionName":"root","displayName":"root","parentPermissionID":0,"isActive":true,"iconName":" ","routePath":"root","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2022-01-01T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":13,"permissionName":"dashboard","displayName":"Dashboard","parentPermissionID":1,"isActive":true,"iconName":"bx bx-home-circle","routePath":"feature/dashboard","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2023-01-16T00:00:00","updatedBy":1,"updatedDate":"2023-01-18T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":16,"permissionName":"organizationCreate","displayName":"Organization Create","parentPermissionID":15,"isActive":true,"iconName":null,"routePath":"settings/organization/organization-create/0","permissionType":1,"orderNo":1,"createdBy":1,"createdDate":"2023-01-16T00:00:00","updatedBy":1,"updatedDate":"2023-01-16T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":23,"permissionName":"button","displayName":"button","parentPermissionID":22,"isActive":true,"iconName":"button","routePath":"button","permissionType":3,"orderNo":1,"createdBy":1,"createdDate":"2023-01-28T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Role"},{"hasChild":false,"childList":null,"permissionID":3,"permissionName":"userList","displayName":"User List","parentPermissionID":2,"isActive":true,"iconName":" bx bx-home-circle","routePath":"settings/user/user-list","permissionType":1,"orderNo":2,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-18T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":15,"permissionName":"organization","displayName":"Organization","parentPermissionID":5,"isActive":true,"iconName":null,"routePath":"","permissionType":1,"orderNo":2,"createdBy":1,"createdDate":"2023-01-16T00:00:00","updatedBy":1,"updatedDate":"2023-05-14T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":8,"permissionName":"globalSetting","displayName":"Global Setting","parentPermissionID":5,"isActive":true,"iconName":"","routePath":"settings/global-setting","permissionType":1,"orderNo":2,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":5,"permissionName":"","displayName":"Setup","parentPermissionID":1,"isActive":true,"iconName":"bx bx-cog","routePath":"","permissionType":1,"orderNo":2,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-18T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":32,"permissionName":"country","displayName":"Country","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/country","permissionType":1,"orderNo":2,"createdBy":1,"createdDate":"2023-02-04T00:00:00","updatedBy":1,"updatedDate":"2023-02-04T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":25,"permissionName":"division","displayName":"Division","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/division","permissionType":1,"orderNo":3,"createdBy":1,"createdDate":"2023-01-29T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":1034,"permissionName":"userDpzMap","displayName":"User DPZ Map","parentPermissionID":2,"isActive":true,"iconName":" bx bx-home-circle","routePath":"settings/user-dpz-map","permissionType":1,"orderNo":3,"createdBy":1,"createdDate":"2023-05-14T00:00:00","updatedBy":1,"updatedDate":"2023-05-16T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":6,"permissionName":"permission","displayName":"Permission","parentPermissionID":5,"isActive":true,"iconName":"","routePath":"settings/permission","permissionType":1,"orderNo":3,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":2,"permissionName":"","displayName":"User","parentPermissionID":1,"isActive":true,"iconName":"bx bx-user","routePath":"","permissionType":1,"orderNo":3,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-16T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":10,"permissionName":"notificationArea","displayName":"Notification Area","parentPermissionID":5,"isActive":true,"iconName":"","routePath":"settings/notification-area","permissionType":1,"orderNo":4,"createdBy":1,"createdDate":"2023-01-15T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Menu"},{"hasChild":true,"childList":null,"permissionID":2034,"permissionName":"application","displayName":"Application","parentPermissionID":1,"isActive":true,"iconName":null,"routePath":null,"permissionType":1,"orderNo":4,"createdBy":1,"createdDate":"2023-05-17T00:00:00","updatedBy":1,"updatedDate":"2023-05-17T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":22,"permissionName":"district","displayName":"District","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/district","permissionType":1,"orderNo":4,"createdBy":1,"createdDate":"2023-01-28T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":27,"permissionName":"upazila-city-corporation","displayName":"Upazila/City Corporation","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/upazila-city-corporation","permissionType":1,"orderNo":5,"createdBy":1,"createdDate":"2023-01-29T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":20,"permissionName":"permissionUserRoleMap","displayName":"Permission-Role Map","parentPermissionID":5,"isActive":true,"iconName":null,"routePath":"settings/permission-role-map","permissionType":1,"orderNo":5,"createdBy":1,"createdDate":"2023-01-18T00:00:00","updatedBy":1,"updatedDate":"2023-01-18T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":24,"permissionName":"page","displayName":"page","parentPermissionID":22,"isActive":true,"iconName":"page","routePath":"page","permissionType":2,"orderNo":6,"createdBy":1,"createdDate":"2023-01-28T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Button"},{"hasChild":false,"childList":null,"permissionID":7,"permissionName":"userRole","displayName":"User Role","parentPermissionID":5,"isActive":true,"iconName":"","routePath":"settings/user-role","permissionType":1,"orderNo":6,"createdBy":1,"createdDate":"2022-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-28T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":26,"permissionName":"thana","displayName":"Thana","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/thana","permissionType":1,"orderNo":6,"createdBy":1,"createdDate":"2023-01-29T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":36,"permissionName":"mouzas","displayName":"Mouza","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/mouzas","permissionType":1,"orderNo":7,"createdBy":1,"createdDate":"2023-05-13T00:00:00","updatedBy":1,"updatedDate":"2023-05-13T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":37,"permissionName":"dpzs","displayName":"DPZ","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/dpzs","permissionType":1,"orderNo":8,"createdBy":1,"createdDate":"2023-05-13T00:00:00","updatedBy":1,"updatedDate":"2023-05-13T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":19,"permissionName":"organizationList","displayName":"Organization List","parentPermissionID":15,"isActive":true,"iconName":"","routePath":"settings/organization/organization-list","permissionType":1,"orderNo":8,"createdBy":1,"createdDate":"2023-01-16T00:00:00","updatedBy":1,"updatedDate":"2023-01-16T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":28,"permissionName":"union-ward","displayName":"Union/Ward","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/union-ward","permissionType":1,"orderNo":9,"createdBy":1,"createdDate":"2023-01-29T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":29,"permissionName":"village-area","displayName":"Village/Area","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/village-area","permissionType":1,"orderNo":10,"createdBy":1,"createdDate":"2023-01-29T00:00:00","updatedBy":1,"updatedDate":"2023-01-31T00:00:00","permissionTypeStr":"Menu"},{"hasChild":false,"childList":null,"permissionID":33,"permissionName":"para","displayName":"Para","parentPermissionID":30,"isActive":true,"iconName":null,"routePath":"settings/paras","permissionType":1,"orderNo":11,"createdBy":1,"createdDate":"2023-02-05T00:00:00","updatedBy":1,"updatedDate":"2023-02-05T00:00:00","permissionTypeStr":"Menu"}]
/// globalSettings : [{"globalSettingID":1,"globalSettingName":"Login Session Time","value":90,"valueInString":" 333333","isActive":false,"organizationID":0,"createdBy":1,"createdDate":"2023-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-01T00:00:00"},{"globalSettingID":2,"globalSettingName":"SMS Base Url","value":0,"valueInString":"http://182.160.105.227:8088/","isActive":true,"organizationID":1,"createdBy":1,"createdDate":"2023-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-01T00:00:00"},{"globalSettingID":3,"globalSettingName":"Google Map Key","value":1,"valueInString":"AIzaSyBiols4lFvOc7_rGeOZVI6l-YE617w7xR0","isActive":true,"organizationID":1,"createdBy":1,"createdDate":"2023-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-01T00:00:00"},{"globalSettingID":4,"globalSettingName":"Application Migration Max Data Upload","value":500,"valueInString":"500","isActive":true,"organizationID":0,"createdBy":1,"createdDate":"2023-05-01T00:00:00","updatedBy":1,"updatedDate":"2023-05-01T00:00:00"},{"globalSettingID":5,"globalSettingName":"Attachment Write Source","value":1,"valueInString":"Attachments","isActive":true,"organizationID":0,"createdBy":1,"createdDate":"2023-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-01T00:00:00"},{"globalSettingID":6,"globalSettingName":"Attachment Read Source","value":1,"valueInString":"asdasdasd","isActive":true,"organizationID":0,"createdBy":1,"createdDate":"2023-01-01T00:00:00","updatedBy":1,"updatedDate":"2023-01-01T00:00:00"}]
/// password : null

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      int? userAutoID, 
      String? userID, 
      int? userTypeID, 
      int? organizationID, 
      int? designationID, 
      String? userFullName, 
      int? userRoleID, 
      TokenResult? tokenResult, 
      List<Permissions>? permissions, 
      List<GlobalSettings>? globalSettings, 
      dynamic password,}){
    _userAutoID = userAutoID;
    _userID = userID;
    _userTypeID = userTypeID;
    _organizationID = organizationID;
    _designationID = designationID;
    _userFullName = userFullName;
    _userRoleID = userRoleID;
    _tokenResult = tokenResult;
    _permissions = permissions;
    _globalSettings = globalSettings;
    _password = password;
}

  UserModel.fromJson(dynamic json) {
    _userAutoID = json['userAutoID'];
    _userID = json['userID'];
    _userTypeID = json['userTypeID'];
    _organizationID = json['organizationID'];
    _designationID = json['designationID'];
    _userFullName = json['userFullName'];
    _userRoleID = json['userRoleID'];
    _tokenResult = json['tokenResult'] != null ? TokenResult.fromJson(json['tokenResult']) : null;
    if (json['permissions'] != null) {
      _permissions = [];
      json['permissions'].forEach((v) {
        _permissions?.add(Permissions.fromJson(v));
      });
    }
    if (json['globalSettings'] != null) {
      _globalSettings = [];
      json['globalSettings'].forEach((v) {
        _globalSettings?.add(GlobalSettings.fromJson(v));
      });
    }
    _password = json['password'];
  }
  int? _userAutoID;
  String? _userID;
  int? _userTypeID;
  int? _organizationID;
  int? _designationID;
  String? _userFullName;
  int? _userRoleID;
  TokenResult? _tokenResult;
  List<Permissions>? _permissions;
  List<GlobalSettings>? _globalSettings;
  dynamic _password;
UserModel copyWith({  int? userAutoID,
  String? userID,
  int? userTypeID,
  int? organizationID,
  int? designationID,
  String? userFullName,
  int? userRoleID,
  TokenResult? tokenResult,
  List<Permissions>? permissions,
  List<GlobalSettings>? globalSettings,
  dynamic password,
}) => UserModel(  userAutoID: userAutoID ?? _userAutoID,
  userID: userID ?? _userID,
  userTypeID: userTypeID ?? _userTypeID,
  organizationID: organizationID ?? _organizationID,
  designationID: designationID ?? _designationID,
  userFullName: userFullName ?? _userFullName,
  userRoleID: userRoleID ?? _userRoleID,
  tokenResult: tokenResult ?? _tokenResult,
  permissions: permissions ?? _permissions,
  globalSettings: globalSettings ?? _globalSettings,
  password: password ?? _password,
);
  int? get userAutoID => _userAutoID;
  String? get userID => _userID;
  int? get userTypeID => _userTypeID;
  int? get organizationID => _organizationID;
  int? get designationID => _designationID;
  String? get userFullName => _userFullName;
  int? get userRoleID => _userRoleID;
  TokenResult? get tokenResult => _tokenResult;
  List<Permissions>? get permissions => _permissions;
  List<GlobalSettings>? get globalSettings => _globalSettings;
  dynamic get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userAutoID'] = _userAutoID;
    map['userID'] = _userID;
    map['userTypeID'] = _userTypeID;
    map['organizationID'] = _organizationID;
    map['designationID'] = _designationID;
    map['userFullName'] = _userFullName;
    map['userRoleID'] = _userRoleID;
    if (_tokenResult != null) {
      map['tokenResult'] = _tokenResult?.toJson();
    }
    if (_permissions != null) {
      map['permissions'] = _permissions?.map((v) => v.toJson()).toList();
    }
    if (_globalSettings != null) {
      map['globalSettings'] = _globalSettings?.map((v) => v.toJson()).toList();
    }
    map['password'] = _password;
    return map;
  }

}

/// globalSettingID : 1
/// globalSettingName : "Login Session Time"
/// value : 90
/// valueInString : " 333333"
/// isActive : false
/// organizationID : 0
/// createdBy : 1
/// createdDate : "2023-01-01T00:00:00"
/// updatedBy : 1
/// updatedDate : "2023-01-01T00:00:00"

GlobalSettings globalSettingsFromJson(String str) => GlobalSettings.fromJson(json.decode(str));
String globalSettingsToJson(GlobalSettings data) => json.encode(data.toJson());
class GlobalSettings {
  GlobalSettings({
      int? globalSettingID, 
      String? globalSettingName, 
      int? value, 
      String? valueInString, 
      bool? isActive, 
      int? organizationID, 
      int? createdBy, 
      String? createdDate, 
      int? updatedBy, 
      String? updatedDate,}){
    _globalSettingID = globalSettingID;
    _globalSettingName = globalSettingName;
    _value = value;
    _valueInString = valueInString;
    _isActive = isActive;
    _organizationID = organizationID;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _updatedBy = updatedBy;
    _updatedDate = updatedDate;
}

  GlobalSettings.fromJson(dynamic json) {
    _globalSettingID = json['globalSettingID'];
    _globalSettingName = json['globalSettingName'];
    _value = json['value'];
    _valueInString = json['valueInString'];
    _isActive = json['isActive'];
    _organizationID = json['organizationID'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _updatedBy = json['updatedBy'];
    _updatedDate = json['updatedDate'];
  }
  int? _globalSettingID;
  String? _globalSettingName;
  int? _value;
  String? _valueInString;
  bool? _isActive;
  int? _organizationID;
  int? _createdBy;
  String? _createdDate;
  int? _updatedBy;
  String? _updatedDate;
GlobalSettings copyWith({  int? globalSettingID,
  String? globalSettingName,
  int? value,
  String? valueInString,
  bool? isActive,
  int? organizationID,
  int? createdBy,
  String? createdDate,
  int? updatedBy,
  String? updatedDate,
}) => GlobalSettings(  globalSettingID: globalSettingID ?? _globalSettingID,
  globalSettingName: globalSettingName ?? _globalSettingName,
  value: value ?? _value,
  valueInString: valueInString ?? _valueInString,
  isActive: isActive ?? _isActive,
  organizationID: organizationID ?? _organizationID,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  updatedBy: updatedBy ?? _updatedBy,
  updatedDate: updatedDate ?? _updatedDate,
);
  int? get globalSettingID => _globalSettingID;
  String? get globalSettingName => _globalSettingName;
  int? get value => _value;
  String? get valueInString => _valueInString;
  bool? get isActive => _isActive;
  int? get organizationID => _organizationID;
  int? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  int? get updatedBy => _updatedBy;
  String? get updatedDate => _updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['globalSettingID'] = _globalSettingID;
    map['globalSettingName'] = _globalSettingName;
    map['value'] = _value;
    map['valueInString'] = _valueInString;
    map['isActive'] = _isActive;
    map['organizationID'] = _organizationID;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['updatedBy'] = _updatedBy;
    map['updatedDate'] = _updatedDate;
    return map;
  }

}

/// hasChild : false
/// childList : null
/// permissionID : 34
/// permissionName : "departments"
/// displayName : "Department"
/// parentPermissionID : 5
/// isActive : true
/// iconName : null
/// routePath : "settings/departments"
/// permissionType : 1
/// orderNo : 0
/// createdBy : 1
/// createdDate : "2023-05-13T00:00:00"
/// updatedBy : 1
/// updatedDate : "2023-05-13T00:00:00"
/// permissionTypeStr : "Menu"

Permissions permissionsFromJson(String str) => Permissions.fromJson(json.decode(str));
String permissionsToJson(Permissions data) => json.encode(data.toJson());
class Permissions {
  Permissions({
      bool? hasChild, 
      dynamic childList, 
      int? permissionID, 
      String? permissionName, 
      String? displayName, 
      int? parentPermissionID, 
      bool? isActive, 
      dynamic iconName, 
      String? routePath, 
      int? permissionType, 
      int? orderNo, 
      int? createdBy, 
      String? createdDate, 
      int? updatedBy, 
      String? updatedDate, 
      String? permissionTypeStr,}){
    _hasChild = hasChild;
    _childList = childList;
    _permissionID = permissionID;
    _permissionName = permissionName;
    _displayName = displayName;
    _parentPermissionID = parentPermissionID;
    _isActive = isActive;
    _iconName = iconName;
    _routePath = routePath;
    _permissionType = permissionType;
    _orderNo = orderNo;
    _createdBy = createdBy;
    _createdDate = createdDate;
    _updatedBy = updatedBy;
    _updatedDate = updatedDate;
    _permissionTypeStr = permissionTypeStr;
}

  Permissions.fromJson(dynamic json) {
    _hasChild = json['hasChild'];
    _childList = json['childList'];
    _permissionID = json['permissionID'];
    _permissionName = json['permissionName'];
    _displayName = json['displayName'];
    _parentPermissionID = json['parentPermissionID'];
    _isActive = json['isActive'];
    _iconName = json['iconName'];
    _routePath = json['routePath'];
    _permissionType = json['permissionType'];
    _orderNo = json['orderNo'];
    _createdBy = json['createdBy'];
    _createdDate = json['createdDate'];
    _updatedBy = json['updatedBy'];
    _updatedDate = json['updatedDate'];
    _permissionTypeStr = json['permissionTypeStr'];
  }
  bool? _hasChild;
  dynamic _childList;
  int? _permissionID;
  String? _permissionName;
  String? _displayName;
  int? _parentPermissionID;
  bool? _isActive;
  dynamic _iconName;
  String? _routePath;
  int? _permissionType;
  int? _orderNo;
  int? _createdBy;
  String? _createdDate;
  int? _updatedBy;
  String? _updatedDate;
  String? _permissionTypeStr;
Permissions copyWith({  bool? hasChild,
  dynamic childList,
  int? permissionID,
  String? permissionName,
  String? displayName,
  int? parentPermissionID,
  bool? isActive,
  dynamic iconName,
  String? routePath,
  int? permissionType,
  int? orderNo,
  int? createdBy,
  String? createdDate,
  int? updatedBy,
  String? updatedDate,
  String? permissionTypeStr,
}) => Permissions(  hasChild: hasChild ?? _hasChild,
  childList: childList ?? _childList,
  permissionID: permissionID ?? _permissionID,
  permissionName: permissionName ?? _permissionName,
  displayName: displayName ?? _displayName,
  parentPermissionID: parentPermissionID ?? _parentPermissionID,
  isActive: isActive ?? _isActive,
  iconName: iconName ?? _iconName,
  routePath: routePath ?? _routePath,
  permissionType: permissionType ?? _permissionType,
  orderNo: orderNo ?? _orderNo,
  createdBy: createdBy ?? _createdBy,
  createdDate: createdDate ?? _createdDate,
  updatedBy: updatedBy ?? _updatedBy,
  updatedDate: updatedDate ?? _updatedDate,
  permissionTypeStr: permissionTypeStr ?? _permissionTypeStr,
);
  bool? get hasChild => _hasChild;
  dynamic get childList => _childList;
  int? get permissionID => _permissionID;
  String? get permissionName => _permissionName;
  String? get displayName => _displayName;
  int? get parentPermissionID => _parentPermissionID;
  bool? get isActive => _isActive;
  dynamic get iconName => _iconName;
  String? get routePath => _routePath;
  int? get permissionType => _permissionType;
  int? get orderNo => _orderNo;
  int? get createdBy => _createdBy;
  String? get createdDate => _createdDate;
  int? get updatedBy => _updatedBy;
  String? get updatedDate => _updatedDate;
  String? get permissionTypeStr => _permissionTypeStr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hasChild'] = _hasChild;
    map['childList'] = _childList;
    map['permissionID'] = _permissionID;
    map['permissionName'] = _permissionName;
    map['displayName'] = _displayName;
    map['parentPermissionID'] = _parentPermissionID;
    map['isActive'] = _isActive;
    map['iconName'] = _iconName;
    map['routePath'] = _routePath;
    map['permissionType'] = _permissionType;
    map['orderNo'] = _orderNo;
    map['createdBy'] = _createdBy;
    map['createdDate'] = _createdDate;
    map['updatedBy'] = _updatedBy;
    map['updatedDate'] = _updatedDate;
    map['permissionTypeStr'] = _permissionTypeStr;
    return map;
  }

}

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJKV1RTZXJ2aWNlQWNjZXNzVG9rZW4iLCJqdGkiOiI2ODM4NjEyYi1hZDIxLTQ5M2MtYWMzOS0yZTkzYjU0ZjU0M2YiLCJpYXQiOiI1LzIyLzIwMjMgOTozNToxMyBBTSIsIlVzZXJJZCI6InN3bCIsIlVzZXJBdXRvSUQiOiIxIiwiVXNlclR5cGVJRCI6IjEiLCJPcmdhbml6YXRpb25JRCI6IjEiLCJEZXNpZ25hdGlvbklEIjoiMCIsIlVzZXJGdWxsTmFtZSI6IlNvbHV0aW9uIFdvcmwgTGltaXRlZCIsIlVzZXJSb2xlSUQiOiIxIiwiZXhwIjoxNjg0Nzg0MTEzLCJpc3MiOiJKV1RBdXRoZW50aWNhdGlvblNlcnZlciIsImF1ZCI6IkpXVFNlcnZpY2VQb3N0bWFuQ2xpZW50In0.8EitrYji1X2m11O9KpxuHFuI4q-pPTa1PU5M62OuPXA"
/// expiration : "2023-05-22T19:35:13Z"
/// userEmail : null
/// statusCode : 200
/// message : "Success"

TokenResult tokenResultFromJson(String str) => TokenResult.fromJson(json.decode(str));
String tokenResultToJson(TokenResult data) => json.encode(data.toJson());
class TokenResult {
  TokenResult({
      String? accessToken, 
      String? expiration, 
      dynamic userEmail, 
      int? statusCode, 
      String? message,}){
    _accessToken = accessToken;
    _expiration = expiration;
    _userEmail = userEmail;
    _statusCode = statusCode;
    _message = message;
}

  TokenResult.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _expiration = json['expiration'];
    _userEmail = json['userEmail'];
    _statusCode = json['statusCode'];
    _message = json['message'];
  }
  String? _accessToken;
  String? _expiration;
  dynamic _userEmail;
  int? _statusCode;
  String? _message;
TokenResult copyWith({  String? accessToken,
  String? expiration,
  dynamic userEmail,
  int? statusCode,
  String? message,
}) => TokenResult(  accessToken: accessToken ?? _accessToken,
  expiration: expiration ?? _expiration,
  userEmail: userEmail ?? _userEmail,
  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
);
  String? get accessToken => _accessToken;
  String? get expiration => _expiration;
  dynamic get userEmail => _userEmail;
  int? get statusCode => _statusCode;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['expiration'] = _expiration;
    map['userEmail'] = _userEmail;
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    return map;
  }

}