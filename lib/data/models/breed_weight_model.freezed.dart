// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_weight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BreedWeightModel _$BreedWeightModelFromJson(Map<String, dynamic> json) {
  return _BreedWeightModel.fromJson(json);
}

/// @nodoc
mixin _$BreedWeightModel {
  String get imperial => throw _privateConstructorUsedError;
  String get metric => throw _privateConstructorUsedError;

  /// Serializes this BreedWeightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreedWeightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreedWeightModelCopyWith<BreedWeightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedWeightModelCopyWith<$Res> {
  factory $BreedWeightModelCopyWith(
    BreedWeightModel value,
    $Res Function(BreedWeightModel) then,
  ) = _$BreedWeightModelCopyWithImpl<$Res, BreedWeightModel>;
  @useResult
  $Res call({String imperial, String metric});
}

/// @nodoc
class _$BreedWeightModelCopyWithImpl<$Res, $Val extends BreedWeightModel>
    implements $BreedWeightModelCopyWith<$Res> {
  _$BreedWeightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreedWeightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imperial = null, Object? metric = null}) {
    return _then(
      _value.copyWith(
            imperial: null == imperial
                ? _value.imperial
                : imperial // ignore: cast_nullable_to_non_nullable
                      as String,
            metric: null == metric
                ? _value.metric
                : metric // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreedWeightModelImplCopyWith<$Res>
    implements $BreedWeightModelCopyWith<$Res> {
  factory _$$BreedWeightModelImplCopyWith(
    _$BreedWeightModelImpl value,
    $Res Function(_$BreedWeightModelImpl) then,
  ) = __$$BreedWeightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imperial, String metric});
}

/// @nodoc
class __$$BreedWeightModelImplCopyWithImpl<$Res>
    extends _$BreedWeightModelCopyWithImpl<$Res, _$BreedWeightModelImpl>
    implements _$$BreedWeightModelImplCopyWith<$Res> {
  __$$BreedWeightModelImplCopyWithImpl(
    _$BreedWeightModelImpl _value,
    $Res Function(_$BreedWeightModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreedWeightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imperial = null, Object? metric = null}) {
    return _then(
      _$BreedWeightModelImpl(
        imperial: null == imperial
            ? _value.imperial
            : imperial // ignore: cast_nullable_to_non_nullable
                  as String,
        metric: null == metric
            ? _value.metric
            : metric // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedWeightModelImpl implements _BreedWeightModel {
  const _$BreedWeightModelImpl({required this.imperial, required this.metric});

  factory _$BreedWeightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedWeightModelImplFromJson(json);

  @override
  final String imperial;
  @override
  final String metric;

  @override
  String toString() {
    return 'BreedWeightModel(imperial: $imperial, metric: $metric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedWeightModelImpl &&
            (identical(other.imperial, imperial) ||
                other.imperial == imperial) &&
            (identical(other.metric, metric) || other.metric == metric));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imperial, metric);

  /// Create a copy of BreedWeightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedWeightModelImplCopyWith<_$BreedWeightModelImpl> get copyWith =>
      __$$BreedWeightModelImplCopyWithImpl<_$BreedWeightModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedWeightModelImplToJson(this);
  }
}

abstract class _BreedWeightModel implements BreedWeightModel {
  const factory _BreedWeightModel({
    required final String imperial,
    required final String metric,
  }) = _$BreedWeightModelImpl;

  factory _BreedWeightModel.fromJson(Map<String, dynamic> json) =
      _$BreedWeightModelImpl.fromJson;

  @override
  String get imperial;
  @override
  String get metric;

  /// Create a copy of BreedWeightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreedWeightModelImplCopyWith<_$BreedWeightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
