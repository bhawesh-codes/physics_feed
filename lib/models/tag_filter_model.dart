// To parse this JSON data, do
//
//     final tagFilterModel = tagFilterModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'tag_filter_model.g.dart';

TagFilterModel tagFilterModelFromJson(String str) =>
    TagFilterModel.fromJson(json.decode(str));

String tagFilterModelToJson(TagFilterModel data) => json.encode(data.toJson());

@JsonSerializable()
class TagFilterModel {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;
  Articles? articles;

  TagFilterModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
    this.articles,
  });

  factory TagFilterModel.fromJson(Map<String, dynamic> json) => _$TagFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagFilterModelToJson(this);
}
@JsonSerializable()
class Articles {
  List<Result>? results;
  Pagination? pagination;

  Articles({this.results, this.pagination});

  factory Articles.fromJson(Map<String, dynamic> json) => _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
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


