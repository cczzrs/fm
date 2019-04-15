import 'package:json_annotation/json_annotation.dart';


/*
 * 所有需要显示的数据模型
 */
/// 用户基本信息
Map<String, dynamic> userInfo = {};

/// 用户基本信息
Map<String, dynamic> user = {"id": null, "name": ""};

const Map fmwl_main = {
  "code": "",
  "user": "",
  "status": "",
  "created": "",
  "updated": "",
};



@JsonSerializable()
class DownloadSource {
  String url;
  bool isSourceCode;
  String name;
  int size;

  DownloadSource(
      this.url,
      this.isSourceCode,
      this.name,
      this.size,
      );

  factory DownloadSource.fromJson(Map<String, dynamic> json) => _$DownloadSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DownloadSourceToJson(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadSource _$DownloadSourceFromJson(Map<String, dynamic> json) {
  return DownloadSource(json['url'] as String, json['isSourceCode'] as bool,
      json['name'] as String, json['size'] as int);
}

Map<String, dynamic> _$DownloadSourceToJson(DownloadSource instance) =>
    <String, dynamic>{
      'url': instance.url,
      'isSourceCode': instance.isSourceCode,
      'name': instance.name,
      'size': instance.size
    };
