// To parse this JSON data, do
//
//     final articleDetailModel = articleDetailModelFromJson(jsonString);

import 'dart:convert';

ArticleDetailModel articleDetailModelFromJson(String str) =>
    ArticleDetailModel.fromJson(json.decode(str));

String articleDetailModelToJson(ArticleDetailModel data) =>
    json.encode(data.toJson());

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

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) =>
      ArticleDetailModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        excerpt: json["excerpt"],
        headerImage: json["headerImage"],
        featureImage: json["featureImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x)),
              ),
        authors: json["authors"] == null
            ? []
            : List<Author>.from(
                json["authors"]!.map((x) => Author.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "excerpt": excerpt,
    "headerImage": headerImage,
    "featureImage": featureImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "authors": authors == null
        ? []
        : List<dynamic>.from(authors!.map((x) => x.toJson())),
  };
}

class Author {
  String? name;
  String? slug;
  String? description;
  String? image;

  Author({this.name, this.slug, this.description, this.image});

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "description": description,
    "image": image,
  };
}

class Category {
  String? name;
  String? slug;

  Category({this.name, this.slug});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json["name"], slug: json["slug"]);

  Map<String, dynamic> toJson() => {"name": name, "slug": slug};
}
