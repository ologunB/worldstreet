class CryptoModal {
  String? name;
  String? image;
  String? short;
  String? percentage;
  String? price;

  CryptoModal({this.name, this.image, this.short, this.price});

  CryptoModal.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    image = json['image'].toString();
    short = json['symbol'].toString();
    percentage = json['price_change_percentage_24h'].toString();
    price = json['current_price'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['symbol'] = short;
    data['price_change_percentage_24h'] = percentage;
    data['current_price'] = price;
    return data;
  }
}
