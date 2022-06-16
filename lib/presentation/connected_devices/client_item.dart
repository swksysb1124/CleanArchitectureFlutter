class ClientItem {
  String primaryInformation;
  String? secondaryInformation;
  String mac;
  String? status;
  bool isHeader;
  String? headerTitle;

  ClientItem(
      this.primaryInformation,
      this.secondaryInformation,
      this.mac,
      this.status,
      this.isHeader,
      this.headerTitle,
      );

  ClientItem.client(
      this.primaryInformation, this.secondaryInformation, this.mac, this.status)
      : isHeader = false;

  ClientItem.noClient()
      : primaryInformation = "No Clients",
        mac = "",
        isHeader = false;

  ClientItem.header(this.headerTitle)
      : primaryInformation = "",
        mac = "",
        isHeader = true;
}