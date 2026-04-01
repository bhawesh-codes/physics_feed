// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) =>
    ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
  List<Result>? results;
  Pagination? pagination;

  ArticleModel({this.results, this.pagination});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    results: json["results"] == null
        ? []
        : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    pagination: json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results == null
        ? []
        : List<dynamic>.from(results!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class Pagination {
  int? page;
  int? size;
  int? count;
  int? pages;

  Pagination({this.page, this.size, this.count, this.pages});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    size: json["size"],
    count: json["count"],
    pages: json["pages"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "size": size,
    "count": count,
    "pages": pages,
  };
}

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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    title: json["title"],
    slug: json["slug"],
    excerpt: json["excerpt"],
    featureImage: json["featureImage"],
    publishedAt: json["publishedAt"] == null
        ? null
        : DateTime.parse(json["publishedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "slug": slug,
    "excerpt": excerpt,
    "featureImage": featureImage,
    "publishedAt": publishedAt?.toIso8601String(),
  };
}
