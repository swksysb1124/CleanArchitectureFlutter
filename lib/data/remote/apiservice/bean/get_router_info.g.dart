// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_router_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRouterInfo _$GetRouterInfoFromJson(Map<String, dynamic> json) {
  return GetRouterInfo(
    json['status'] as String,
    json['name'] as String,
    json['cpu'] as String,
    json['memory'] as String,
    json['mac'] as String,
  );
}

Map<String, dynamic> _$GetRouterInfoToJson(GetRouterInfo instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'cpu': instance.cpu,
      'memory': instance.memory,
      'mac': instance.mac,
    };
