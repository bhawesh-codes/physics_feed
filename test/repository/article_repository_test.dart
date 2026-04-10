// test/repositories/article_repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/models/error_model.dart';
import 'package:physics_feed/repository/article_repository.dart';
import 'package:physics_feed/services/article_api_client.dart';

import 'article_repository_test.mocks.dart';

@GenerateMocks([ArticleApiClient])
void main() {
  late MockArticleApiClient mockApiService;
  late ArticleRepository repository;

  // Fake model instances — adjust constructors to match your actual models
  final fakeArticleModel = ArticleModel(/* your fields */);
  final fakeArticleDetailModel = ArticleDetailModel(/* your fields */);
  const slug = 'physics-today';

  setUp(() {
    mockApiService = MockArticleApiClient();
    repository = ArticleRepository(mockApiService);
  });

  // ─── fetchArticles ───────────────────────────────────────────────────────────

  group('fetchArticles', () {
    test('returns ArticleModel when ApiService succeeds', () async {
      // Arrange
      when(
        mockApiService.getArticles(1),
      ).thenAnswer((_) async => fakeArticleModel);

      // Act
      final result = await repository.fetchArticles();

      // Assert
      expect(result, equals(fakeArticleModel));
      verify(mockApiService.getArticles(1)).called(1);
    });
    test('calls getArticle exactly once', () async {
      when(
        mockApiService.getArticles(1),
      ).thenAnswer((_) async => fakeArticleModel);

      await repository.fetchArticles();

      verify(mockApiService.getArticles(1)).called(1);
      verifyNoMoreInteractions(mockApiService);
    });

    test('throws AppException when ApiService throws AppException', () async {
      // ApiService already throws AppException — repository re-wraps it
      when(mockApiService.getArticles(1)).thenThrow(ErrorModel(message: 'Server error'));

      expect(() => repository.fetchArticles(), throwsA(isA<ErrorModel>()));
    });

    test('throws AppException when an unexpected error occurs', () async {
      // Simulates something slipping through (plain Exception)
      when(mockApiService.getArticles(1)).thenThrow(Exception('Unexpected'));

      expect(() => repository.fetchArticles(), throwsA(isA<ErrorModel>()));
    });

    test('does not call fetchArticleDetail', () async {
      when(
        mockApiService.getArticles(1),
      ).thenAnswer((_) async => fakeArticleModel);

      await repository.fetchArticles();

      verifyNever(mockApiService.getArticleDetail(any));
    });
  });

  // ─── fetchArticleDetail ──────────────────────────────────────────────────────

  group('fetchArticleDetail', () {
    test('returns ArticleDetailModel when ApiService succeeds', () async {
      // Arrange
      when(
        mockApiService.getArticleDetail(slug),
      ).thenAnswer((_) async => fakeArticleDetailModel);

      // Act
      final result = await repository.fetchArticleDetail(slug);

      // Assert
      expect(result, equals(fakeArticleDetailModel));
      verify(mockApiService.getArticleDetail(slug)).called(1);
    });

    test('passes slug to ApiService correctly', () async {
      when(
        mockApiService.getArticleDetail(slug),
      ).thenAnswer((_) async => fakeArticleDetailModel);

      await repository.fetchArticleDetail(slug);

      // Correct slug was used
      verify(mockApiService.getArticleDetail(slug)).called(1);
      // Wrong slug was never called
      verifyNever(mockApiService.getArticleDetail('wrong-slug'));
    });

    test('throws AppException when ApiService throws AppException', () async {
      when(
        mockApiService.getArticleDetail(slug),
      ).thenThrow(ErrorModel(message: 'Not found'));

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<ErrorModel>()),
      );
    });

    test('throws AppException when an unexpected error occurs', () async {
      when(
        mockApiService.getArticleDetail(slug),
      ).thenThrow(Exception('Unexpected'));

      expect(
        () => repository.fetchArticleDetail(slug),
        throwsA(isA<ErrorModel>()),
      );
    });

    test('does not call getArticle', () async {
      when(
        mockApiService.getArticleDetail(slug),
      ).thenAnswer((_) async => fakeArticleDetailModel);

      await repository.fetchArticleDetail(slug);

      verifyNever(mockApiService.getArticles(1));
    });
  });
}
