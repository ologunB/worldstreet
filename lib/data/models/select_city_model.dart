import 'package:json_annotation/json_annotation.dart';
part 'select_city_model.g.dart';

@JsonSerializable()
class SelectCityModel {
  int? id;
  int? status;

  @JsonKey(name: "flag_image")
  String? flagImage;
  @JsonKey(name: "country_name")
  String? countryName;

  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  SelectCityModel(
      {this.id,
      this.status,
      this.flagImage,
      this.countryName,
      this.createdAt,
      this.updatedAt});

  factory SelectCityModel.fromJson(Map<String, dynamic> json) =>
      _$SelectCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectCityModelToJson(this);
}
