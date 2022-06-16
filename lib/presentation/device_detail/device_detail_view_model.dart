import 'package:flutter_cleanarchitecture/domain/get_connected_devices_use_case.dart';
import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_information.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_information_mapper.dart';
import 'package:flutter_cleanarchitecture/util/view_model.dart';

class DeviceDetailViewModel extends ViewModel {
  // view model data;
  bool isDeviceInformationLoading = false;
  Function(Exception)? onError;

  String targetMac = "";

  DeviceInformation _deviceInformation = DeviceInformation.empty();

  DeviceInformation get deviceInformation => _deviceInformation;
  DeviceInformationMapper deviceInformationMapper;

  // use case
  GetConnectedDevicesUseCase _getConnectedDevicesUseCase;

  DeviceDetailViewModel(this._getConnectedDevicesUseCase)
      : deviceInformationMapper = DeviceInformationMapper();

  void getDeviceInformation(String targetMac) {
    isDeviceInformationLoading = true;
    notifyListeners();

    this.targetMac = targetMac;

    _getConnectedDevicesUseCase.execute(
      onSuccess: notifyDeviceInformationIfMatched,
      onError: notifyErrorOccurred,
    );
  }

  void notifyDeviceInformationIfMatched(deviceEntities) {
    DeviceInformation updated = DeviceInformation.empty();
    for (final deviceEntity in deviceEntities) {
      if (this.targetMac == deviceEntity.mac) {
        updated = deviceInformationMapper.map(deviceEntity);
        break;
      }
    }
    isDeviceInformationLoading = false;
    _deviceInformation = updated;
    notifyListeners();
  }

  void notifyErrorOccurred(err) {
    isDeviceInformationLoading = false;
    if (onError != null) {
      onError!(err);
    }
    notifyListeners();
  }
}
