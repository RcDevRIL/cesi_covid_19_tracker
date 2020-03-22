// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_latest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
_$_CovidLatest _$_$_CovidLatestFromJson(Map json) {
  return _$_CovidLatest(
    (json['latest'] as Map)?.map(
      (k, e) => MapEntry(k as String, e as int),
    ),
  );
}

Map<String, dynamic> _$_$_CovidLatestToJson(_$_CovidLatest instance) =>
    <String, dynamic>{
      'latest': instance.apiResponse,
    };
