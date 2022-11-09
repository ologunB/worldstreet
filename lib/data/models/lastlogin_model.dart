import 'package:json_annotation/json_annotation.dart';

part 'lastlogin_model.g.dart';

@JsonSerializable()
class LastLoginModel {
  int? id;
  @JsonKey(name: "user_type")
  String? userType;
  String? email;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  String? otp;
  String? country;
  @JsonKey(name: "device_token")
  String? deviceToken;
  @JsonKey(name: "device_os")
  String? deviceOs;
  @JsonKey(name: "device_os_version")
  String? deviceOsVersion;
  @JsonKey(name: "device_model")
  String? deviceModel;
  @JsonKey(name: "user_session_token")
  String? userSessionToken;
  @JsonKey(name: "ip_address")
  String? ipAddress;
  @JsonKey(name: "facebook_id")
  String? facebookId;
  @JsonKey(name: "google_id")
  String? googleId;
  String? passcode;
  String? forex;
  @JsonKey(name: "forex_key")
  String? forexKey;
  @JsonKey(name: "forex_secret")
  String? forexSecret;
  String? crypto;
  @JsonKey(name: "crypto_key")
  String? cryptoKey;
  @JsonKey(name: "crypto_secret")
  String? cryptoSecret;
  @JsonKey(name: "verify_country")
  String? verifyCountry;
  @JsonKey(name: "verify_method")
  String? verifyMthod;
  @JsonKey(name: "verify_document")
  String? verifyDocument;
  @JsonKey(name: "verify_status")
  String? verifyStatus;
  String? status;

  LastLoginModel(
      {this.passcode,
      this.country,
      this.emailVerifiedAt,
      this.verifyStatus,
      this.verifyMthod,
      this.email,
      this.verifyCountry,
      this.verifyDocument,
      this.status,
      this.id,
      this.crypto,
      this.cryptoKey,
      this.cryptoSecret,
      this.deviceModel,
      this.deviceOs,
      this.deviceOsVersion,
      this.deviceToken,
      this.facebookId,
      this.forex,
      this.forexKey,
      this.forexSecret,
      this.googleId,
      this.ipAddress,
      this.otp,
      this.userSessionToken,
      this.userType});

  factory LastLoginModel.fromJson(Map<String, dynamic> json) =>
      _$LastLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LastLoginModelToJson(this);
}
