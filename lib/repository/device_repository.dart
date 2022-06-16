import 'package:flutter_cleanarchitecture/data/remote/apiservice/api_service.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_wifi.dart';
import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/entity/wifi_entity.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';

import 'mapper/connected_devices_entities_mapper.dart';

class DeviceRepository {
  ApiService _apiService;
  Mapper<GetCurrentWifi, List<WifiEntity>> _wifiModelListMapper;
  Mapper<CompositeGetClientListBean, List<ConnectedDeviceEntity>>
      _connectedDeviceMapper;

  DeviceRepository(
      this._apiService, this._wifiModelListMapper, this._connectedDeviceMapper);

  Future<List<WifiEntity>> fetchWifiEntities() async {
    var onboardStatus = await _apiService.fetchOnboardStatus();
    var uniqueId = onboardStatus.unique_id;
    var currentWifi = await _apiService.fetchCurrentWifi(uniqueId);
    return _wifiModelListMapper.map(currentWifi);
  }

  Future<List<ConnectedDeviceEntity>> fetchConnectedDeviceEntities() async {
    var onboardStatus = await _apiService.fetchOnboardStatus();
    var uniqueId = onboardStatus.unique_id;
    var getProfileList = await _apiService.fetchProfileList(uniqueId);
    var getClientList = await _apiService.fetchClientList(uniqueId);
    String controllerIp = getClientList.current_client;
    var getBlockList = await _apiService.fetchBlockList(uniqueId);
    return _connectedDeviceMapper.map(CompositeGetClientListBean(
      getClientList,
      getBlockList,
      getProfileList,
      controllerIp,
    ));
  }
}
