import 'package:flutter_cleanarchitecture/data/platform/battery_method_channel.dart';

class GetBatteryUseCase {
  BatteryMethodChannel batteryMethodChannel = BatteryMethodChannel();

  void execute(Function(int) callback, Function(Error) error) {
    batteryMethodChannel.queryBatteryLevel().then(
          (value) => callback(value),
          onError: (e) => error(e),
        );
  }
}
