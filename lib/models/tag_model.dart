// To parse this JSON data, do
//
//     final tagModel = tagModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'tag_model.g.dart';

List<TagModel> tagModelFromJson(String str) =>
    List<TagModel>.from(json.decode(str).map((x) => TagModel.fromJson(x)));

String tagModelToJson(List<TagModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class TagModel {
  String? name;
  String? slug;
  String? description;
  String? image;
  int? articleCount;

  TagModel({
    this.name,
    this.slug,
    this.description,
    this.image,
    this.articleCount,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}
