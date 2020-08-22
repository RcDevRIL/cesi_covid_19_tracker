// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_infos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names
_$_CovidInfos _$_$_CovidInfosFromJson(Map json) {
  return _$_CovidInfos(
    json['updated'] as int,
    json['cases'] as int,
    json['todayCases'] as int,
    json['deaths'] as int,
    json['todayDeaths'] as int,
    json['recovered'] as int,
    json['todayRecovered'] as int,
    json['active'] as int,
    json['critical'] as int,
    (json['casesPerOneMillion'] as num)?.toDouble(),
    (json['deathsPerOneMillion'] as num)?.toDouble(),
    json['tests'] as int,
    (json['testsPerOneMillion'] as num)?.toDouble(),
    json['population'] as int,
    (json['activePerOneMillion'] as num)?.toDouble(),
    (json['recoveredPerOneMillion'] as num)?.toDouble(),
    (json['criticalPerOneMillion'] as num)?.toDouble(),
    json['affectedCountries'] as int,
  );
}

Map<String, dynamic> _$_$_CovidInfosToJson(_$_CovidInfos instance) =>
    <String, dynamic>{
      'updated': instance.update,
      'cases': instance.cases,
      'todayCases': instance.todayCases,
      'deaths': instance.deaths,
      'todayDeaths': instance.todayDeaths,
      'recovered': instance.recovered,
      'todayRecovered': instance.todayRecovered,
      'active': instance.active,
      'critical': instance.critical,
      'casesPerOneMillion': instance.casesPerOneMillion,
      'deathsPerOneMillion': instance.deathsPerOneMillion,
      'tests': instance.tests,
      'testsPerOneMillion': instance.testsPerOneMillion,
      'population': instance.population,
      'activePerOneMillion': instance.activePerOneMillion,
      'recoveredPerOneMillion': instance.recoveredPerOneMillion,
      'criticalPerOneMillion': instance.criticalPerOneMillion,
      'affectedCountries': instance.affectedCountries,
    };
