import 'package:freezed_annotation/freezed_annotation.dart';

import 'breed_weight_model.dart';

part 'breed_model.freezed.dart';
part 'breed_model.g.dart';

@freezed
class BreedModel with _$BreedModel {
  const factory BreedModel({
    required String id,
    required String name,
    @Default('') String description,
    @Default('') String origin,
    @Default('') String temperament,
    @Default('') @JsonKey(name: 'life_span') String lifeSpan,
    @Default('') @JsonKey(name: 'alt_names') String altNames,
    @Default('') @JsonKey(name: 'wikipedia_url') String wikipediaUrl,
    BreedWeightModel? weight,
    @Default(0) int adaptability,
    @Default(0) @JsonKey(name: 'affection_level') int affectionLevel,
    @Default(0) @JsonKey(name: 'child_friendly') int childFriendly,
    @Default(0) @JsonKey(name: 'dog_friendly') int dogFriendly,
    @Default(0) @JsonKey(name: 'energy_level') int energyLevel,
    @Default(0) int intelligence,
    @Default(0) @JsonKey(name: 'social_needs') int socialNeeds,
    @Default(0) @JsonKey(name: 'stranger_friendly') int strangerFriendly,
    @Default(0) int grooming,
    @Default(0) @JsonKey(name: 'health_issues') int healthIssues,
    @Default(0) int vocalisation,
    @Default(0) int hypoallergenic,
    @Default(0) int rare,
    @JsonKey(name: 'reference_image_id') String? referenceImageId,
    String? imageUrl,
  }) = _BreedModel;

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
}
