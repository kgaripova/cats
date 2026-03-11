import 'package:cats/data/models/breed_model.dart';
import 'package:cats/data/models/favorite_breed_item.dart';
import 'package:cats/data/repositories/favorite_repository.dart';
import 'package:cats/presentation/blocs/favorites/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this._repository) : super(const FavoritesState());

  final FavoriteRepository _repository;

  Future<void> load() async {
    emit(state.copyWith(status: FavoritesStatus.loading));
    try {
      final favorites = await _repository.getFavorites();
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          favorites: favorites,
          isOffline: _repository.lastLoadFromCache,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FavoritesStatus.failure));
    }
  }

  Future<void> add(String imageId, {required BreedModel breed}) async {
    if (state.isOffline) return;
    try {
      final favorite = await _repository.addFavorite(imageId);
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          isOffline: false,
          favorites: [
            ...state.favorites,
            FavoriteBreedItem(
              favoriteId: favorite.id,
              imageId: imageId,
              breed: breed.copyWith(
                referenceImageId: imageId,
                imageUrl: breed.imageUrl,
              ),
            ),
          ],
        ),
      );
    } catch (_) {
      emit(state.copyWith(isOffline: true));
    }
  }

  Future<void> remove(int favoriteId) async {
    if (state.isOffline) return;
    final prev = state.favorites;
    emit(
      state.copyWith(
        status: FavoritesStatus.success,
        favorites: prev.where((f) => f.favoriteId != favoriteId).toList(),
      ),
    );
    try {
      await _repository.removeFavorite(favoriteId);
    } catch (_) {
      emit(
        state.copyWith(
          status: FavoritesStatus.success,
          favorites: prev,
          isOffline: true,
        ),
      );
    }
  }
}
