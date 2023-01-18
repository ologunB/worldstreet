class User {
  int? id;
  String? userType;
  String? firstName;
  String? lastName;
  String? email;
  User? watched;
  User? watcher;
  String? status;
  String? binanceKey;
  String? binanceSecret;

  User({
    this.id,
    this.userType,
    this.firstName,
    this.lastName,
    this.email,
    this.binanceKey,
    this.binanceSecret,
    this.status,
    this.watched,
    this.watcher,
  });

  User.fromJson(dynamic json) {
    id = json['pk'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    if (json['watched'] != null) {
      watched = User.fromJson(json['watched']);
    }
    if (json['watcher'] != null) {
      watched = User.fromJson(json['watcher']);
    }
    status = json['status'];
    binanceKey = json['binance_key'];
    binanceSecret = json['binance_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pk'] = this.id;
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['watched'] = watched?.toJson();
    data['watcher'] = watcher?.toJson();
    data['status'] = this.status;
    data['binance_key'] = this.binanceKey;
    data['binance_secret'] = this.binanceSecret;
    return data;
  }
}
