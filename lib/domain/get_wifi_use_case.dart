import 'package:dio/dio.dart';

import 'package:flutter_cleanarchitecture/entity/wifi_entity.dart';
import 'package:flutter_cleanarchitecture/repository/device_repository.dart';
import 'package:flutter_cleanarchitecture/util/use_case.dart';

class GetWifiUseCase implements UseCase<void, List<WifiEntity>> {
  DeviceRepository _dataRepository;

  GetWifiUseCase(this._dataRepository);

  @override
  void execute(
      {void input,
      required Function(List<WifiEntity>) onSuccess,
      required Function(Exception) onError}) {
    _dataRepository
        .fetchWifiEntities()
        .then((data) => onSuccess(data))
        .catchError((err) {
      if (err is DioError) {
        onError(err.error);
      } else {
        onError(err);
      }
    });
  }
}
