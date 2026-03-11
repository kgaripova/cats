import 'package:dio/dio.dart';

import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/sources/local/local_cache.dart';
import 'package:cats/data/sources/remote/cat_api_source.dart';

class BreedRepository {
  BreedRepository({
    required CatApiSource remoteSource,
    required LocalCache localCache,
  })  : _remote = remoteSource,
        _cache = localCache;

  final CatApiSource _remote;
  final LocalCache _cache;
  bool _lastLoadFromCache = false;

  bool get lastLoadFromCache => _lastLoadFromCache;

  Future<List<BreedModel>> getBreeds({
    required int page,
    required int pageSize,
  }) async {
    try {
      final breeds = await _remote.getBreeds(page: page, limit: pageSize);
      await _cache.saveBreeds(breeds);
      _lastLoadFromCache = false;
      return breeds;
    } on DioException catch (e) {
      if (page == 0 && _isOfflineLikeError(e)) {
        final cached = _cache.getCachedBreeds();
        if (cached.isNotEmpty) {
          _lastLoadFromCache = true;
          return cached;
        }
      }
      rethrow;
    }
  }

  Future<BreedModel> getBreedById(String id) async {
    try {
      final breed = await _remote.getBreedById(id);
      if (breed.imageUrl != null && breed.imageUrl!.isNotEmpty) {
        return breed;
      }

      final cached = _cache.getCachedBreedById(id);
      final cachedImageUrl = cached?.imageUrl;
      if (cachedImageUrl != null && cachedImageUrl.isNotEmpty) {
        return breed.copyWith(imageUrl: cachedImageUrl);
      }

      return breed;
    } on DioException catch (e) {
      if (_isOfflineLikeError(e)) {
        final cached = _cache.getCachedBreedById(id);
        if (cached != null) return cached;
      }
      rethrow;
    }
  }

  bool _isOfflineLikeError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }
}
