// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

class _$CountryTearOff {
  const _$CountryTearOff();

  _Country call(
      @JsonKey(name: 'flag') String flag,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'alpha2Code') String alpha2Code,
      @JsonKey(name: 'population') int population) {
    return _Country(
      flag,
      name,
      alpha2Code,
      population,
    );
  }
}

// ignore: unused_element
const $Country = _$CountryTearOff();

mixin _$Country {
  @JsonKey(name: 'flag')
  String get flag;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'alpha2Code')
  String get alpha2Code;
  @JsonKey(name: 'population')
  int get population;

  Map<String, dynamic> toJson();
  $CountryCopyWith<Country> get copyWith;
}

abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'flag') String flag,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'alpha2Code') String alpha2Code,
      @JsonKey(name: 'population') int population});
}

class _$CountryCopyWithImpl<$Res> implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  final Country _value;
  // ignore: unused_field
  final $Res Function(Country) _then;

  @override
  $Res call({
    Object flag = freezed,
    Object name = freezed,
    Object alpha2Code = freezed,
    Object population = freezed,
  }) {
    return _then(_value.copyWith(
      flag: flag == freezed ? _value.flag : flag as String,
      name: name == freezed ? _value.name : name as String,
      alpha2Code:
          alpha2Code == freezed ? _value.alpha2Code : alpha2Code as String,
      population: population == freezed ? _value.population : population as int,
    ));
  }
}

abstract class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) then) =
      __$CountryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'flag') String flag,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'alpha2Code') String alpha2Code,
      @JsonKey(name: 'population') int population});
}

class __$CountryCopyWithImpl<$Res> extends _$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(_Country _value, $Res Function(_Country) _then)
      : super(_value, (v) => _then(v as _Country));

  @override
  _Country get _value => super._value as _Country;

  @override
  $Res call({
    Object flag = freezed,
    Object name = freezed,
    Object alpha2Code = freezed,
    Object population = freezed,
  }) {
    return _then(_Country(
      flag == freezed ? _value.flag : flag as String,
      name == freezed ? _value.name : name as String,
      alpha2Code == freezed ? _value.alpha2Code : alpha2Code as String,
      population == freezed ? _value.population : population as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_Country implements _Country {
  const _$_Country(
      @JsonKey(name: 'flag') this.flag,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'alpha2Code') this.alpha2Code,
      @JsonKey(name: 'population') this.population)
      : assert(flag != null),
        assert(name != null),
        assert(alpha2Code != null),
        assert(population != null);

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryFromJson(json);

  @override
  @JsonKey(name: 'flag')
  final String flag;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'alpha2Code')
  final String alpha2Code;
  @override
  @JsonKey(name: 'population')
  final int population;

  @override
  String toString() {
    return 'Country(flag: $flag, name: $name, alpha2Code: $alpha2Code, population: $population)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Country &&
            (identical(other.flag, flag) ||
                const DeepCollectionEquality().equals(other.flag, flag)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alpha2Code, alpha2Code) ||
                const DeepCollectionEquality()
                    .equals(other.alpha2Code, alpha2Code)) &&
            (identical(other.population, population) ||
                const DeepCollectionEquality()
                    .equals(other.population, population)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(flag) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alpha2Code) ^
      const DeepCollectionEquality().hash(population);

  @override
  _$CountryCopyWith<_Country> get copyWith =>
      __$CountryCopyWithImpl<_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryToJson(this);
  }
}

abstract class _Country implements Country {
  const factory _Country(
      @JsonKey(name: 'flag') String flag,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'alpha2Code') String alpha2Code,
      @JsonKey(name: 'population') int population) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  @JsonKey(name: 'flag')
  String get flag;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'alpha2Code')
  String get alpha2Code;
  @override
  @JsonKey(name: 'population')
  int get population;
  @override
  _$CountryCopyWith<_Country> get copyWith;
}
