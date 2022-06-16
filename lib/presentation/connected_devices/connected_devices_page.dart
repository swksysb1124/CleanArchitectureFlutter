import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/client_item.dart';
import 'package:flutter_cleanarchitecture/presentation/connected_devices/connected_devices_view_model.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_detail_page.dart';
import 'package:provider/provider.dart';

class ConnectedDevicesPage extends StatefulWidget {
  @override
  _ConnectedDevicesPageState createState() => _ConnectedDevicesPageState();
}

class _ConnectedDevicesPageState extends State<ConnectedDevicesPage> {
  late ConnectedDevicesViewModel viewModel;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      viewModel.getConnectedDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ConnectedDevicesViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Connected Devices",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Container(
                color: Colors.white,
                child: Column(children: [
                  Expanded(
                      child: RefreshIndicator(
                    onRefresh: () async => viewModel.getConnectedDevices(),
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (buildContext, index) {
                        var item = viewModel.clientItems[index];
                        return item.isHeader
                            ? buildClientHeader(item)
                            : buildClientItem(item, context);
                      },
                      itemCount: viewModel.clientItems.length,
                    ),
                  ))
                ]))));
  }

  ListTile buildClientItem(ClientItem item, BuildContext context) {
    return ListTile(
        onTap: item.secondaryInformation == null && item.status == null
            ? null
            : () => goToDetailPage(context, item),
        title: Text(item.primaryInformation),
        subtitle: item.secondaryInformation == null
            ? null
            : Text(item.secondaryInformation!),
        trailing: item.status == null
            ? null
            : Text(
                item.status!,
                textAlign: TextAlign.end,
              ));
  }

  Container buildClientHeader(ClientItem item) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Color(0xFFDDDDDD),
        alignment: Alignment.centerLeft,
        child: Text(item.headerTitle!, style: TextStyle(fontSize: 16)));
  }

  void goToDetailPage(BuildContext context, ClientItem item) {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeviceDetailPage(mac: item.mac)))
        .then((value) => viewModel.getConnectedDevices());
  }
}
