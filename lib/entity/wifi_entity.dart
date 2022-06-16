class WifiEntity {
  String _ssid;
  String _password;
  int _encryption;
  int _interface;
  int _channel;
  int _bandwidth;
  bool _isGuest;

  WifiEntity(this._ssid, this._password, this._encryption, this._interface,
      this._channel, this._bandwidth, this._isGuest);

  int get interface => _interface;

  int get encryption => _encryption;

  String get password => _password;

  String get ssid => _ssid;

  int get bandwidth => _bandwidth;

  int get channel => _channel;

  bool get isGuest => _isGuest;
}
