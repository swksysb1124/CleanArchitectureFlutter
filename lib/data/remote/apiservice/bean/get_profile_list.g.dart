// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileList _$GetProfileListFromJson(Map<String, dynamic> json) {
  return GetProfileList(
    json['status'] as String,
    (json['profile'] as List<dynamic>)
        .map((e) => Profile.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetProfileListToJson(GetProfileList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'profile': instance.profile,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['name'] as String,
    (json['device'] as List<dynamic>)
        .map((e) => ControlDevice.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['pause'] as bool,
    (json['keyword'] as List<dynamic>).map((e) => e as String).toList(),
    (json['schedule'] as List<dynamic>)
        .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'name': instance.name,
      'device': instance.device,
      'pause': instance.pause,
      'keyword': instance.keyword,
      'schedule': instance.schedule,
    };

ControlDevice _$ControlDeviceFromJson(Map<String, dynamic> json) {
  return ControlDevice(
    json['name'] as String,
    json['mac'] as String,
  );
}

Map<String, dynamic> _$ControlDeviceToJson(ControlDevice instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mac': instance.mac,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    json['enabled'] as bool,
    json['start'] as int,
    json['end'] as int,
    json['tomorrow'] as bool,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'enabled': instance.enabled,
      'start': instance.start,
      'end': instance.end,
      'tomorrow': instance.tomorrow,
    };
