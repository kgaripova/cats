import 'package:equatable/equatable.dart';

import 'package:cats/data/models/breed_model.dart';

class BreedListState extends Equatable {
  const BreedListState({
    this.breeds = const [],
    this.isLoading = false,
    this.hasReachedEnd = false,
    this.error,
    this.isOffline = false,
  });

  final List<BreedModel> breeds;
  final bool isLoading;
  final bool hasReachedEnd;
  final String? error;
  final bool isOffline;

  BreedListState copyWith({
    List<BreedModel>? breeds,
    bool? isLoading,
    bool? hasReachedEnd,
    String? error,
    bool clearError = false,
    bool? isOffline,
  }) {
    return BreedListState(
      breeds: breeds ?? this.breeds,
      isLoading: isLoading ?? this.isLoading,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      error: clearError ? null : (error ?? this.error),
      isOffline: isOffline ?? this.isOffline,
    );
  }

  @override
  List<Object?> get props => [breeds, isLoading, hasReachedEnd, error, isOffline];
}
