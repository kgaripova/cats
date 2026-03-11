import 'package:equatable/equatable.dart';

import 'package:cats/data/models/breed_model.dart';

enum BreedDetailStatus { initial, loading, success, failure }

class BreedDetailsState extends Equatable {
  const BreedDetailsState({
    this.status = BreedDetailStatus.initial,
    this.breed,
    this.error,
  });

  final BreedDetailStatus status;
  final BreedModel? breed;
  final String? error;

  @override
  List<Object?> get props => [status, breed, error];
}
