// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_latest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
_$_CovidLatest _$_$_CovidLatestFromJson(Map json) {
  return _$_CovidLatest(
    json['updated'] as int,
    json['cases'] as int,
    json['todayCases'] as int,
    json['deaths'] as int,
    json['todayDeaths'] as int,
    json['recovered'] as int,
    json['active'] as int,
    json['critical'] as int,
    (json['casesPerOneMillion'] as num)?.toDouble(),
    (json['deathsPerOneMillion'] as num)?.toDouble(),
    json['tests'] as int,
    json['testsPerOneMillion'] as int,
    json['affectedCountries'] as int,
  );
}

Map<String, dynamic> _$_$_CovidLatestToJson(_$_CovidLatest instance) =>
    <String, dynamic>{
      'updated': instance.update,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'tests': instance.tests,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'affectedCountries': instance.affectedCountries,
    };
