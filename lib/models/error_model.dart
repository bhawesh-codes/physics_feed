// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  bool? error;
  String? url;
  int? statusCode;
  String? statusMessage;
  String? message;

  ErrorModel({
    this.error,
    this.url,
    this.statusCode,
    this.statusMessage,
    this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    error: json["error"],
    url: json["url"],
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "url": url,
    "statusCode": statusCode,
    "statusMessage": statusMessage,
    "message": message,
  };
}
