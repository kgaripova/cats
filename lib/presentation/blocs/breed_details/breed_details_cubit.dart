import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats/data/repositories/breed_repository.dart';
import 'package:cats/presentation/blocs/breed_details/breed_details_state.dart';

class BreedDetailsCubit extends Cubit<BreedDetailsState> {
  BreedDetailsCubit(this._repository) : super(const BreedDetailsState());

  final BreedRepository _repository;

  Future<void> load(String id) async {
    emit(const BreedDetailsState(status: BreedDetailStatus.loading));
    try {
      final breed = await _repository.getBreedById(id);
      emit(BreedDetailsState(status: BreedDetailStatus.success, breed: breed));
    } catch (_) {
      emit(const BreedDetailsState(status: BreedDetailStatus.failure));
    }
  }
}
