// test/services/api_service_test.dart

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/services/article_api_client.dart';

import '../repository/article_repository_test.mocks.dart';

@GenerateMocks([ArticleApiClient])
void main() {
  late MockArticleApiClient mockClient;
  late ArticleRepository repository;

  setUp(() {
    mockClient = MockArticleApiClient();
    repository = ArticleRepository(mockClient);
  });

  DioException fakeDioException(DioExceptionType type, {int? statusCode}) {
    return DioException(
      type: type,
      requestOptions: RequestOptions(path: ''),
      response: statusCode != null
          ? Response(
              statusCode: statusCode,
              requestOptions: RequestOptions(path: ''),
            )
          : null,
    );
  }

  group('fetchArticles', () {
    final articleModel = ArticleModel(/* your required fields */);

    test('returns ArticleModel on success', () async {
      when(mockClient.getArticles(1)).thenAnswer((_) async => articleModel);

      final result = await repository.fetchArticles();

      expect(result, isA<ArticleModel>());
      verify(mockClient.getArticles(1)).called(1);
    });

    test('throws AppException on network timeout', () async {
      when(
        mockClient.getArticles(1),
      ).thenThrow(fakeDioException(DioExceptionType.connectionTimeout));

      expect(() => repository.fetchArticles(), throwsA(isA<AppException>()));
    });

    test('throws AppException on 500 server error', () async {
      when(mockClient.getArticles(1)).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 500),
      );

      expect(() => repository.fetchArticles(), throwsA(isA<AppException>()));
    });

    test('throws AppException on no internet', () async {
      when(
        mockClient.getArticles(1),
      ).thenThrow(fakeDioException(DioExceptionType.connectionError));

      expect(() => repository.fetchArticles(), throwsA(isA<AppException>()));
    });

    test('throws AppException on generic exception', () async {
      when(mockClient.getArticles(1)).thenThrow(Exception('Unexpected error'));

      expect(() => repository.fetchArticles(), throwsA(isA<AppException>()));
    });
  });

  group('fetchArticleDetail', () {
    const slug = 'physics-today';
    final detailModel = ArticleDetailModel(/* your required fields */);

    test('returns ArticleDetailModel on success', () async {
      when(
        mockClient.getArticleDetail(slug),
      ).thenAnswer((_) async => detailModel);

      final result = await repository.fetchArticleDetail(slug);

      expect(result, isA<ArticleDetailModel>());
      verify(mockClient.getArticleDetail(slug)).called(1);
    });

    test('calls endpoint with correct slug', () async {
      when(
        mockClient.getArticleDetail(slug),
      ).thenAnswer((_) async => detailModel);

      await repository.fetchArticleDetail(slug);

      verify(mockClient.getArticleDetail(slug)).called(1);
      verifyNever(mockClient.getArticleDetail('wrong-slug'));
    });

    test('throws AppException on 404', () async {
      when(mockClient.getArticleDetail(slug)).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 404),
      );

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on 401', () async {
      when(mockClient.getArticleDetail(slug)).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 401),
      );

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on timeout', () async {
      when(
        mockClient.getArticleDetail(slug),
      ).thenThrow(fakeDioException(DioExceptionType.receiveTimeout));

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on generic exception', () async {
      when(
        mockClient.getArticleDetail(slug),
      ).thenThrow(Exception('Something went wrong'));

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });
  });
}
