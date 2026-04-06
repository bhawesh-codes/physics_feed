// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  articleCount: (json['articleCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': instance.image,
      'articleCount': instance.articleCount,
    };
