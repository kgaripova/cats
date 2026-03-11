// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BreedModel _$BreedModelFromJson(Map<String, dynamic> json) {
  return _BreedModel.fromJson(json);
}

/// @nodoc
mixin _$BreedModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get temperament => throw _privateConstructorUsedError;
  @JsonKey(name: 'life_span')
  String get lifeSpan => throw _privateConstructorUsedError;
  @JsonKey(name: 'alt_names')
  String get altNames => throw _privateConstructorUsedError;
  @JsonKey(name: 'wikipedia_url')
  String get wikipediaUrl => throw _privateConstructorUsedError;
  BreedWeightModel? get weight => throw _privateConstructorUsedError;
  int get adaptability => throw _privateConstructorUsedError;
  @JsonKey(name: 'affection_level')
  int get affectionLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'child_friendly')
  int get childFriendly => throw _privateConstructorUsedError;
  @JsonKey(name: 'dog_friendly')
  int get dogFriendly => throw _privateConstructorUsedError;
  @JsonKey(name: 'energy_level')
  int get energyLevel => throw _privateConstructorUsedError;
  int get intelligence => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_needs')
  int get socialNeeds => throw _privateConstructorUsedError;
  @JsonKey(name: 'stranger_friendly')
  int get strangerFriendly => throw _privateConstructorUsedError;
  int get grooming => throw _privateConstructorUsedError;
  @JsonKey(name: 'health_issues')
  int get healthIssues => throw _privateConstructorUsedError;
  int get vocalisation => throw _privateConstructorUsedError;
  int get hypoallergenic => throw _privateConstructorUsedError;
  int get rare => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_image_id')
  String? get referenceImageId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this BreedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedModelCopyWith<BreedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedModelCopyWith<$Res> {
  factory $BreedModelCopyWith(
    BreedModel value,
    $Res Function(BreedModel) then,
  ) = _$BreedModelCopyWithImpl<$Res, BreedModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String origin,
    String temperament,
    @JsonKey(name: 'life_span') String lifeSpan,
    @JsonKey(name: 'alt_names') String altNames,
    @JsonKey(name: 'wikipedia_url') String wikipediaUrl,
    BreedWeightModel? weight,
    int adaptability,
    @JsonKey(name: 'affection_level') int affectionLevel,
    @JsonKey(name: 'child_friendly') int childFriendly,
    @JsonKey(name: 'dog_friendly') int dogFriendly,
    @JsonKey(name: 'energy_level') int energyLevel,
    int intelligence,
    @JsonKey(name: 'social_needs') int socialNeeds,
    @JsonKey(name: 'stranger_friendly') int strangerFriendly,
    int grooming,
    @JsonKey(name: 'health_issues') int healthIssues,
    int vocalisation,
    int hypoallergenic,
    int rare,
    @JsonKey(name: 'reference_image_id') String? referenceImageId,
    String? imageUrl,
  });

  $BreedWeightModelCopyWith<$Res>? get weight;
}

