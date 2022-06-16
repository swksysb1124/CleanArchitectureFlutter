// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentData _$GetCurrentDataFromJson(Map<String, dynamic> json) {
  return GetCurrentData(
    json['status'] as String,
    Wifi.fromJson(json['wifi'] as Map<String, dynamic>),
    Wan.fromJson(json['wan'] as Map<String, dynamic>),
    json['network_status'] as String,
    Lan.fromJson(json['lan'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCurrentDataToJson(GetCurrentData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'wifi': instance.wifi,
      'wan': instance.wan,
      'network_status': instance.network_status,
      'lan': instance.lan,
    };

Wifi _$WifiFromJson(Map<String, dynamic> json) {
  return Wifi(
    (json['interface'] as List<dynamic>)
        .map((e) => Interface.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['band_steering_enabled'] as String,
    json['guest_wifi_enabled'] as String,
  );
}

Map<String, dynamic> _$WifiToJson(Wifi instance) => <String, dynamic>{
      'interface': instance.interface,
      'band_steering_enabled': instance.band_steering_enabled,
      'guest_wifi_enabled': instance.guest_wifi_enabled,
    };

Interface _$InterfaceFromJson(Map<String, dynamic> json) {
  return Interface(
    json['inter_value'] as int,
    json['bandwidth'] as int,
    json['is_auto_channel'] as bool,
    json['current_channel'] as int,
    (json['ssid'] as List<dynamic>)
        .map((e) => Ssid.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InterfaceToJson(Interface instance) => <String, dynamic>{
      'inter_value': instance.inter_value,
      'bandwidth': instance.bandwidth,
      'is_auto_channel': instance.is_auto_channel,
      'current_channel': instance.current_channel,
      'ssid': instance.ssid,
    };

Ssid _$SsidFromJson(Map<String, dynamic> json) {
  return Ssid(
    json['index'] as int,
    json['name'] as String,
    json['security'] as int,
    json['password'] as String,
  );
}

Map<String, dynamic> _$SsidToJson(Ssid instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'security': instance.security,
      'password': instance.password,
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
