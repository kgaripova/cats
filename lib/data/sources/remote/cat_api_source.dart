import 'package:dio/dio.dart';

import 'package:cats/core/constants/api_endpoints.dart';
import 'package:cats/core/constants/app_constants.dart';
import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/models/favorite_breed_item.dart';
import 'package:cats/data/models/favorite_model.dart';
import 'package:cats/data/models/image_model.dart';

class CatApiSource {
  CatApiSource(this._dio);

  final Dio _dio;

  Future<List<BreedModel>> getBreeds({
    required int page,
    required int limit,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiEndpoints.breeds,
      queryParameters: {'limit': limit, 'page': page},
    );
    return (response.data ?? [])
        .cast<Map<String, dynamic>>()
        .map((json) {
          final imageUrl =
              (json['image'] as Map<String, dynamic>?)?['url'] as String?;
          return BreedModel.fromJson({...json, 'imageUrl': imageUrl});
        })
        .toList();
  }

  Future<BreedModel> getBreedById(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      ApiEndpoints.breedById(id),
    );
    return BreedModel.fromJson(response.data!);
  }

  Future<List<FavoriteBreedItem>> getFavorites() async {
    final response = await _dio.get<List<dynamic>>(ApiEndpoints.favorites);
    final items = response.data?.cast<Map<String, dynamic>>() ?? const [];
    final result = <FavoriteBreedItem>[];

    for (final json in items) {
      final favoriteId = (json['id'] as num).toInt();
      final imageId = json['image_id'] as String;
      final image = json['image'] as Map<String, dynamic>?;
      var imageUrl = image?['url'] as String?;
      var breeds = image?['breeds'] as List<dynamic>? ?? const [];

      if (breeds.isEmpty) {
        final imageDetails = await _fetchImageDetails(imageId);
        if (imageDetails != null) {
          imageUrl = imageDetails['url'] as String? ?? imageUrl;
          breeds = imageDetails['breeds'] as List<dynamic>? ?? const [];
        }
      }

      if (breeds.isEmpty) continue;
      final breedJson = breeds.first as Map<String, dynamic>;
      final breed = BreedModel.fromJson({
        ...breedJson,
        'reference_image_id': imageId,
        'imageUrl': imageUrl,
      });
      result.add(
        FavoriteBreedItem(
          favoriteId: favoriteId,
          imageId: imageId,
          breed: breed,
        ),
      );
    }

    return result;
  }

  Future<Map<String, dynamic>?> _fetchImageDetails(String imageId) async {
    try {
      final response = await _dio
          .get<Map<String, dynamic>>(ApiEndpoints.imageById(imageId))
          .timeout(const Duration(seconds: 10));
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<FavoriteModel> addFavorite(String imageId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiEndpoints.favorites,
      data: {'image_id': imageId},
    );
    // The POST response only returns {id, message}, so we construct it.
    return FavoriteModel(
      id: response.data!['id'] as int,
      imageId: imageId,
    );
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _dio.delete(ApiEndpoints.favoriteById(favoriteId.toString()));
  }
}
