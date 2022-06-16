import 'package:json_annotation/json_annotation.dart';
part 'blocked_device.g.dart';

@JsonSerializable()
class BlockedDevice {
  String name;
  String mac;
  String connect_type;

  BlockedDevice(this.name, this.mac, this.connect_type);

  factory BlockedDevice.fromJson(Map<String, dynamic> json) => _$BlockedDeviceFromJson(json);

  Map<String, dynamic> toJson() => _$BlockedDeviceToJson(this);
}
