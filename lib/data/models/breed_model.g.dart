// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedModelImpl _$$BreedModelImplFromJson(Map<String, dynamic> json) =>
    _$BreedModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      origin: json['origin'] as String? ?? '',
      temperament: json['temperament'] as String? ?? '',
      lifeSpan: json['life_span'] as String? ?? '',
      altNames: json['alt_names'] as String? ?? '',
      wikipediaUrl: json['wikipedia_url'] as String? ?? '',
      weight: json['weight'] == null
          ? null
          : BreedWeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      adaptability: (json['adaptability'] as num?)?.toInt() ?? 0,
      affectionLevel: (json['affection_level'] as num?)?.toInt() ?? 0,
      childFriendly: (json['child_friendly'] as num?)?.toInt() ?? 0,
      dogFriendly: (json['dog_friendly'] as num?)?.toInt() ?? 0,
      energyLevel: (json['energy_level'] as num?)?.toInt() ?? 0,
      intelligence: (json['intelligence'] as num?)?.toInt() ?? 0,
      socialNeeds: (json['social_needs'] as num?)?.toInt() ?? 0,
      strangerFriendly: (json['stranger_friendly'] as num?)?.toInt() ?? 0,
      grooming: (json['grooming'] as num?)?.toInt() ?? 0,
      healthIssues: (json['health_issues'] as num?)?.toInt() ?? 0,
      vocalisation: (json['vocalisation'] as num?)?.toInt() ?? 0,
      hypoallergenic: (json['hypoallergenic'] as num?)?.toInt() ?? 0,
      rare: (json['rare'] as num?)?.toInt() ?? 0,
      referenceImageId: json['reference_image_id'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BreedModelImplToJson(_$BreedModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'origin': instance.origin,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'alt_names': instance.altNames,
      'wikipedia_url': instance.wikipediaUrl,
      'weight': instance.weight,
      'adaptability': instance.adaptability,
      'affection_level': instance.affectionLevel,
      'child_friendly': instance.childFriendly,
      'dog_friendly': instance.dogFriendly,
      'energy_level': instance.energyLevel,
      'intelligence': instance.intelligence,
      'social_needs': instance.socialNeeds,
      'stranger_friendly': instance.strangerFriendly,
      'grooming': instance.grooming,
      'health_issues': instance.healthIssues,
      'vocalisation': instance.vocalisation,
      'hypoallergenic': instance.hypoallergenic,
      'rare': instance.rare,
      'reference_image_id': instance.referenceImageId,
      'imageUrl': instance.imageUrl,
    };
