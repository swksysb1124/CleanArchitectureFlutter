import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';

import 'device_information.dart';

class DeviceInformationMapper
    implements Mapper<ConnectedDeviceEntity, DeviceInformation> {
  @override
  DeviceInformation map(ConnectedDeviceEntity input) {
    String name = _parseName(input);
    String mac = input.mac;
    String ip = input.ip;
    String typeInformation = _parseTypeInformation(input);

    DeviceInformation deviceInformation =
        DeviceInformation(name, mac, ip, typeInformation);
    deviceInformation.blockInformation = _parseBlockInformation(input);
    deviceInformation.profileInformation = _parseProfileInformation(input);
    return deviceInformation;
  }

  String _parseName(ConnectedDeviceEntity device) {
    String name = device.name;
    if (device.isController) {
      name += "\n(Controller)";
    }
    return name;
  }

  String _parseTypeInformation(ConnectedDeviceEntity entity) {
    if (entity.connectType == ConnectType.ETHERNET) {
      return "Ethernet";
    } else {
      String wifiType = entity.isGuest ? "Guest" : "Main";
      String wifiBand = entity.band == Band.WIFI_2_4G ? "2.4GHz" : "5GHz";
      return "$wifiType ($wifiBand)";
    }
  }

  String? _parseBlockInformation(ConnectedDeviceEntity device) {
    String? blockInformation;
    if (device.isBlocked) {
      blockInformation = "Blocked";
    } else if (!device.isController && device.profile.index == -1) {
      blockInformation = "Can Block";
    }
    return blockInformation;
  }

  String? _parseProfileInformation(ConnectedDeviceEntity device) =>
      device.profile.index != -1 ? device.profile.name : null;
}
