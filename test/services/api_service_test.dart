// test/services/api_service_test.dart

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:physics_feed/core/error/app_exception.dart';
import 'package:physics_feed/models/article_detail_model.dart';
import 'package:physics_feed/models/article_model.dart';
import 'package:physics_feed/services/article_api_client.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ArticleApiClient apiService;

  setUp(() {
    mockDio = MockDio();
    apiService = ArticleApiClient(mockDio);
  });

  // ─── Helpers ────────────────────────────────────────────────────────────────

  /// Builds a fake Dio Response with your chosen data and status code.
  Response<dynamic> fakeResponse(
    Map<String, dynamic> data, {
    int statusCode = 200,
  }) {
    return Response(
      data: data,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: ''),
    );
  }

  /// Builds a DioException (network/server errors).
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

  // ─── getArticle ─────────────────────────────────────────────────────────────

  group('getArticle', () {
    // Sample JSON your ArticleModel.fromJson expects
    final articleJson = {
      'data': [
        {'id': 1, 'title': 'Physics Today', 'slug': 'physics-today'},
      ],
      'meta': {'total': 1},
    };

    test('returns ArticleModel on success', () async {
      // Arrange
      when(
        mockDio.get('article?page=1'),
      ).thenAnswer((_) async => fakeResponse(articleJson));

      // Act
      final result = await apiService.getArticles(1);

      // Assert
      expect(result, isA<ArticleModel>());
      verify(mockDio.get('article?page=1')).called(1);
    });

    test('calls the correct endpoint', () async {
      when(
        mockDio.get('article?page=1'),
      ).thenAnswer((_) async => fakeResponse(articleJson));

      await apiService.getArticles(1);

      // Ensure no other endpoint was accidentally called
      verifyNever(mockDio.get(argThat(isNot('article?page=1'))));
    });

    test('throws AppException on network timeout', () async {
      when(
        mockDio.get(any),
      ).thenThrow(fakeDioException(DioExceptionType.connectionTimeout));

      expect(() => apiService.getArticles(1), throwsA(isA<AppException>()));
    });

    test('throws AppException on 500 server error', () async {
      when(mockDio.get(any)).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 500),
      );

      expect(() => apiService.getArticles(1), throwsA(isA<AppException>()));
    });

    test('throws AppException on no internet (connection error)', () async {
      when(
        mockDio.get(any),
      ).thenThrow(fakeDioException(DioExceptionType.connectionError));

      expect(() => apiService.getArticles(1), throwsA(isA<AppException>()));
    });

    test('throws AppException on generic exception', () async {
      when(mockDio.get(any)).thenThrow(Exception('Unexpected error'));

      expect(() => apiService.getArticles(1), throwsA(isA<AppException>()));
    });
  });

  // ─── getArticleDetail ────────────────────────────────────────────────────────

  group('getArticleDetail', () {
    const slug = 'physics-today';

    final articleDetailJson = {
      'id': 1,
      'title': 'Physics Today',
      'slug': slug,
      'content': 'Some long content...',
    };

    test('returns ArticleDetailModel on success', () async {
      // Arrange
      when(
        mockDio.get('article/$slug'),
      ).thenAnswer((_) async => fakeResponse(articleDetailJson));

      // Act
      final result = await apiService.getArticleDetail(slug);

      // Assert
      expect(result, isA<ArticleDetailModel>());
      verify(mockDio.get('article/$slug')).called(1);
    });

    test('calls endpoint with correct slug', () async {
      when(
        mockDio.get('article/$slug'),
      ).thenAnswer((_) async => fakeResponse(articleDetailJson));

      await apiService.getArticleDetail(slug);

      verify(mockDio.get('article/$slug')).called(1);
      verifyNever(mockDio.get('article/wrong-slug'));
    });

    test('throws AppException on 404 not found', () async {
      when(mockDio.get('article/$slug')).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 404),
      );

      expect(
        () => apiService.getArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on 401 unauthorized', () async {
      when(mockDio.get('article/$slug')).thenThrow(
        fakeDioException(DioExceptionType.badResponse, statusCode: 401),
      );

      expect(
        () => apiService.getArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on timeout', () async {
      when(
        mockDio.get(any),
      ).thenThrow(fakeDioException(DioExceptionType.receiveTimeout));

      expect(
        () => apiService.getArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });

    test('throws AppException on generic exception', () async {
      when(mockDio.get(any)).thenThrow(Exception('Something went wrong'));

      expect(
        () => apiService.getArticleDetail(slug),
        throwsA(isA<AppException>()),
      );
    });
  });
}
