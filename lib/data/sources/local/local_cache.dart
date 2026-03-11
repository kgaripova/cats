import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:cats/core/constants/app_constants.dart';
import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/models/favorite_breed_item.dart';

class LocalCache {
  Box<String> get _breedBox => Hive.box<String>(AppConstants.hiveBreedBox);
  Box<String> get _favoriteBox =>
      Hive.box<String>(AppConstants.hiveFavoriteBox);

  Future<void> saveBreeds(List<BreedModel> breeds) async {
    final encoded = {for (final b in breeds) b.id: jsonEncode(b.toJson())};
    await _breedBox.putAll(encoded);
  }

  List<BreedModel> getCachedBreeds() {
    return _breedBox.values
        .map((s) => BreedModel.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  BreedModel? getCachedBreedById(String id) {
    final raw = _breedBox.get(id);
    if (raw == null) return null;
    return BreedModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveFavorites(List<FavoriteBreedItem> favorites) async {
    await _favoriteBox.clear();
    final encoded = {
      for (final f in favorites) f.favoriteId.toString(): jsonEncode(f.toJson()),
    };
    await _favoriteBox.putAll(encoded);
  }

  List<FavoriteBreedItem> getCachedFavorites() {
    return _favoriteBox.values
        .map((s) =>
            FavoriteBreedItem.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  Future<void> removeFavorite(int favoriteId) async {
    await _favoriteBox.delete(favoriteId.toString());
  }
}
