import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_weight_model.freezed.dart';
part 'breed_weight_model.g.dart';

@freezed
class BreedWeightModel with _$BreedWeightModel {
  const factory BreedWeightModel({
    required String imperial,
    required String metric,
  }) = _BreedWeightModel;

  factory BreedWeightModel.fromJson(Map<String, dynamic> json) =>
      _$BreedWeightModelFromJson(json);
}
