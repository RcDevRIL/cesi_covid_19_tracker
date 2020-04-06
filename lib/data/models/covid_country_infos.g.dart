// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_country_infos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
_$_CovidCountryInfos _$_$_CovidCountryInfosFromJson(Map json) {
  return _$_CovidCountryInfos(
    json['country'] as String,
    (json['countryInfo'] as Map)?.map(
      (k, e) => MapEntry(k as String, e),
    ),
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
  );
}

Map<String, dynamic> _$_$_CovidCountryInfosToJson(
        _$_CovidCountryInfos instance) =>
    <String, dynamic>{
      'country': instance.country,
      'countryInfo': instance.countryInfo,
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
    };
