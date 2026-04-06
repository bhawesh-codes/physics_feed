// To parse this JSON data, do
//
//     final articleDetailModel = articleDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'article_detail_model.g.dart';

ArticleDetailModel articleDetailModelFromJson(String str) =>
    ArticleDetailModel.fromJson(json.decode(str));

String articleDetailModelToJson(ArticleDetailModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ArticleDetailModel {
  int? id;
  String? title;
  String? content;
  String? excerpt;
  String? headerImage;
  String? featureImage;
  DateTime? publishedAt;
  DateTime? updatedAt;
  List<dynamic>? tags;
  List<Category>? categories;
  List<Author>? authors;

  ArticleDetailModel({
    this.id,
    this.title,
    this.content,
    this.excerpt,
    this.headerImage,
    this.featureImage,
    this.publishedAt,
    this.updatedAt,
    this.tags,
    this.categories,
    this.authors,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) => _$ArticleDetailModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$ArticleDetailModelToJson(this);
}

@JsonSerializable()
class Author {
  String? name;
  String? slug;
  String? description;
  String? image;

  Author({this.name, this.slug, this.description, this.image});

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Category {
  String? name;
  String? slug;

  Category({this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
