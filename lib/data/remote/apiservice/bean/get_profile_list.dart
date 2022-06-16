import 'package:json_annotation/json_annotation.dart';
part 'get_profile_list.g.dart';

@JsonSerializable()
class GetProfileList {
  String status;
  List<Profile> profile;

  GetProfileList(this.status, this.profile);

  factory GetProfileList.fromJson(Map<String, dynamic> json) =>
      _$GetProfileListFromJson(json);

  Map<String, dynamic> toJson() => _$GetProfileListToJson(this);
}

@JsonSerializable()
class Profile {
  String name;
  List<ControlDevice> device;
  bool pause;
  List<String> keyword;
  List<Schedule> schedule;

  Profile(this.name, this.device, this.pause, this.keyword, this.schedule);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class ControlDevice {
  String name;
  String mac;

  ControlDevice(this.name, this.mac);

  factory ControlDevice.fromJson(Map<String, dynamic> json) =>
      _$ControlDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$ControlDeviceToJson(this);
}

@JsonSerializable()
class Schedule {
  bool enabled;
  int start;
  int end;
  bool tomorrow;

  Schedule(this.enabled, this.start, this.end, this.tomorrow);

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
