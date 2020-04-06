import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_infos.freezed.dart';
part 'covid_infos.g.dart';

/* 
/!\ Il faut rajouter le commentaire suivant sur covid_infos.g.dart /!\
/!\ si on le génère à nouveau. Ce commentaire fait en sorte d'ignorer /!\
/!\ une certaine règle qui fait planter l'analyse statique du code /!\
/!\ et par la même occasion fait arreter nos builds sur l'outil CI/CD /!\ */

// ignore_for_file: non_constant_identifier_names
@freezed
abstract class CovidInfos with _$CovidInfos {
  @JsonSerializable(explicitToJson: true)
  const factory CovidInfos(
    @JsonKey(name: 'updated') int update,
    @JsonKey(name: 'cases') int cases,
    @JsonKey(name: 'todayCases') int todayCases,
    @JsonKey(name: 'deaths') int deaths,
    @JsonKey(name: 'todayDeaths') int todayDeaths,
    @JsonKey(name: 'recovered') int recovered,
    @JsonKey(name: 'active') int active,
    @JsonKey(name: 'critical') int critical,
    @JsonKey(name: 'casesPerOneMillion') double casesPerOneMillion,
    @JsonKey(name: 'deathsPerOneMillion') double deathsPerOneMillion,
    @JsonKey(name: 'tests') int tests,
    @JsonKey(name: 'testsPerOneMillion') int testsPerOneMillion,
    @JsonKey(name: 'affectedCountries') int affectedCountries,
  ) = _CovidInfos;

  factory CovidInfos.fromJson(Map<String, dynamic> json) =>
      _$CovidInfosFromJson(json);
}
