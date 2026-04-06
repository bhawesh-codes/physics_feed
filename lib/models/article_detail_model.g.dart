// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailModel _$ArticleDetailModelFromJson(Map<String, dynamic> json) =>
    ArticleDetailModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      excerpt: json['excerpt'] as String?,
      headerImage: json['headerImage'] as String?,
      featureImage: json['featureImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      tags: json['tags'] as List<dynamic>?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleDetailModelToJson(ArticleDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'excerpt': instance.excerpt,
      'headerImage': instance.headerImage,
      'featureImage': instance.featureImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'tags': instance.tags,
      'categories': instance.categories,
      'authors': instance.authors,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'image': instance.image,
};

Category _$CategoryFromJson(Map<String, dynamic> json) =>
    Category(name: json['name'] as String?, slug: json['slug'] as String?);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
};
