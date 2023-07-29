import 'package:apps_rtims/utils/safe_convert.dart';

class User {
  // 115
  final int UserAutoID;

  // মোঃ মকবুল হোসেন
  final String UserName;
  final String UserImage;

  // 3
  final int AccessRight;
  final List<LstUserPermissionActionItem> lstUserPermissionAction;

  // 2
  final int OrgID;

  // V_2.3.0
  final String AppsVersion;

  // 4
  final int DivisionID;

  // true
  final bool IsAllowBRMS;

  // 2
  final int OrganizationUnitTypeID;

  // QUl6YVN5QmlvbHM0bEZ2T2M3X3JHZU9aVkk2bC1ZRTYxN3c3eFIw
  final String GoogleMapKey;

  // false
  final bool HasBeatAccess;

  User({
    this.UserAutoID = 0,
    this.UserName = "",
    this.UserImage = "",
    this.AccessRight = 0,
    required this.lstUserPermissionAction,
    this.OrgID = 0,
    this.AppsVersion = "",
    this.DivisionID = 0,
    this.IsAllowBRMS = false,
    this.OrganizationUnitTypeID = 0,
    this.GoogleMapKey = "",
    this.HasBeatAccess = false,
  });

  factory User.fromJson(Map<String, dynamic>? json) => User(
        UserAutoID: asT<int>(json, 'UserAutoID'),
        UserName: asT<String>(json, 'UserName'),
        UserImage: asT<String>(json, 'UserImage'),
        AccessRight: asT<int>(json, 'AccessRight'),
        lstUserPermissionAction: asT<List>(json, 'lstUserPermissionAction')
            .map((e) => LstUserPermissionActionItem.fromJson(e))
            .toList(),
        OrgID: asT<int>(json, 'OrgID'),
        AppsVersion: asT<String>(json, 'AppsVersion'),
        DivisionID: asT<int>(json, 'DivisionID'),
        IsAllowBRMS: asT<bool>(json, 'IsAllowBRMS'),
        OrganizationUnitTypeID: asT<int>(json, 'OrganizationUnitTypeID'),
        GoogleMapKey: asT<String>(json, 'GoogleMapKey'),
        HasBeatAccess: asT<bool>(json, 'HasBeatAccess'),
      );

  Map<String, dynamic> toJson() => {
        'UserAutoID': UserAutoID,
        'UserName': UserName,
        'UserImage': UserImage,
        'AccessRight': AccessRight,
        'lstUserPermissionAction':
            lstUserPermissionAction.map((e) => e.toJson()).toList(),
        'OrgID': OrgID,
        'AppsVersion': AppsVersion,
        'DivisionID': DivisionID,
        'IsAllowBRMS': IsAllowBRMS,
        'OrganizationUnitTypeID': OrganizationUnitTypeID,
        'GoogleMapKey': GoogleMapKey,
        'HasBeatAccess': HasBeatAccess,
      };
}

class LstUserPermissionActionItem {
  // account-transfer
  final String PermissionName;

  // Account Transfer Request
  final String DisplayName;

  // 3
  final int GroupID;

  // true
  final bool IsView;

  LstUserPermissionActionItem({
    this.PermissionName = "",
    this.DisplayName = "",
    this.GroupID = 0,
    this.IsView = false,
  });

  factory LstUserPermissionActionItem.fromJson(Map<String, dynamic>? json) =>
      LstUserPermissionActionItem(
        PermissionName: asT<String>(json, 'PermissionName'),
        DisplayName: asT<String>(json, 'DisplayName'),
        GroupID: asT<int>(json, 'GroupID'),
        IsView: asT<bool>(json, 'IsView'),
      );

  Map<String, dynamic> toJson() => {
        'PermissionName': PermissionName,
        'DisplayName': DisplayName,
        'GroupID': GroupID,
        'IsView': IsView,
      };
}
