// To parse this JSON data, do
//
//     final authorModel = authorModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'author_model.g.dart';

List<AuthorModel> authorModelFromJson(String str) => List<AuthorModel>.from(
  json.decode(str).map((x) => AuthorModel.fromJson(x)),
);

String authorModelToJson(List<AuthorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class AuthorModel {
  String? name;
  String? slug;
  String? description;
  String? image;
  int? articleCount;

  AuthorModel({
    this.name,
    this.slug,
    this.description,
    this.image,
    this.articleCount,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorModelToJson(this);
}
