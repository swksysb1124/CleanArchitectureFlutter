import 'package:flutter_cleanarchitecture/domain/get_connected_devices_use_case.dart';
import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_item_mapper.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_items_mapper.dart';
import 'package:flutter_cleanarchitecture/util/mapper.dart';
import 'package:flutter_cleanarchitecture/util/view_model.dart';
import 'client_item.dart';

class ConnectedDevicesViewModel extends ViewModel {
  List<ClientItem> clientItems = [];

  Mapper<List<ConnectedDeviceEntity>, List<ClientItem>> _clientItemsMapper;

  GetConnectedDevicesUseCase _getConnectedDevicesUseCase;

  ConnectedDevicesViewModel(this._getConnectedDevicesUseCase)
      : _clientItemsMapper = ClientItemsMapper();

  void getConnectedDevices() {
    _getConnectedDevicesUseCase.execute(
      onSuccess: onSuccess,
      onError: onFail,
    );
  }

  void onSuccess(devices) {
    clientItems = _clientItemsMapper.map(devices);
    notifyListeners();
  }

  void onFail(error) {
    print(error);
  }
}
