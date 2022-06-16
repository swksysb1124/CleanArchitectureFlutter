import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_block_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_client_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_data.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_lan.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_wan.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_current_wifi.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_onboard_status.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_profile_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_router_info.dart';
import 'api_service.dart';

class ApiServiceImp implements ApiService {
  ApiService _apiService;

  ApiServiceImp(this._apiService);

  factory ApiServiceImp.create() {
    var dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return ApiServiceImp(ApiService(dio));
  }

  @override
  Future<GetCurrentWifi> fetchCurrentWifi(String token) {
    return _apiService.fetchCurrentWifi(token);
  }

  @override
  Future<GetOnboardStatus> fetchOnboardStatus() {
    return _apiService.fetchOnboardStatus();
  }

  @override
  Future<GetCurrentData> getCurrentData(String token) {
    return _apiService.getCurrentData(token);
  }

  @override
  Future<GetClientList> fetchClientList(String token) {
    return _apiService.fetchClientList(token);
  }

  @override
  Future<GetBlockList> fetchBlockList(String token) {
    return _apiService.fetchBlockList(token);
  }

  @override
  Future<GetCurrentLan> getCurrentLan(String token) {
    return _apiService.getCurrentLan(token);
  }

  @override
  Future<GetCurrentWan> getCurrentWan(String token) {
    return _apiService.getCurrentWan(token);
  }

  @override
  Future<GetRouterInfo> getRouterInfo(String token) {
    return _apiService.getRouterInfo(token);
  }

  @override
  Future<GetProfileList> fetchProfileList(String token) {
    return _apiService.fetchProfileList(token);
  }

}
