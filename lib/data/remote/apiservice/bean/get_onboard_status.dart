import 'package:json_annotation/json_annotation.dart';

part 'get_onboard_status.g.dart';

@JsonSerializable()
class GetOnboardStatus {
  bool onboarded;
  String unique_id;
  String status;

  GetOnboardStatus(this.onboarded, this.unique_id, this.status);

  factory GetOnboardStatus.fromJson(Map<String, dynamic> json) =>
      _$GetOnboardStatusFromJson(json);

  Map<String, dynamic> toJson() => _$GetOnboardStatusToJson(this);
}
