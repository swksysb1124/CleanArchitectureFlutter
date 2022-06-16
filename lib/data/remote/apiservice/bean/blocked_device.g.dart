// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockedDevice _$BlockedDeviceFromJson(Map<String, dynamic> json) {
  return BlockedDevice(
    json['name'] as String,
    json['mac'] as String,
    json['connect_type'] as String,
  );
}

Map<String, dynamic> _$BlockedDeviceToJson(BlockedDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
      'connect_type': instance.connect_type,
    };
