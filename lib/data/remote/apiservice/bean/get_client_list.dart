import 'package:json_annotation/json_annotation.dart';

part 'get_client_list.g.dart';

@JsonSerializable()
class GetClientList {
  List<Client> client_list;
  String current_client;
  String status;

  GetClientList(this.client_list, this.current_client, this.status);

  factory GetClientList.fromJson(Map<String, dynamic> json) => _$GetClientListFromJson(json);

  Map<String, dynamic> toJson() => _$GetClientListToJson(this);
}

@JsonSerializable()
class Client {
  int index;
  String name;
  String mac;
  String ip;
  String connect_type;
  int rssi;

  Client(
      this.index, this.name, this.mac, this.ip, this.connect_type, this.rssi);

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}