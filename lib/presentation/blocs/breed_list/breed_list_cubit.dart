import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats/core/constants/app_constants.dart';
import 'package:cats/data/repositories/breed_repository.dart';
import 'package:cats/presentation/blocs/breed_list/breed_list_state.dart';

class BreedListCubit extends Cubit<BreedListState> {
  BreedListCubit(this._repository) : super(const BreedListState());

  final BreedRepository _repository;
  int _currentPage = 0;

  static const Duration _requestTimeout = Duration(seconds: 15);

  Future<void> loadInitial() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    _currentPage = 0;
    try {
      final breeds = await _repository
          .getBreeds(
            page: _currentPage,
            pageSize: AppConstants.breedsPageSize,
          )
          .timeout(_requestTimeout);
      emit(state.copyWith(
        breeds: breeds,
        isLoading: false,
        hasReachedEnd: breeds.length < AppConstants.breedsPageSize,
        isOffline: _repository.lastLoadFromCache,
      ));
    } catch (_) {
      emit(state.copyWith(
        isLoading: false,
        error: 'errorLoadingBreeds',
        isOffline: true,
      ));
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.hasReachedEnd) return;

    emit(state.copyWith(isLoading: true));
    _currentPage++;
    try {
      final newBreeds = await _repository
          .getBreeds(
            page: _currentPage,
            pageSize: AppConstants.breedsPageSize,
          )
          .timeout(_requestTimeout);
      final all = [...state.breeds, ...newBreeds];
      emit(state.copyWith(
        breeds: all,
        isLoading: false,
        hasReachedEnd: newBreeds.length < AppConstants.breedsPageSize,
        isOffline: false,
      ));
    } catch (_) {
      _currentPage--;
      emit(state.copyWith(isLoading: false, isOffline: true));
    }
  }

  void setOfflineMode(bool isOffline) {
    if (state.isOffline == isOffline) return;
    emit(state.copyWith(isOffline: isOffline));
  }

}
