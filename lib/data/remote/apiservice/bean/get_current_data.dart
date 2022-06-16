import 'package:json_annotation/json_annotation.dart';

part 'get_current_data.g.dart';

@JsonSerializable()
class GetCurrentData {
  String status;
  Wifi wifi;
  Wan wan;
  String network_status;
  Lan lan;

  GetCurrentData(this.status, this.wifi, this.wan, this.network_status,
      this.lan);

  factory GetCurrentData.fromJson(Map<String, dynamic> json) => _$GetCurrentDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentDataToJson(this);

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

@JsonSerializable()
class Wan {
  String connectype;
  String ip;
  String submask;
  String dns1;
  String dns2;
  String gateway;
  String interface;

  Wan(this.connectype, this.ip, this.submask, this.dns1, this.dns2,
      this.gateway, this.interface);

  factory Wan.fromJson(Map<String, dynamic> json) => _$WanFromJson(json);

  Map<String, dynamic> toJson() => _$WanToJson(this);
}

@JsonSerializable()
class Lan {
  String ip;
  String submask;
  Dhcp dhcp;

  Lan(this.ip, this.submask, this.dhcp);

  factory Lan.fromJson(Map<String, dynamic> json) => _$LanFromJson(json);

  Map<String, dynamic> toJson() => _$LanToJson(this);
}

@JsonSerializable()
class Dhcp {
  String status;
  String start_ip;
  String end_ip;
  String Default_Gateway;
  String dns;

  Dhcp(this.status, this.start_ip, this.end_ip, this.Default_Gateway, this.dns);

  factory Dhcp.fromJson(Map<String, dynamic> json) => _$DhcpFromJson(json);

  Map<String, dynamic> toJson() => _$DhcpToJson(this);
}