// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectCityModel _$SelectCityModelFromJson(Map<String, dynamic> json) =>
    SelectCityModel(
      id: json['id'] as int?,
      status: json['status'] as int?,
      flagImage: json['flag_image'] as String?,
      countryName: json['country_name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$SelectCityModelToJson(SelectCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'flag_image': instance.flagImage,
      'country_name': instance.countryName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
