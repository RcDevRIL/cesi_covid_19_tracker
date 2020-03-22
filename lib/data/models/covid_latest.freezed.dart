// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'covid_latest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CovidLatest _$CovidLatestFromJson(Map<String, dynamic> json) {
  return _CovidLatest.fromJson(json);
}

class _$CovidLatestTearOff {
  const _$CovidLatestTearOff();

  _CovidLatest call(@JsonKey(name: 'latest') Map<String, int> apiResponse) {
    return _CovidLatest(
      apiResponse,
    );
  }
}

// ignore: unused_element
const $CovidLatest = _$CovidLatestTearOff();

mixin _$CovidLatest {
  @JsonKey(name: 'latest')
  Map<String, int> get apiResponse;

  Map<String, dynamic> toJson();
  $CovidLatestCopyWith<CovidLatest> get copyWith;
}

abstract class $CovidLatestCopyWith<$Res> {
  factory $CovidLatestCopyWith(
          CovidLatest value, $Res Function(CovidLatest) then) =
      _$CovidLatestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'latest') Map<String, int> apiResponse});
}

class _$CovidLatestCopyWithImpl<$Res> implements $CovidLatestCopyWith<$Res> {
  _$CovidLatestCopyWithImpl(this._value, this._then);

  final CovidLatest _value;
  // ignore: unused_field
  final $Res Function(CovidLatest) _then;

  @override
  $Res call({
    Object apiResponse = freezed,
  }) {
    return _then(_value.copyWith(
      apiResponse: apiResponse == freezed
          ? _value.apiResponse
          : apiResponse as Map<String, int>,
    ));
  }
}

abstract class _$CovidLatestCopyWith<$Res>
    implements $CovidLatestCopyWith<$Res> {
  factory _$CovidLatestCopyWith(
          _CovidLatest value, $Res Function(_CovidLatest) then) =
      __$CovidLatestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'latest') Map<String, int> apiResponse});
}

class __$CovidLatestCopyWithImpl<$Res> extends _$CovidLatestCopyWithImpl<$Res>
    implements _$CovidLatestCopyWith<$Res> {
  __$CovidLatestCopyWithImpl(
      _CovidLatest _value, $Res Function(_CovidLatest) _then)
      : super(_value, (v) => _then(v as _CovidLatest));

  @override
  _CovidLatest get _value => super._value as _CovidLatest;

  @override
  $Res call({
    Object apiResponse = freezed,
  }) {
    return _then(_CovidLatest(
      apiResponse == freezed
          ? _value.apiResponse
          : apiResponse as Map<String, int>,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_CovidLatest with DiagnosticableTreeMixin implements _CovidLatest {
  const _$_CovidLatest(@JsonKey(name: 'latest') this.apiResponse)
      : assert(apiResponse != null);

  factory _$_CovidLatest.fromJson(Map<String, dynamic> json) =>
      _$_$_CovidLatestFromJson(json);

  @override
  @JsonKey(name: 'latest')
  final Map<String, int> apiResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CovidLatest(apiResponse: $apiResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CovidLatest'))
      ..add(DiagnosticsProperty('apiResponse', apiResponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CovidLatest &&
            (identical(other.apiResponse, apiResponse) ||
                const DeepCollectionEquality()
                    .equals(other.apiResponse, apiResponse)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(apiResponse);

  @override
  _$CovidLatestCopyWith<_CovidLatest> get copyWith =>
      __$CovidLatestCopyWithImpl<_CovidLatest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CovidLatestToJson(this);
  }
}

abstract class _CovidLatest implements CovidLatest {
  const factory _CovidLatest(
      @JsonKey(name: 'latest') Map<String, int> apiResponse) = _$_CovidLatest;

  factory _CovidLatest.fromJson(Map<String, dynamic> json) =
      _$_CovidLatest.fromJson;

  @override
  @JsonKey(name: 'latest')
  Map<String, int> get apiResponse;
  @override
  _$CovidLatestCopyWith<_CovidLatest> get copyWith;
}
