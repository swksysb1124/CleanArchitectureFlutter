import 'package:json_annotation/json_annotation.dart';

part 'get_current_wan.g.dart';

@JsonSerializable()
class GetCurrentWan {
  String status;
  Wan wan;

  GetCurrentWan(this.status, this.wan);

  factory GetCurrentWan.fromJson(Map<String, dynamic> json) => _$GetCurrentWanFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentWanToJson(this);

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