class ConnectedDeviceEntity {
  String name;
  String mac;
  String ip;
  ConnectType connectType;
  int rssi;
  bool isController;
  bool isGuest;
  bool isBlocked;
  bool isConnected;
  ParentalControlProfile profile;
  Band band;

  ConnectedDeviceEntity(
      this.name,
      this.mac,
      this.ip,
      this.connectType,
      this.rssi,
      this.isController,
      this.isGuest,
      this.isBlocked,
      this.isConnected,
      this.profile,
      this.band);

  ConnectedDeviceEntity.onlineDevice(
      this.name,
      this.mac,
      this.ip,
      this.connectType,
      this.rssi,
      this.isController,
      this.isGuest,
      this.profile,
      this.band)
      : isBlocked = false,
        isConnected = true;

  ConnectedDeviceEntity.blockDevice(
      this.name, this.mac, this.connectType, this.band)
      : ip = "",
        rssi = 0,
        isGuest = false,
        isController = false,
        isBlocked = true,
        isConnected = false,
        profile = ParentalControlProfile.empty();
}

enum ConnectType { UNKNOWN, ETHERNET, WIFI }

enum Band { UNKNOWN, WIFI_2_4G, WIFI_5G }

class ParentalControlProfile {
  String name;
  int index;

  ParentalControlProfile(this.name, this.index);

  ParentalControlProfile.empty()
      : name = "empty",
        index = -1;
}
