import 'package:json_annotation/json_annotation.dart';

part 'get_current_lan.g.dart';

@JsonSerializable()
class GetCurrentLan {
  String status;
  Lan lan;

  GetCurrentLan(this.status, this.lan);

  factory GetCurrentLan.fromJson(Map<String, dynamic> json) => _$GetCurrentLanFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentLanToJson(this);
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