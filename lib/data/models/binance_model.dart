class BinanceModal {
  String? asset;
  String? free;
  String? locked;

  BinanceModal({this.asset, this.free, this.locked});

  BinanceModal.fromJson(Map<String, dynamic> json) {
    asset = json['asset'].toString();
    free = json['free'].toString();
    locked = json['locked'].toString();
  }
}
