// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_onboard_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOnboardStatus _$GetOnboardStatusFromJson(Map<String, dynamic> json) {
  return GetOnboardStatus(
    json['onboarded'] as bool,
    json['unique_id'] as String,
    json['status'] as String,
  );
}

Map<String, dynamic> _$GetOnboardStatusToJson(GetOnboardStatus instance) =>
    <String, dynamic>{
      'onboarded': instance.onboarded,
      'unique_id': instance.unique_id,
      'status': instance.status,
    };
