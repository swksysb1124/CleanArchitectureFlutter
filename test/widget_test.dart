// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/api_service.dart';
import 'package:flutter_cleanarchitecture/data/remote/apiservice/api_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_cleanarchitecture/main.dart';

void main() {
  test("test retrofilt", () async {
    ApiServiceImp apiServiceImp = ApiServiceImp.create();
    var getOnboardStatus = await apiServiceImp.fetchOnboardStatus();
    var token = getOnboardStatus.unique_id;
    var getProfileList = await apiServiceImp.fetchProfileList(token);
    for(final profile in getProfileList.profile) {
      print(profile.name);
    }
  });
}
