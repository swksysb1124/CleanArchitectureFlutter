// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_wan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentWan _$GetCurrentWanFromJson(Map<String, dynamic> json) {
  return GetCurrentWan(
    json['status'] as String,
    Wan.fromJson(json['wan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCurrentWanToJson(GetCurrentWan instance) =>
    <String, dynamic>{
      'status': instance.status,
      'wan': instance.wan,
    };

Wan _$WanFromJson(Map<String, dynamic> json) {
  return Wan(
    json['connectype'] as String,
    json['ip'] as String,
    json['submask'] as String,
    json['dns1'] as String,
    json['dns2'] as String,
    json['gateway'] as String,
    json['interface'] as String,
  );
}

Map<String, dynamic> _$WanToJson(Wan instance) => <String, dynamic>{
      'connectype': instance.connectype,
      'ip': instance.ip,
      'submask': instance.submask,
      'dns1': instance.dns1,
      'dns2': instance.dns2,
      'gateway': instance.gateway,
      'interface': instance.interface,
    };
