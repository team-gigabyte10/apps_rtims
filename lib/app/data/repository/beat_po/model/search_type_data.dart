import 'dart:convert';

import '../../../../core/model/data_response.dart';

/// lstPO :
/// [{"Id":124118,"Name":"9(02)2023","FIRNo":"9(02)2023","IsLatLongExist":false,"FIRType":"FIR","LocationDetails":"নালিতাবাড়ী থানাধীন সালেহাবাদ কৃষ্ণপট্রি গ্রামস্থ বাদীর বসত বাড়ীর দক্ষিন পার্শ্বে আবাদী জমিতে। ","POLocation":173779,"PODate":"2023-02-11T10:00:00","OccurenceTypeName":"অন্যান্য ধারার মামলা"},{"Id":116364,"Name":"5(12)2022","FIRNo":"5(12)2022","IsLatLongExist":true,"FIRType":"FIR","LocationDetails":"নালিতাবাড়ী পৌরসভাধীন ০৫ নং ওয়ার্ডের ছিটপাড়া সাকিনস্থ জনৈক আক্কাছ আলীর বাড়ির পূর্ব পাশে পাকা রাস্তার উপর।থানা হইতে দূরত্ব অনুমান ০১ কিমি, পশ্চিম দিক, ওয়ার্ড নং- ০৫ (নালিতাবাড়ী পৌরসভা) ","POLocation":160064,"PODate":"2022-12-05T18:30:00","OccurenceTypeName":"মাদকদ্রব্য আইনে মামলা"},{"Id":122413,"Name":"19(01)2023","FIRNo":"19(01)2023","IsLatLongExist":true,"FIRType":"FIR","LocationDetails":"নালিতাবাড়ী থানাধীন মরিচপুরান ইউনিনস্থ গুজাকুড়া (নলকুড়া) সাকিনস্থ ধৃত আসামীর বসত ঘরের সামনের উঠানে।","POLocation":170682,"PODate":"2023-01-28T21:50:00","OccurenceTypeName":"মাদকদ্রব্য আইনে মামলা"},{"Id":122082,"Name":"17(01)2023","FIRNo":"17(01)2023","IsLatLongExist":true,"FIRType":"FIR","LocationDetails":"নালিতাবাড়ী থানাধীন রাজনগর মৌজার তপসিল বর্ণিত জমির উত্তরের আইলের মাঝখানে।থানা হইতে দূরত্ব অনুমান ২২ কিমি, পশ্চিম দিক, । মৌজা নং- ৬৩, ইউপি নং- ৩ ","POLocation":170040,"PODate":"2023-01-23T10:30:00","OccurenceTypeName":"অন্যান্য ধারার মামলা"},{"Id":114486,"Name":"18(11)2022","FIRNo":"18(11)2022","IsLatLongExist":true,"FIRType":"FIR","LocationDetails":"শেরপুর জেলার নালিতাবাড়ী থানাধীন মরিচপুরান সরকারী পলি টেকনিক্যাল স্কুল এন্ড কলেজের সামনে পাঁকা রাস্তার উপর।","POLocation":156803,"PODate":"2022-11-19T15:30:00","OccurenceTypeName":"বিশেষ ক্ষমতা আইনে মামলা"}]

SearchTypeData searchTypeDataFromJson(String str) =>
    SearchTypeData.fromJson(json.decode(str));

String searchTypeDataToJson(SearchTypeData data) => json.encode(data.toJson());

class SearchTypeData extends Serializable {
  SearchTypeData({
    List<LstPo>? lstPO,
  }) {
    _lstPO = lstPO;
  }

  SearchTypeData.fromJson(dynamic json) {
    if (json['lstPO'] != null) {
      _lstPO = [];
      json['lstPO'].forEach((v) {
        _lstPO?.add(LstPo.fromJson(v));
      });
    }
  }

  List<LstPo>? _lstPO;

  SearchTypeData copyWith({
    List<LstPo>? lstPO,
  }) =>
      SearchTypeData(
        lstPO: lstPO ?? _lstPO,
      );

  List<LstPo>? get lstPO => _lstPO;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_lstPO != null) {
      map['lstPO'] = _lstPO?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Id : 124118
/// Name : "9(02)2023"
/// FIRNo : "9(02)2023"
/// IsLatLongExist : false
/// FIRType : "FIR"
/// LocationDetails : "নালিতাবাড়ী থানাধীন সালেহাবাদ কৃষ্ণপট্রি গ্রামস্থ বাদীর বসত বাড়ীর দক্ষিন পার্শ্বে আবাদী জমিতে। "
/// POLocation : 173779
/// PODate : "2023-02-11T10:00:00"
/// OccurenceTypeName : "অন্যান্য ধারার মামলা"

LstPo lstPoFromJson(String str) => LstPo.fromJson(json.decode(str));

String lstPoToJson(LstPo data) => json.encode(data.toJson());

class LstPo {
  LstPo({
    int? id,
    String? name,
    String? fIRNo,
    bool? isLatLongExist,
    String? fIRType,
    String? locationDetails,
    int? pOLocation,
    String? pODate,
    String? occurenceTypeName,
  }) {
    _id = id;
    _name = name;
    _fIRNo = fIRNo;
    _isLatLongExist = isLatLongExist;
    _fIRType = fIRType;
    _locationDetails = locationDetails;
    _pOLocation = pOLocation;
    _pODate = pODate;
    _occurenceTypeName = occurenceTypeName;
  }

  LstPo.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
    _fIRNo = json['FIRNo'];
    _isLatLongExist = json['IsLatLongExist'];
    _fIRType = json['FIRType'];
    _locationDetails = json['LocationDetails'];
    _pOLocation = json['POLocation'];
    _pODate = json['PODate'];
    _occurenceTypeName = json['OccurenceTypeName'];
  }

  int? _id;
  String? _name;
  String? _fIRNo;
  bool? _isLatLongExist;
  String? _fIRType;
  String? _locationDetails;
  int? _pOLocation;
  String? _pODate;
  String? _occurenceTypeName;

  LstPo copyWith({
    int? id,
    String? name,
    String? fIRNo,
    bool? isLatLongExist,
    String? fIRType,
    String? locationDetails,
    int? pOLocation,
    String? pODate,
    String? occurenceTypeName,
  }) =>
      LstPo(
        id: id ?? _id,
        name: name ?? _name,
        fIRNo: fIRNo ?? _fIRNo,
        isLatLongExist: isLatLongExist ?? _isLatLongExist,
        fIRType: fIRType ?? _fIRType,
        locationDetails: locationDetails ?? _locationDetails,
        pOLocation: pOLocation ?? _pOLocation,
        pODate: pODate ?? _pODate,
        occurenceTypeName: occurenceTypeName ?? _occurenceTypeName,
      );

  int? get id => _id;

  String? get name => _name;

  String? get fIRNo => _fIRNo;

  bool? get isLatLongExist => _isLatLongExist;

  String? get fIRType => _fIRType;

  String? get locationDetails => _locationDetails;

  int? get pOLocation => _pOLocation;

  String? get pODate => _pODate;

  String? get occurenceTypeName => _occurenceTypeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    map['FIRNo'] = _fIRNo;
    map['IsLatLongExist'] = _isLatLongExist;
    map['FIRType'] = _fIRType;
    map['LocationDetails'] = _locationDetails;
    map['POLocation'] = _pOLocation;
    map['PODate'] = _pODate;
    map['OccurenceTypeName'] = _occurenceTypeName;
    return map;
  }
}
