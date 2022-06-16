import 'package:dio/dio.dart';

import 'package:flutter_cleanarchitecture/entity/connected_device_entity.dart';
import 'package:flutter_cleanarchitecture/repository/device_repository.dart';
import 'package:flutter_cleanarchitecture/util/use_case.dart';

class GetConnectedDevicesUseCase
    implements UseCase<void, List<ConnectedDeviceEntity>> {
  DeviceRepository _deviceRepository;

  GetConnectedDevicesUseCase(this._deviceRepository);

  @override
  void execute(
      {void input,
      required Function(List<ConnectedDeviceEntity>) onSuccess,
      required Function(Exception) onError}) {
    _process(
      _deviceRepository.fetchConnectedDeviceEntities(),
      onSuccess,
      onError,
    );
  }

  void _process(
      Future<List<ConnectedDeviceEntity>> call,
      Function(List<ConnectedDeviceEntity>) callback,
      Function(Exception) onError) {
    call.then((data) => callback(data)).catchError((err) {
      if (err is DioError) {
        onError(err.error);
      } else {
        print(err);
        onError(err);
      }
    });
  }
}
