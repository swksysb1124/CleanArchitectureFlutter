import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture/domain/get_wifi_use_case.dart';
import 'package:flutter_cleanarchitecture/domain/get_connected_devices_use_case.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/connected_devices_view_model.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_detail_view_model.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/connected_devices_page.dart';
import 'package:flutter_cleanarchitecture/presentation/wifi/wifi_view_model.dart';
import 'package:provider/provider.dart';

import 'dependency_graph.dart';

void main() {
  DependencyGraph dependencyGraph = DependencyGraph();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          GetWifiUseCase getWifiUseCase =
              GetWifiUseCase(dependencyGraph.providerRepository());
          return WifiViewModel(getWifiUseCase);
        }),
        ChangeNotifierProvider(create: (context) {
          GetConnectedDevicesUseCase useCase =
              GetConnectedDevicesUseCase(dependencyGraph.providerRepository());
          return ConnectedDevicesViewModel(useCase);
        }),
        ChangeNotifierProvider(create: (context) {
          GetConnectedDevicesUseCase useCase =
              GetConnectedDevicesUseCase(dependencyGraph.providerRepository());
          return DeviceDetailViewModel(useCase);
        })
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture Practice',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      home: ConnectedDevicesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
