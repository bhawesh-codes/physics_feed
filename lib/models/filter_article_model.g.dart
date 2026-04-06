// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterArticleModel _$FilterArticleModelFromJson(Map<String, dynamic> json) =>
    FilterArticleModel(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      articles: json['articles'] == null
          ? null
          : Articles.fromJson(json['articles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilterArticleModelToJson(FilterArticleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'image': instance.image,
      'articles': instance.articles,
    };

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
  'results': instance.results,
  'pagination': instance.pagination,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  page: (json['page'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  count: (json['count'] as num?)?.toInt(),
  pages: (json['pages'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'count': instance.count,
      'pages': instance.pages,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  excerpt: json['excerpt'] as String?,
  featureImage: json['featureImage'] as String?,
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'title': instance.title,
  'slug': instance.slug,
  'excerpt': instance.excerpt,
  'featureImage': instance.featureImage,
  'publishedAt': instance.publishedAt?.toIso8601String(),
};
