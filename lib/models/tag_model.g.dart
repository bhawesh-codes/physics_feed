// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagModel _$TagModelFromJson(Map<String, dynamic> json) => TagModel(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  articleCount: (json['articleCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$TagModelToJson(TagModel instance) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'image': instance.image,
  'articleCount': instance.articleCount,
};
