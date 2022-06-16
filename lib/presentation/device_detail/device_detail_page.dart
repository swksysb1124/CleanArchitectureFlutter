import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_detail_view_model.dart';
import 'package:flutter_cleanarchitecture/presentation/device_detail/device_information.dart';
import 'package:provider/provider.dart';

class DeviceDetailPage extends StatefulWidget {
  String mac;

  DeviceDetailPage({required this.mac});

  @override
  _DeviceDetailPageState createState() => _DeviceDetailPageState();
}

class _DeviceDetailPageState extends State<DeviceDetailPage> {
  late DeviceDetailViewModel viewModel;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      viewModel.getDeviceInformation(widget.mac);
      viewModel.onError = (error) {
        _showAndroidAlertDialog();
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<DeviceDetailViewModel>(context);
    var deviceInformation = viewModel.deviceInformation;
    var isLoading = viewModel.isDeviceInformationLoading;
    return Scaffold(
      appBar: _buildAppBar(isLoading, deviceInformation),
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildMacInformation(deviceInformation),
                    buildIpInformation(deviceInformation),
                    buildTypeInformation(deviceInformation),
                    buildProfileInformation(deviceInformation),
                    buildBlockInformation(deviceInformation)
                  ],
                ),
              ),
      ),
    );
  }

  AppBar _buildAppBar(bool isLoading, DeviceInformation deviceInformation) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 60,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        isLoading ? "" : deviceInformation.name,
        style: TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            viewModel.getDeviceInformation(widget.mac);
          },
        )
      ],
    );
  }

  Widget buildMacInformation(DeviceInformation deviceInformation) {
    return ListTile(
      title: Text("MAC"),
      trailing: Text(
        deviceInformation.mac.toUpperCase(),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget buildIpInformation(DeviceInformation deviceInformation) {
    return Visibility(
      visible: deviceInformation.ip.isNotEmpty,
      child: ListTile(
        title: Text("IP"),
        trailing: Text(deviceInformation.ip, style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget buildTypeInformation(DeviceInformation deviceInformation) {
    return ListTile(
      title: Text("Type"),
      trailing: Text(deviceInformation.typeInformation,
          style: TextStyle(fontSize: 16)),
    );
  }

  Widget buildProfileInformation(DeviceInformation deviceInformation) {
    return Visibility(
      visible: deviceInformation.profileInformation != null,
      child: ListTile(
        title: Text("Profile"),
        trailing: Text(deviceInformation.profileInformation ?? "",
            style: TextStyle(
                fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget buildBlockInformation(DeviceInformation deviceInformation) {
    return Visibility(
      child: Expanded(
        child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Text(
              deviceInformation.blockInformation ?? "",
              style: TextStyle(color: Colors.red, fontSize: 20),
            )),
      ),
      visible: deviceInformation.blockInformation != null,
    );
  }

  void _showAndroidAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Device no found"),
        actions: [
          TextButton(
              child: new Text("OK"),
              onPressed: () => Navigator.of(context).pop(true))
        ],
      ),
    ).then((value) => Navigator.of(context).pop());
  }
}
