import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_item.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';

class ClientItemMapper implements Mapper<ConnectedDeviceEntity, ClientItem> {

  @override
  ClientItem map(ConnectedDeviceEntity client) {
    String status = getClientStatus(client);
    String primary = getPrimaryInformation(client);
    String secondary = getSecondaryInformation(client);
    return ClientItem.client(primary, secondary, client.mac, status);
  }

  String getPrimaryInformation(ConnectedDeviceEntity client) {
    String primary = client.name;
    if (client.profile.index != -1) {
      primary += " (${client.profile.name})";
    }
    if (client.isController) {
      primary += " @";
    }
    return primary;
  }

  String getSecondaryInformation(ConnectedDeviceEntity client) {
    String secondary = "${client.ip}\t${client.mac.toUpperCase()}";
    return secondary;
  }

  String getClientStatus(ConnectedDeviceEntity client) {
    String status = "";
    if (client.isBlocked) {
      status = "Blocked";
    } else if (client.connectType == ConnectType.WIFI) {
      String bandName = client.band == Band.WIFI_2_4G ? "2.4GHz" : "5GHz";
      status = "Wi-Fi\n$bandName";
    } else if (client.connectType == ConnectType.ETHERNET) {
      status = "Eth";
    }
    return status;
  }
}
