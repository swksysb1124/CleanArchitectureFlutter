import 'package:flutter_cleanarchitecture/repository/device_repository.dart';
import 'package:flutter_cleanarchitecture/repository/mapper/connected_devices_entities_mapper.dart';
import 'package:flutter_cleanarchitecture/repository/mapper/wifi_entities_mapper.dart';

import 'data/remote/apiservice/api_service_imp.dart';

class DependencyGraph {
  var deviceRepository;

  DeviceRepository providerRepository() {
    if (deviceRepository == null) {
      deviceRepository = DeviceRepository(
        ApiServiceImp.create(),
        WifiEntitiesMapper(),
        ConnectedDeviceEntitiesMapper(),
      );
    }
    return deviceRepository;
  }
}
