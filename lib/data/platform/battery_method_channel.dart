import 'package:flutter/services.dart';

class BatteryMethodChannel {
  static const CHANNEL =
      const MethodChannel('flutter_cleanarchitecture/method_channel/battery');
  static const METHOD_QUERY_BATTERY = 'queryBatteryLevel';

  Future<int> queryBatteryLevel() async {
    int level;
    try {
      level = await CHANNEL.invokeMethod(METHOD_QUERY_BATTERY);
    } on PlatformException catch (e) {
      level = -1;
    }
    return level;
  }
}
