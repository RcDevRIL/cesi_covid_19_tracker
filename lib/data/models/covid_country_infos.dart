import 'package:freezed_annotation/freezed_annotation.dart'
    show DeepCollectionEquality, JsonKey, JsonSerializable, freezed;

part 'covid_country_infos.freezed.dart';
part 'covid_country_infos.g.dart';

@freezed
abstract class CovidCountryInfos with _$CovidCountryInfos {
  @JsonSerializable(explicitToJson: true)
  const factory CovidCountryInfos(
    @JsonKey(name: 'country') String country,
    @JsonKey(name: 'countryInfo') Map<String, dynamic> countryInfo,
    @JsonKey(name: 'updated') int update,
    @JsonKey(name: 'cases') int cases,
    @JsonKey(name: 'todayCases') int todayCases,
    @JsonKey(name: 'deaths') int deaths,
    @JsonKey(name: 'todayDeaths') int todayDeaths,
    @JsonKey(name: 'recovered') int recovered,
    @JsonKey(name: 'todayRecovered') int todayRecovered,
    @JsonKey(name: 'active') int active,
    @JsonKey(name: 'critical') int critical,
    @JsonKey(name: 'casesPerOneMillion') double casesPerOneMillion,
    @JsonKey(name: 'deathsPerOneMillion') double deathsPerOneMillion,
    @JsonKey(name: 'tests') int tests,
    @JsonKey(name: 'testsPerOneMillion') double testsPerOneMillion,
    @JsonKey(name: 'population') int population,
    @JsonKey(name: 'continent') String continent,
    @JsonKey(name: 'activePerOneMillion') double activePerOneMillion,
    @JsonKey(name: 'recoveredPerOneMillion') double recoveredPerOneMillion,
    @JsonKey(name: 'criticalPerOneMillion') double criticalPerOneMillion,
  ) = _CovidCountryInfos;

  factory CovidCountryInfos.fromJson(Map<String, dynamic> json) =>
      _$CovidCountryInfosFromJson(json);
}
