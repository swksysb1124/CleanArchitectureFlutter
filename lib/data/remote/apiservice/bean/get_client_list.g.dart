// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_client_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetClientList _$GetClientListFromJson(Map<String, dynamic> json) {
  return GetClientList(
    (json['client_list'] as List<dynamic>)
        .map((e) => Client.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['current_client'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$GetClientListToJson(GetClientList instance) =>
    <String, dynamic>{
      'client_list': instance.client_list,
      'current_client': instance.current_client,
      'status': instance.status,
    };

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    json['index'] as int,
    json['name'] as String,
    json['mac'] as String,
    json['ip'] as String,
    json['connect_type'] as String,
    json['rssi'] as int,
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'mac': instance.mac,
      'ip': instance.ip,
      'connect_type': instance.connect_type,
      'rssi': instance.rssi,
    };
