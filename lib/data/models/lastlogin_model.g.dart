// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lastlogin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastLoginModel _$LastLoginModelFromJson(Map<String, dynamic> json) =>
    LastLoginModel(
      passcode: json['passcode'] as String?,
      country: json['country'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      verifyStatus: json['verify_status'] as String?,
      verifyMthod: json['verify_method'] as String?,
      email: json['email'] as String?,
      verifyCountry: json['verify_country'] as String?,
      verifyDocument: json['verify_document'] as String?,
      status: json['status'] as String?,
      id: json['id'] as int?,
      crypto: json['crypto'] as String?,
      cryptoKey: json['crypto_key'] as String?,
      cryptoSecret: json['crypto_secret'] as String?,
      deviceModel: json['device_model'] as String?,
      deviceOs: json['device_os'] as String?,
      deviceOsVersion: json['device_os_version'] as String?,
      deviceToken: json['device_token'] as String?,
      facebookId: json['facebook_id'] as String?,
      forex: json['forex'] as String?,
      forexKey: json['forex_key'] as String?,
      forexSecret: json['forex_secret'] as String?,
      googleId: json['google_id'] as String?,
      ipAddress: json['ip_address'] as String?,
      otp: json['otp'] as String?,
      userSessionToken: json['user_session_token'] as String?,
      userType: json['user_type'] as String?,
    );

Map<String, dynamic> _$LastLoginModelToJson(LastLoginModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_type': instance.userType,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'otp': instance.otp,
      'country': instance.country,
      'device_token': instance.deviceToken,
      'device_os': instance.deviceOs,
      'device_os_version': instance.deviceOsVersion,
      'device_model': instance.deviceModel,
      'user_session_token': instance.userSessionToken,
      'ip_address': instance.ipAddress,
      'facebook_id': instance.facebookId,
      'google_id': instance.googleId,
      'passcode': instance.passcode,
      'forex': instance.forex,
      'forex_key': instance.forexKey,
      'forex_secret': instance.forexSecret,
      'crypto': instance.crypto,
      'crypto_key': instance.cryptoKey,
      'crypto_secret': instance.cryptoSecret,
      'verify_country': instance.verifyCountry,
      'verify_method': instance.verifyMthod,
      'verify_document': instance.verifyDocument,
      'verify_status': instance.verifyStatus,
      'status': instance.status,
    };
