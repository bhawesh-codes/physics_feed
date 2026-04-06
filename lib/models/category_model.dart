// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
      json.decode(str).map((x) => CategoryModel.fromJson(x)),
    );

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CategoryModel {
  String? name;
  String? slug;
  String? description;
  String? image;
  int? articleCount;

  CategoryModel({
    this.name,
    this.slug,
    this.description,
    this.image,
    this.articleCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
