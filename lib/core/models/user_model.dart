class User {
  int? id;
  String? userType;
  String? firstName;
  String? lastName;
  String? email;
  String? binanceKey;

  User(
      {this.id,
      this.userType,
      this.firstName,
      this.lastName,
      this.email,
      this.binanceKey});

  User.fromJson(dynamic json) {
    id = json['pk'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    binanceKey = json['binance_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['pk'] = this.id;
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['binance_key'] = this.binanceKey;
    return data;
  }
}
