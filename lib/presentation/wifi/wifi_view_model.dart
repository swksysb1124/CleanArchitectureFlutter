import 'dart:io';
import 'package:flutter_cleanarchitecture/domain/get_wifi_use_case.dart';
import 'package:flutter_cleanarchitecture/entity/wifi_entity.dart';
import 'package:flutter_cleanarchitecture/util/view_model.dart';

class WifiViewModel extends ViewModel {
  String? mainSsid2g;
  String? mainPassword2g;

  String? mainSsid5g;
  String? mainPassword5g;

  String? guestSsid2g;
  String? guestPassword2g;

  String? guestSsid5g;
  String? guestPassword5g;

  String? errorMessage;
  bool isLoading = false;

  GetWifiUseCase getWifiUseCase;

  WifiViewModel(this.getWifiUseCase);

  void fetchWifi2gData() async {
    isLoading = true;
    notifyListeners();
    getWifiUseCase.execute(
        onSuccess: (wifiModelList) => onDataChanged(wifiModelList),
        onError: (error) => onErrorOccur(error));
  }

  void onDataChanged(List<WifiEntity> wifiModelList) {
    isLoading = false;
    for (final wifiModel in wifiModelList) {
      if (wifiModel.interface == 1 && !wifiModel.isGuest) {
        mainSsid2g = wifiModel.ssid;
        mainPassword2g = wifiModel.password;
      }
      if (wifiModel.interface == 0 && !wifiModel.isGuest) {
        mainSsid5g = wifiModel.ssid;
        mainPassword5g = wifiModel.password;
      }
      if (wifiModel.interface == 1 && wifiModel.isGuest) {
        guestSsid2g = wifiModel.ssid;
        guestPassword2g = wifiModel.password;
      }
      if (wifiModel.interface == 0 && wifiModel.isGuest) {
        guestSsid5g = wifiModel.ssid;
        guestPassword5g = wifiModel.password;
      }
    }
    notifyListeners();
  }

  void onErrorOccur(Exception error) {
    isLoading = false;
    if (error is SocketException) {
      print("SocketException");
      print("\taddress: ${error.address}");
      print("\tport: ${error.port}");
      print("\tmessage: ${error.message}");
      print("\tOS Error, message: ${error.osError?.message}");
      print("\tOS Error, errorCode: ${error.osError?.errorCode}");
    } else {
      errorMessage = "Error";
    }
    notifyListeners();
  }
}
