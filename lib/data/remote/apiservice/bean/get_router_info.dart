import 'package:json_annotation/json_annotation.dart';

part 'get_router_info.g.dart';

@JsonSerializable()
class GetRouterInfo {
  String status;
  String name;
  String cpu;
  String memory;
  String mac;

  GetRouterInfo(this.status, this.name, this.cpu, this.memory, this.mac);

  factory GetRouterInfo.fromJson(Map<String, dynamic> json) => _$GetRouterInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GetRouterInfoToJson(this);
}