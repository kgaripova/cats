import 'package:cats/data/models/favorite_breed_item.dart';
import 'package:equatable/equatable.dart';

enum FavoritesStatus { initial, loading, success, failure }

class FavoritesState extends Equatable {
  const FavoritesState({
    this.status = FavoritesStatus.initial,
    this.favorites = const [],
    this.isOffline = false,
    this.error,
  });

  final FavoritesStatus status;
  final List<FavoriteBreedItem> favorites;
  final bool isOffline;
  final String? error;

  bool isFavorite(String imageId) => favorites.any((f) => f.imageId == imageId);

  int? favoriteId(String imageId) {
    try {
      return favorites.firstWhere((f) => f.imageId == imageId).favoriteId;
    } catch (_) {
      return null;
    }
  }

  FavoritesState copyWith({
    FavoritesStatus? status,
    List<FavoriteBreedItem>? favorites,
    bool? isOffline,
    String? error,
  }) {
    return FavoritesState(
      status: status ?? this.status,
      favorites: favorites ?? this.favorites,
      isOffline: isOffline ?? this.isOffline,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, favorites, isOffline, error];
}
