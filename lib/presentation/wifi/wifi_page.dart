import 'package:flutter/material.dart';
import 'package:flutter_cleanarchitecture/presentation/wifi/wifi_view_model.dart';
import 'package:provider/provider.dart';

class WifiPage extends StatefulWidget {
  @override
  _WifiPageState createState() => _WifiPageState();
}

class _WifiPageState extends State<WifiPage> {
  @override
  Widget build(BuildContext context) {
    WifiViewModel wifiViewModel = Provider.of<WifiViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Wi-Fi Setting"),
      ),
      body: Center(
        child: wifiViewModel.isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLabel("Main"),
                    SizedBox(
                        width: double.infinity,
                        child: _buildWifiCard(
                            "Wi-Fi 2.4GHz",
                            wifiViewModel.mainSsid2g,
                            wifiViewModel.mainPassword2g,
                            () => _selectWifiCard(1, false))),
                    SizedBox(
                        width: double.infinity,
                        child: _buildWifiCard(
                            "Wi-Fi 5GHz",
                            wifiViewModel.mainSsid5g,
                            wifiViewModel.mainPassword5g,
                            () => _selectWifiCard(0, false))),
                    _buildLabel("Guest"),
                    SizedBox(
                        width: double.infinity,
                        child: _buildWifiCard(
                            "Wi-Fi 2.4GHz",
                            wifiViewModel.guestSsid2g,
                            wifiViewModel.guestPassword2g,
                            () => _selectWifiCard(1, true))),
                    SizedBox(
                        width: double.infinity,
                        child: _buildWifiCard(
                            "Wi-Fi 5GHz",
                            wifiViewModel.guestSsid5g,
                            wifiViewModel.guestPassword5g,
                            () => _selectWifiCard(0, true))),
                    ElevatedButton(
                      onPressed: () {
                        wifiViewModel.fetchWifi2gData();
                      },
                      child: Text("Fetch Data"),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  SizedBox _buildLabel(String label) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Text(label, style: TextStyle(fontSize: 25))));
  }

  void _selectWifiCard(int _interface, bool isGuest) {
    String band = _interface == 0 ? "5GHz" : "2.4GHz";
    if (isGuest) {
      print("Guest Wi-Fi $band");
    } else {
      print("Main Wi-Fi $band");
    }
  }

  Widget _buildWifiCard(
      String label, String? ssid, String? password, Function()? click) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: click,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 20)),
              SizedBox(height: 15),
              Text('SSID', style: TextStyle(fontSize: 16)),
              Text(ssid ?? "-",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Password', style: TextStyle(fontSize: 16)),
              Text(password ?? "-",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
