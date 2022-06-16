import 'package:json_annotation/json_annotation.dart';

import 'blocked_device.dart';

part 'get_block_list.g.dart';

@JsonSerializable()
class GetBlockList {
  String status;
  List<BlockedDevice> block_list;

  GetBlockList(this.status, this.block_list);

  factory GetBlockList.fromJson(Map<String, dynamic> json) => _$GetBlockListFromJson(json);

  Map<String, dynamic> toJson() => _$GetBlockListToJson(this);
}

