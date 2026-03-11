import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/models/breed_weight_model.dart';
import 'package:cats/data/repositories/breed_repository.dart';
import 'package:cats/data/sources/local/local_cache.dart';
import 'package:cats/data/sources/remote/cat_api_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCatApiSource extends Mock implements CatApiSource {}

class MockLocalCache extends Mock implements LocalCache {}

void main() {
  late MockCatApiSource mockRemote;
  late MockLocalCache mockCache;
  late BreedRepository repository;

  final testBreed = BreedModel(
    id: 'abys',
    name: 'Abyssinian',
    weight: const BreedWeightModel(imperial: '7 - 10', metric: '3 - 5'),
    referenceImageId: 'img1',
  );

  setUp(() {
    mockRemote = MockCatApiSource();
    mockCache = MockLocalCache();
    repository = BreedRepository(remoteSource: mockRemote, localCache: mockCache);
  });

  group('BreedRepository.getBreeds', () {
    test('returns remote breeds and caches them on success', () async {
      when(() => mockRemote.getBreeds(page: 0, limit: 20)).thenAnswer((_) async => [testBreed]);
      when(() => mockCache.saveBreeds(any())).thenAnswer((_) async {});

      final result = await repository.getBreeds(page: 0, pageSize: 20);

      verify(() => mockRemote.getBreeds(page: 0, limit: 20)).called(1);
      expect(result, [testBreed]);
      verify(() => mockCache.saveBreeds([testBreed])).called(1);
      verifyNever(() => mockCache.getCachedBreeds());
    });

    test('falls back to cache when remote throws on page 0', () async {
      when(() => mockRemote.getBreeds(page: 0, limit: 20)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/breeds'),
          type: DioExceptionType.connectionError,
        ),
      );
      when(() => mockCache.getCachedBreeds()).thenReturn([testBreed]);

      final result = await repository.getBreeds(page: 0, pageSize: 20);

      expect(result, [testBreed]);
      verify(() => mockRemote.getBreeds(page: 0, limit: 20)).called(1);
      verify(() => mockCache.getCachedBreeds()).called(1);
      verifyNever(() => mockCache.saveBreeds(any()));
    });
  });

  group('BreedRepository.getBreedById', () {
    test('falls back to cached breed when remote throws offline-like error', () async {
      when(() => mockRemote.getBreedById('abys')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/breeds/abys'),
          type: DioExceptionType.connectionError,
        ),
      );
      when(() => mockCache.getCachedBreedById('abys')).thenReturn(testBreed);

      final result = await repository.getBreedById('abys');

      expect(result, testBreed);
      verify(() => mockRemote.getBreedById('abys')).called(1);
      verify(() => mockCache.getCachedBreedById('abys')).called(1);
    });
  });
}