/// @nodoc
class _$BreedModelCopyWithImpl<$Res, $Val extends BreedModel>
    implements $BreedModelCopyWith<$Res> {
  _$BreedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? origin = null,
    Object? temperament = null,
    Object? lifeSpan = null,
    Object? altNames = null,
    Object? wikipediaUrl = null,
    Object? weight = freezed,
    Object? adaptability = null,
    Object? affectionLevel = null,
    Object? childFriendly = null,
    Object? dogFriendly = null,
    Object? energyLevel = null,
    Object? intelligence = null,
    Object? socialNeeds = null,
    Object? strangerFriendly = null,
    Object? grooming = null,
    Object? healthIssues = null,
    Object? vocalisation = null,
    Object? hypoallergenic = null,
    Object? rare = null,
    Object? referenceImageId = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            origin: null == origin
                ? _value.origin
                : origin // ignore: cast_nullable_to_non_nullable
                      as String,
            temperament: null == temperament
                ? _value.temperament
                : temperament // ignore: cast_nullable_to_non_nullable
                      as String,
            lifeSpan: null == lifeSpan
                ? _value.lifeSpan
                : lifeSpan // ignore: cast_nullable_to_non_nullable
                      as String,
            altNames: null == altNames
                ? _value.altNames
                : altNames // ignore: cast_nullable_to_non_nullable
                      as String,
            wikipediaUrl: null == wikipediaUrl
                ? _value.wikipediaUrl
                : wikipediaUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as BreedWeightModel?,
            adaptability: null == adaptability
                ? _value.adaptability
                : adaptability // ignore: cast_nullable_to_non_nullable
                      as int,
            affectionLevel: null == affectionLevel
                ? _value.affectionLevel
                : affectionLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            childFriendly: null == childFriendly
                ? _value.childFriendly
                : childFriendly // ignore: cast_nullable_to_non_nullable
                      as int,
            dogFriendly: null == dogFriendly
                ? _value.dogFriendly
                : dogFriendly // ignore: cast_nullable_to_non_nullable
                      as int,
            energyLevel: null == energyLevel
                ? _value.energyLevel
                : energyLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            intelligence: null == intelligence
                ? _value.intelligence
                : intelligence // ignore: cast_nullable_to_non_nullable
                      as int,
            socialNeeds: null == socialNeeds
                ? _value.socialNeeds
                : socialNeeds // ignore: cast_nullable_to_non_nullable
                      as int,
            strangerFriendly: null == strangerFriendly
                ? _value.strangerFriendly
                : strangerFriendly // ignore: cast_nullable_to_non_nullable
                      as int,
            grooming: null == grooming
                ? _value.grooming
                : grooming // ignore: cast_nullable_to_non_nullable
                      as int,
            healthIssues: null == healthIssues
                ? _value.healthIssues
                : healthIssues // ignore: cast_nullable_to_non_nullable
                      as int,
            vocalisation: null == vocalisation
                ? _value.vocalisation
                : vocalisation // ignore: cast_nullable_to_non_nullable
                      as int,
            hypoallergenic: null == hypoallergenic
                ? _value.hypoallergenic
                : hypoallergenic // ignore: cast_nullable_to_non_nullable
                      as int,
            rare: null == rare
                ? _value.rare
                : rare // ignore: cast_nullable_to_non_nullable
                      as int,
            referenceImageId: freezed == referenceImageId
                ? _value.referenceImageId
                : referenceImageId // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BreedWeightModelCopyWith<$Res>? get weight {
    if (_value.weight == null) {
      return null;
    }

    return $BreedWeightModelCopyWith<$Res>(_value.weight!, (value) {
      return _then(_value.copyWith(weight: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BreedModelImplCopyWith<$Res>
    implements $BreedModelCopyWith<$Res> {
  factory _$$BreedModelImplCopyWith(
    _$BreedModelImpl value,
    $Res Function(_$BreedModelImpl) then,
  ) = __$$BreedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String origin,
    String temperament,
    @JsonKey(name: 'life_span') String lifeSpan,
    @JsonKey(name: 'alt_names') String altNames,
    @JsonKey(name: 'wikipedia_url') String wikipediaUrl,
    BreedWeightModel? weight,
    int adaptability,
    @JsonKey(name: 'affection_level') int affectionLevel,
    @JsonKey(name: 'child_friendly') int childFriendly,
    @JsonKey(name: 'dog_friendly') int dogFriendly,
    @JsonKey(name: 'energy_level') int energyLevel,
    int intelligence,
    @JsonKey(name: 'social_needs') int socialNeeds,
    @JsonKey(name: 'stranger_friendly') int strangerFriendly,
    int grooming,
    @JsonKey(name: 'health_issues') int healthIssues,
    int vocalisation,
    int hypoallergenic,
    int rare,
    @JsonKey(name: 'reference_image_id') String? referenceImageId,
    String? imageUrl,
  });

  @override
  $BreedWeightModelCopyWith<$Res>? get weight;
}

/// @nodoc
class __$$BreedModelImplCopyWithImpl<$Res>
    extends _$BreedModelCopyWithImpl<$Res, _$BreedModelImpl>
    implements _$$BreedModelImplCopyWith<$Res> {
  __$$BreedModelImplCopyWithImpl(
    _$BreedModelImpl _value,
    $Res Function(_$BreedModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? origin = null,
    Object? temperament = null,
    Object? lifeSpan = null,
    Object? altNames = null,
    Object? wikipediaUrl = null,
    Object? weight = freezed,
    Object? adaptability = null,
    Object? affectionLevel = null,
    Object? childFriendly = null,
    Object? dogFriendly = null,
    Object? energyLevel = null,
    Object? intelligence = null,
    Object? socialNeeds = null,
    Object? strangerFriendly = null,
    Object? grooming = null,
    Object? healthIssues = null,
    Object? vocalisation = null,
    Object? hypoallergenic = null,
    Object? rare = null,
    Object? referenceImageId = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$BreedModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        origin: null == origin
            ? _value.origin
            : origin // ignore: cast_nullable_to_non_nullable
                  as String,
        temperament: null == temperament
            ? _value.temperament
            : temperament // ignore: cast_nullable_to_non_nullable
                  as String,
        lifeSpan: null == lifeSpan
            ? _value.lifeSpan
            : lifeSpan // ignore: cast_nullable_to_non_nullable
                  as String,
        altNames: null == altNames
            ? _value.altNames
            : altNames // ignore: cast_nullable_to_non_nullable
                  as String,
        wikipediaUrl: null == wikipediaUrl
            ? _value.wikipediaUrl
            : wikipediaUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as BreedWeightModel?,
        adaptability: null == adaptability
            ? _value.adaptability
            : adaptability // ignore: cast_nullable_to_non_nullable
                  as int,
        affectionLevel: null == affectionLevel
            ? _value.affectionLevel
            : affectionLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        childFriendly: null == childFriendly
            ? _value.childFriendly
            : childFriendly // ignore: cast_nullable_to_non_nullable
                  as int,
        dogFriendly: null == dogFriendly
            ? _value.dogFriendly
            : dogFriendly // ignore: cast_nullable_to_non_nullable
                  as int,
        energyLevel: null == energyLevel
            ? _value.energyLevel
            : energyLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        intelligence: null == intelligence
            ? _value.intelligence
            : intelligence // ignore: cast_nullable_to_non_nullable
                  as int,
        socialNeeds: null == socialNeeds
            ? _value.socialNeeds
            : socialNeeds // ignore: cast_nullable_to_non_nullable
                  as int,
        strangerFriendly: null == strangerFriendly
            ? _value.strangerFriendly
            : strangerFriendly // ignore: cast_nullable_to_non_nullable
                  as int,
        grooming: null == grooming
            ? _value.grooming
            : grooming // ignore: cast_nullable_to_non_nullable
                  as int,
        healthIssues: null == healthIssues
            ? _value.healthIssues
            : healthIssues // ignore: cast_nullable_to_non_nullable
                  as int,
        vocalisation: null == vocalisation
            ? _value.vocalisation
            : vocalisation // ignore: cast_nullable_to_non_nullable
                  as int,
        hypoallergenic: null == hypoallergenic
            ? _value.hypoallergenic
            : hypoallergenic // ignore: cast_nullable_to_non_nullable
                  as int,
        rare: null == rare
            ? _value.rare
            : rare // ignore: cast_nullable_to_non_nullable
                  as int,
        referenceImageId: freezed == referenceImageId
            ? _value.referenceImageId
            : referenceImageId // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedModelImpl implements _BreedModel {
  const _$BreedModelImpl({
    required this.id,
    required this.name,
    this.description = '',
    this.origin = '',
    this.temperament = '',
    @JsonKey(name: 'life_span') this.lifeSpan = '',
    @JsonKey(name: 'alt_names') this.altNames = '',
    @JsonKey(name: 'wikipedia_url') this.wikipediaUrl = '',
    this.weight,
    this.adaptability = 0,
    @JsonKey(name: 'affection_level') this.affectionLevel = 0,
    @JsonKey(name: 'child_friendly') this.childFriendly = 0,
    @JsonKey(name: 'dog_friendly') this.dogFriendly = 0,
    @JsonKey(name: 'energy_level') this.energyLevel = 0,
    this.intelligence = 0,
    @JsonKey(name: 'social_needs') this.socialNeeds = 0,
    @JsonKey(name: 'stranger_friendly') this.strangerFriendly = 0,
    this.grooming = 0,
    @JsonKey(name: 'health_issues') this.healthIssues = 0,
    this.vocalisation = 0,
    this.hypoallergenic = 0,
    this.rare = 0,
    @JsonKey(name: 'reference_image_id') this.referenceImageId,
    this.imageUrl,
  });

  factory _$BreedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String origin;
  @override
  @JsonKey()
  final String temperament;
  @override
  @JsonKey(name: 'life_span')
  final String lifeSpan;
  @override
  @JsonKey(name: 'alt_names')
  final String altNames;
  @override
  @JsonKey(name: 'wikipedia_url')
  final String wikipediaUrl;
  @override
  final BreedWeightModel? weight;
  @override
  @JsonKey()
  final int adaptability;
  @override
  @JsonKey(name: 'affection_level')
  final int affectionLevel;
  @override
  @JsonKey(name: 'child_friendly')
  final int childFriendly;
  @override
  @JsonKey(name: 'dog_friendly')
  final int dogFriendly;
  @override
  @JsonKey(name: 'energy_level')
  final int energyLevel;
  @override
  @JsonKey()
  final int intelligence;
  @override
  @JsonKey(name: 'social_needs')
  final int socialNeeds;
  @override
  @JsonKey(name: 'stranger_friendly')
  final int strangerFriendly;
  @override
  @JsonKey()
  final int grooming;
  @override
  @JsonKey(name: 'health_issues')
  final int healthIssues;
  @override
  @JsonKey()
  final int vocalisation;
  @override
  @JsonKey()
  final int hypoallergenic;
  @override
  @JsonKey()
  final int rare;
  @override
  @JsonKey(name: 'reference_image_id')
  final String? referenceImageId;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'BreedModel(id: $id, name: $name, description: $description, origin: $origin, temperament: $temperament, lifeSpan: $lifeSpan, altNames: $altNames, wikipediaUrl: $wikipediaUrl, weight: $weight, adaptability: $adaptability, affectionLevel: $affectionLevel, childFriendly: $childFriendly, dogFriendly: $dogFriendly, energyLevel: $energyLevel, intelligence: $intelligence, socialNeeds: $socialNeeds, strangerFriendly: $strangerFriendly, grooming: $grooming, healthIssues: $healthIssues, vocalisation: $vocalisation, hypoallergenic: $hypoallergenic, rare: $rare, referenceImageId: $referenceImageId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.temperament, temperament) ||
                other.temperament == temperament) &&
            (identical(other.lifeSpan, lifeSpan) ||
                other.lifeSpan == lifeSpan) &&
            (identical(other.altNames, altNames) ||
                other.altNames == altNames) &&
            (identical(other.wikipediaUrl, wikipediaUrl) ||
                other.wikipediaUrl == wikipediaUrl) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.adaptability, adaptability) ||
                other.adaptability == adaptability) &&
            (identical(other.affectionLevel, affectionLevel) ||
                other.affectionLevel == affectionLevel) &&
            (identical(other.childFriendly, childFriendly) ||
                other.childFriendly == childFriendly) &&
            (identical(other.dogFriendly, dogFriendly) ||
                other.dogFriendly == dogFriendly) &&
            (identical(other.energyLevel, energyLevel) ||
                other.energyLevel == energyLevel) &&
            (identical(other.intelligence, intelligence) ||
                other.intelligence == intelligence) &&
            (identical(other.socialNeeds, socialNeeds) ||
                other.socialNeeds == socialNeeds) &&
            (identical(other.strangerFriendly, strangerFriendly) ||
                other.strangerFriendly == strangerFriendly) &&
            (identical(other.grooming, grooming) ||
                other.grooming == grooming) &&
            (identical(other.healthIssues, healthIssues) ||
                other.healthIssues == healthIssues) &&
            (identical(other.vocalisation, vocalisation) ||
                other.vocalisation == vocalisation) &&
            (identical(other.hypoallergenic, hypoallergenic) ||
                other.hypoallergenic == hypoallergenic) &&
            (identical(other.rare, rare) || other.rare == rare) &&
            (identical(other.referenceImageId, referenceImageId) ||
                other.referenceImageId == referenceImageId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    description,
    origin,
    temperament,
    lifeSpan,
    altNames,
    wikipediaUrl,
    weight,
    adaptability,
    affectionLevel,
    childFriendly,
    dogFriendly,
    energyLevel,
    intelligence,
    socialNeeds,
    strangerFriendly,
    grooming,
    healthIssues,
    vocalisation,
    hypoallergenic,
    rare,
    referenceImageId,
    imageUrl,
  ]);

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedModelImplCopyWith<_$BreedModelImpl> get copyWith =>
      __$$BreedModelImplCopyWithImpl<_$BreedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedModelImplToJson(this);
  }
}

