class DeviceInformation {
  String name;
  String mac;
  String ip;
  String typeInformation;
  String? profileInformation;
  String? blockInformation;

  DeviceInformation(this.name, this.mac, this.ip, this.typeInformation);

  DeviceInformation.empty()
      : name = "-",
        mac = "-",
        ip = "-",
        typeInformation = "-";
}