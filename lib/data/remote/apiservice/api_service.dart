import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_block_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_profile_list.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/bean/get_router_info.dart';
import 'package:retrofit/http.dart';
import 'bean/get_client_list.dart';
import 'bean/get_current_data.dart';
import 'bean/get_current_lan.dart';
import 'bean/get_current_wan.dart';
import 'bean/get_current_wifi.dart';
import 'bean/get_onboard_status.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://example/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("onboard_status/")
  Future<GetOnboardStatus> fetchOnboardStatus();

  @GET("current_data/{token}")
  Future<GetCurrentData> getCurrentData(@Path("token") String token);

  @GET("current_data/wifi/{token}")
  Future<GetCurrentWifi> fetchCurrentWifi(@Path("token") String token);

  @GET("current_data/wifi/{token}")
  Future<GetCurrentWan> getCurrentWan(@Path("token") String token);

  @GET("current_data/wifi/{token}")
  Future<GetCurrentLan> getCurrentLan(@Path("token") String token);

  @GET("table_data/router_info/{token}")
  Future<GetRouterInfo> getRouterInfo(@Path("token") String token);

  @GET("table_data/client_list/{token}")
  Future<GetClientList> fetchClientList(@Path("token") String token);

  @GET("table_data/block_list/{token}")
  Future<GetBlockList> fetchBlockList(@Path("token") String token);

  @GET("parental_ctrl/profile/{token}")
  Future<GetProfileList> fetchProfileList(@Path("token") String token);

}
