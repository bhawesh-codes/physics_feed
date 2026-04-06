// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

@JsonSerializable()
class ArticleModel {
  List<Result>? results;
  Pagination? pagination;

  ArticleModel({this.results, this.pagination});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable()
class Pagination {
  int? page;
  int? size;
  int? count;
  int? pages;

  Pagination({this.page, this.size, this.count, this.pages});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Result {
  String? title;
  String? slug;
  String? excerpt;
  String? featureImage;
  DateTime? publishedAt;

  Result({
    this.title,
    this.slug,
    this.excerpt,
    this.featureImage,
    this.publishedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
