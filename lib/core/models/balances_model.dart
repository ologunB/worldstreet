class BalanceModel {
  String? asset;
  String? free;
  String? locked;

  BalanceModel({
    this.asset,
    this.free,
    this.locked,
  });

  BalanceModel.fromJson(Map<String, dynamic> json) {
    asset = json['asset'];
    free = json['free'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset'] = this.asset;
    data['free'] = this.free;
    data['locked'] = this.locked;

    return data;
  }
}