abstract class _BreedModel implements BreedModel {
  const factory _BreedModel({
    required final String id,
    required final String name,
    final String description,
    final String origin,
    final String temperament,
    @JsonKey(name: 'life_span') final String lifeSpan,
    @JsonKey(name: 'alt_names') final String altNames,
    @JsonKey(name: 'wikipedia_url') final String wikipediaUrl,
    final BreedWeightModel? weight,
    final int adaptability,
    @JsonKey(name: 'affection_level') final int affectionLevel,
    @JsonKey(name: 'child_friendly') final int childFriendly,
    @JsonKey(name: 'dog_friendly') final int dogFriendly,
    @JsonKey(name: 'energy_level') final int energyLevel,
    final int intelligence,
    @JsonKey(name: 'social_needs') final int socialNeeds,
    @JsonKey(name: 'stranger_friendly') final int strangerFriendly,
    final int grooming,
    @JsonKey(name: 'health_issues') final int healthIssues,
    final int vocalisation,
    final int hypoallergenic,
    final int rare,
    @JsonKey(name: 'reference_image_id') final String? referenceImageId,
    final String? imageUrl,
  }) = _$BreedModelImpl;

  factory _BreedModel.fromJson(Map<String, dynamic> json) =
      _$BreedModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get origin;
  @override
  String get temperament;
  @override
  @JsonKey(name: 'life_span')
  String get lifeSpan;
  @override
  @JsonKey(name: 'alt_names')
  String get altNames;
  @override
  @JsonKey(name: 'wikipedia_url')
  String get wikipediaUrl;
  @override
  BreedWeightModel? get weight;
  @override
  int get adaptability;
  @override
  @JsonKey(name: 'affection_level')
  int get affectionLevel;
  @override
  @JsonKey(name: 'child_friendly')
  int get childFriendly;
  @override
  @JsonKey(name: 'dog_friendly')
  int get dogFriendly;
  @override
  @JsonKey(name: 'energy_level')
  int get energyLevel;
  @override
  int get intelligence;
  @override
  @JsonKey(name: 'social_needs')
  int get socialNeeds;
  @override
  @JsonKey(name: 'stranger_friendly')
  int get strangerFriendly;
  @override
  int get grooming;
  @override
  @JsonKey(name: 'health_issues')
  int get healthIssues;
  @override
  int get vocalisation;
  @override
  int get hypoallergenic;
  @override
  int get rare;
  @override
  @JsonKey(name: 'reference_image_id')
  String? get referenceImageId;
  @override
  String? get imageUrl;

  /// Create a copy of BreedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedModelImplCopyWith<_$BreedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
