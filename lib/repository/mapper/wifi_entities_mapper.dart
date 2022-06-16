import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_wifi.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';
import 'package:flutter_cleanarchitecture/entity/wifi_entity.dart';


class WifiEntitiesMapper implements Mapper<GetCurrentWifi, List<WifiEntity>> {
  @override
  List<WifiEntity> map(GetCurrentWifi input) {
    if (input.wifi.interface.isEmpty) {
      throw Exception("No wifi data");
    }
    List<WifiEntity> wifiModels = [];
    for (final interface in input.wifi.interface) {
      var channel = interface.current_channel;
      var bandwidth = interface.bandwidth;
      var _interface = interface.inter_value;
      for (final _ssid in interface.ssid) {
        WifiEntity wifiModel = WifiEntity(_ssid.name, _ssid.password,
            _ssid.security, _interface, channel, bandwidth, _ssid.index != 0);
        wifiModels.add(wifiModel);
      }
    }
    return wifiModels;
  }
}
