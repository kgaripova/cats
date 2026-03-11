import 'package:cats/data/models/favorite_breed_item.dart';
import 'package:cats/data/models/favorite_model.dart';
import 'package:cats/data/sources/local/local_cache.dart';
import 'package:cats/data/sources/remote/cat_api_source.dart';
import 'package:dio/dio.dart';

class FavoriteRepository {
  FavoriteRepository({
    required CatApiSource remoteSource,
    required LocalCache localCache,
  })  : _remote = remoteSource,
        _cache = localCache;

  final CatApiSource _remote;
  final LocalCache _cache;
  bool _lastLoadFromCache = false;

  bool get lastLoadFromCache => _lastLoadFromCache;

  Future<List<FavoriteBreedItem>> getFavorites() async {
    try {
      final favorites = await _remote.getFavorites();
      await _cache.saveFavorites(favorites);
      _lastLoadFromCache = false;
      return favorites;
    } on DioException catch (e) {
      if (_isOfflineLikeError(e)) {
        _lastLoadFromCache = true;
        return _cache.getCachedFavorites();
      }
      rethrow;
    }
  }

  Future<FavoriteModel> addFavorite(String imageId) async {
    return _remote.addFavorite(imageId);
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _remote.removeFavorite(favoriteId);
    await _cache.removeFavorite(favoriteId);
  }

  bool _isOfflineLikeError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout;
  }
}
