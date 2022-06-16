// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_block_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBlockList _$GetBlockListFromJson(Map<String, dynamic> json) {
  return GetBlockList(
    json['status'] as String,
    (json['block_list'] as List<dynamic>)
        .map((e) => BlockedDevice.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetBlockListToJson(GetBlockList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'block_list': instance.block_list,
    };
