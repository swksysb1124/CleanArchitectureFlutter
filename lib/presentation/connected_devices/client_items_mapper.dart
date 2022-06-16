import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_item.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_item_mapper.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';

class ClientItemsMapper
    implements Mapper<List<ConnectedDeviceEntity>, List<ClientItem>> {
  List<ClientItem> allClientItem = [];

  List<ClientItem> client2g = [];
  List<ClientItem> client5g = [];
  List<ClientItem> clientEth = [];
  List<ClientItem> clientBlock = [];

  Mapper<ConnectedDeviceEntity, ClientItem> _clientItemMapper;

  ClientItemsMapper() : _clientItemMapper = ClientItemMapper();

  @override
  List<ClientItem> map(List<ConnectedDeviceEntity> entities) {
    separateClientItems(entities);
    addSpecifiedHeaderAndClientItem("2.4GHz (${client2g.length})", client2g);
    addSpecifiedHeaderAndClientItem("5GHz (${client5g.length})", client5g);
    addSpecifiedHeaderAndClientItem("Eth (${clientEth.length})", clientEth);
    addSpecifiedHeaderAndClientItem("Blocked (${clientBlock.length})", clientBlock);
    return allClientItem;
  }

  void separateClientItems(List<ConnectedDeviceEntity> devices) {
    for (final device in devices) {
      ClientItem item = _clientItemMapper.map(device);
      if (device.isBlocked) {
        clientBlock.add(item);
      } else if (device.band == Band.WIFI_2_4G) {
        client2g.add(item);
      } else if (device.band == Band.WIFI_5G) {
        client5g.add(item);
      } else if (device.connectType == ConnectType.ETHERNET) {
        clientEth.add(item);
      }
    }
  }

  void addSpecifiedHeaderAndClientItem(String label, List<ClientItem> client) {
    allClientItem.add(ClientItem.header(label));
    if (client.isEmpty) {
      allClientItem.add(ClientItem.noClient());
    } else {
      allClientItem.addAll(client);
    }
  }
}
