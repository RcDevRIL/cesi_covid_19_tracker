// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
_$_Country _$_$_CountryFromJson(Map json) {
  return _$_Country(
    (json['translations'] as Map)?.map(
      (k, e) => MapEntry(k as String, e as String),
    ),
    json['flag'] as String,
    json['name'] as String,
    json['alpha2Code'] as String,
    json['population'] as int,
  );
}

Map<String, dynamic> _$_$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'translations': instance.translations,
      'flag': instance.flag,
      'name': instance.name,
      'alpha2Code': instance.alpha2Code,
      'population': instance.population,
    };
