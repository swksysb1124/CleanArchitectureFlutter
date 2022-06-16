import 'package:json_annotation/json_annotation.dart';

part 'get_current_wifi.g.dart';

@JsonSerializable()
class GetCurrentWifi {
  String status;
  Wifi wifi;

  GetCurrentWifi(this.status, this.wifi);

  factory GetCurrentWifi.fromJson(Map<String, dynamic> json) => _$GetCurrentWifiFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentWifiToJson(this);
}

@JsonSerializable()
class Wifi {
  List<Interface> interface;
  String band_steering_enabled;
  String guest_wifi_enabled;

  Wifi(this.interface, this.band_steering_enabled, this.guest_wifi_enabled);

  factory Wifi.fromJson(Map<String, dynamic> json) => _$WifiFromJson(json);

  Map<String, dynamic> toJson() => _$WifiToJson(this);
}

@JsonSerializable()
class Interface {
  int inter_value;
  int bandwidth;
  bool is_auto_channel;
  int current_channel;
  List<Ssid> ssid;

  Interface(this.inter_value, this.bandwidth, this.is_auto_channel,
      this.current_channel, this.ssid);

  factory Interface.fromJson(Map<String, dynamic> json) => _$InterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$InterfaceToJson(this);
}

@JsonSerializable()
class Ssid {
  int index;
  String name;
  int security;
  String password;

  Ssid(this.index, this.name, this.security, this.password);

  factory Ssid.fromJson(Map<String, dynamic> json) => _$SsidFromJson(json);

  Map<String, dynamic> toJson() => _$SsidToJson(this);
}