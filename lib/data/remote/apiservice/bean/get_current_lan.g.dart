// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_lan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentLan _$GetCurrentLanFromJson(Map<String, dynamic> json) {
  return GetCurrentLan(
    json['status'] as String,
    Lan.fromJson(json['lan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCurrentLanToJson(GetCurrentLan instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lan': instance.lan,
    };

Lan _$LanFromJson(Map<String, dynamic> json) {
  return Lan(
    json['ip'] as String,
    json['submask'] as String,
    Dhcp.fromJson(json['dhcp'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LanToJson(Lan instance) => <String, dynamic>{
      'ip': instance.ip,
      'submask': instance.submask,
      'dhcp': instance.dhcp,
    };

Dhcp _$DhcpFromJson(Map<String, dynamic> json) {
  return Dhcp(
    json['status'] as String,
    json['start_ip'] as String,
    json['end_ip'] as String,
    json['Default_Gateway'] as String,
    json['dns'] as String,
  );
}

Map<String, dynamic> _$DhcpToJson(Dhcp instance) => <String, dynamic>{
      'status': instance.status,
      'start_ip': instance.start_ip,
      'end_ip': instance.end_ip,
      'Default_Gateway': instance.Default_Gateway,
      'dns': instance.dns,
    };
