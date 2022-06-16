// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_wifi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentWifi _$GetCurrentWifiFromJson(Map<String, dynamic> json) {
  return GetCurrentWifi(
    json['status'] as String,
    Wifi.fromJson(json['wifi'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetCurrentWifiToJson(GetCurrentWifi instance) =>
    <String, dynamic>{
      'status': instance.status,
      'wifi': instance.wifi,
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
