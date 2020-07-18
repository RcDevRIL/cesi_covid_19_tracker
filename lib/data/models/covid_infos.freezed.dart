// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'covid_infos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CovidInfos _$CovidInfosFromJson(Map<String, dynamic> json) {
  return _CovidInfos.fromJson(json);
}

class _$CovidInfosTearOff {
  const _$CovidInfosTearOff();

  _CovidInfos call(
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
      @JsonKey(name: 'activePerOneMillion') double activePerOneMillion,
      @JsonKey(name: 'recoveredPerOneMillion') double recoveredPerOneMillion,
      @JsonKey(name: 'criticalPerOneMillion') double criticalPerOneMillion,
      @JsonKey(name: 'affectedCountries') int affectedCountries) {
    return _CovidInfos(
      update,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      casesPerOneMillion,
      deathsPerOneMillion,
      tests,
      testsPerOneMillion,
      population,
      activePerOneMillion,
      recoveredPerOneMillion,
      criticalPerOneMillion,
      affectedCountries,
    );
  }
}

// ignore: unused_element
const $CovidInfos = _$CovidInfosTearOff();

mixin _$CovidInfos {
  @JsonKey(name: 'updated')
  int get update;
  @JsonKey(name: 'cases')
  int get cases;
  @JsonKey(name: 'todayCases')
  int get todayCases;
  @JsonKey(name: 'deaths')
  int get deaths;
  @JsonKey(name: 'todayDeaths')
  int get todayDeaths;
  @JsonKey(name: 'recovered')
  int get recovered;
  @JsonKey(name: 'todayRecovered')
  int get todayRecovered;
  @JsonKey(name: 'active')
  int get active;
  @JsonKey(name: 'critical')
  int get critical;
  @JsonKey(name: 'casesPerOneMillion')
  double get casesPerOneMillion;
  @JsonKey(name: 'deathsPerOneMillion')
  double get deathsPerOneMillion;
  @JsonKey(name: 'tests')
  int get tests;
  @JsonKey(name: 'testsPerOneMillion')
  double get testsPerOneMillion;
  @JsonKey(name: 'population')
  int get population;
  @JsonKey(name: 'activePerOneMillion')
  double get activePerOneMillion;
  @JsonKey(name: 'recoveredPerOneMillion')
  double get recoveredPerOneMillion;
  @JsonKey(name: 'criticalPerOneMillion')
  double get criticalPerOneMillion;
  @JsonKey(name: 'affectedCountries')
  int get affectedCountries;

  Map<String, dynamic> toJson();
  $CovidInfosCopyWith<CovidInfos> get copyWith;
}

abstract class $CovidInfosCopyWith<$Res> {
  factory $CovidInfosCopyWith(
          CovidInfos value, $Res Function(CovidInfos) then) =
      _$CovidInfosCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'updated') int update,
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
      @JsonKey(name: 'activePerOneMillion') double activePerOneMillion,
      @JsonKey(name: 'recoveredPerOneMillion') double recoveredPerOneMillion,
      @JsonKey(name: 'criticalPerOneMillion') double criticalPerOneMillion,
      @JsonKey(name: 'affectedCountries') int affectedCountries});
}

class _$CovidInfosCopyWithImpl<$Res> implements $CovidInfosCopyWith<$Res> {
  _$CovidInfosCopyWithImpl(this._value, this._then);

  final CovidInfos _value;
  // ignore: unused_field
  final $Res Function(CovidInfos) _then;

  @override
  $Res call({
    Object update = freezed,
    Object cases = freezed,
    Object todayCases = freezed,
    Object deaths = freezed,
    Object todayDeaths = freezed,
    Object recovered = freezed,
    Object todayRecovered = freezed,
    Object active = freezed,
    Object critical = freezed,
    Object casesPerOneMillion = freezed,
    Object deathsPerOneMillion = freezed,
    Object tests = freezed,
    Object testsPerOneMillion = freezed,
    Object population = freezed,
    Object activePerOneMillion = freezed,
    Object recoveredPerOneMillion = freezed,
    Object criticalPerOneMillion = freezed,
    Object affectedCountries = freezed,
  }) {
    return _then(_value.copyWith(
      update: update == freezed ? _value.update : update as int,
      cases: cases == freezed ? _value.cases : cases as int,
      todayCases: todayCases == freezed ? _value.todayCases : todayCases as int,
      deaths: deaths == freezed ? _value.deaths : deaths as int,
      todayDeaths:
          todayDeaths == freezed ? _value.todayDeaths : todayDeaths as int,
      recovered: recovered == freezed ? _value.recovered : recovered as int,
      todayRecovered: todayRecovered == freezed
          ? _value.todayRecovered
          : todayRecovered as int,
      active: active == freezed ? _value.active : active as int,
      critical: critical == freezed ? _value.critical : critical as int,
      casesPerOneMillion: casesPerOneMillion == freezed
          ? _value.casesPerOneMillion
          : casesPerOneMillion as double,
      deathsPerOneMillion: deathsPerOneMillion == freezed
          ? _value.deathsPerOneMillion
          : deathsPerOneMillion as double,
      tests: tests == freezed ? _value.tests : tests as int,
      testsPerOneMillion: testsPerOneMillion == freezed
          ? _value.testsPerOneMillion
          : testsPerOneMillion as double,
      population: population == freezed ? _value.population : population as int,
      activePerOneMillion: activePerOneMillion == freezed
          ? _value.activePerOneMillion
          : activePerOneMillion as double,
      recoveredPerOneMillion: recoveredPerOneMillion == freezed
          ? _value.recoveredPerOneMillion
          : recoveredPerOneMillion as double,
      criticalPerOneMillion: criticalPerOneMillion == freezed
          ? _value.criticalPerOneMillion
          : criticalPerOneMillion as double,
      affectedCountries: affectedCountries == freezed
          ? _value.affectedCountries
          : affectedCountries as int,
    ));
  }
}

abstract class _$CovidInfosCopyWith<$Res> implements $CovidInfosCopyWith<$Res> {
  factory _$CovidInfosCopyWith(
          _CovidInfos value, $Res Function(_CovidInfos) then) =
      __$CovidInfosCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'updated') int update,
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
      @JsonKey(name: 'activePerOneMillion') double activePerOneMillion,
      @JsonKey(name: 'recoveredPerOneMillion') double recoveredPerOneMillion,
      @JsonKey(name: 'criticalPerOneMillion') double criticalPerOneMillion,
      @JsonKey(name: 'affectedCountries') int affectedCountries});
}

class __$CovidInfosCopyWithImpl<$Res> extends _$CovidInfosCopyWithImpl<$Res>
    implements _$CovidInfosCopyWith<$Res> {
  __$CovidInfosCopyWithImpl(
      _CovidInfos _value, $Res Function(_CovidInfos) _then)
      : super(_value, (v) => _then(v as _CovidInfos));

  @override
  _CovidInfos get _value => super._value as _CovidInfos;

  @override
  $Res call({
    Object update = freezed,
    Object cases = freezed,
    Object todayCases = freezed,
    Object deaths = freezed,
    Object todayDeaths = freezed,
    Object recovered = freezed,
    Object todayRecovered = freezed,
    Object active = freezed,
    Object critical = freezed,
    Object casesPerOneMillion = freezed,
    Object deathsPerOneMillion = freezed,
    Object tests = freezed,
    Object testsPerOneMillion = freezed,
    Object population = freezed,
    Object activePerOneMillion = freezed,
    Object recoveredPerOneMillion = freezed,
    Object criticalPerOneMillion = freezed,
    Object affectedCountries = freezed,
  }) {
    return _then(_CovidInfos(
      update == freezed ? _value.update : update as int,
      cases == freezed ? _value.cases : cases as int,
      todayCases == freezed ? _value.todayCases : todayCases as int,
      deaths == freezed ? _value.deaths : deaths as int,
      todayDeaths == freezed ? _value.todayDeaths : todayDeaths as int,
      recovered == freezed ? _value.recovered : recovered as int,
      todayRecovered == freezed ? _value.todayRecovered : todayRecovered as int,
      active == freezed ? _value.active : active as int,
      critical == freezed ? _value.critical : critical as int,
      casesPerOneMillion == freezed
          ? _value.casesPerOneMillion
          : casesPerOneMillion as double,
      deathsPerOneMillion == freezed
          ? _value.deathsPerOneMillion
          : deathsPerOneMillion as double,
      tests == freezed ? _value.tests : tests as int,
      testsPerOneMillion == freezed
          ? _value.testsPerOneMillion
          : testsPerOneMillion as double,
      population == freezed ? _value.population : population as int,
      activePerOneMillion == freezed
          ? _value.activePerOneMillion
          : activePerOneMillion as double,
      recoveredPerOneMillion == freezed
          ? _value.recoveredPerOneMillion
          : recoveredPerOneMillion as double,
      criticalPerOneMillion == freezed
          ? _value.criticalPerOneMillion
          : criticalPerOneMillion as double,
      affectedCountries == freezed
          ? _value.affectedCountries
          : affectedCountries as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_CovidInfos implements _CovidInfos {
  const _$_CovidInfos(
      @JsonKey(name: 'updated') this.update,
      @JsonKey(name: 'cases') this.cases,
      @JsonKey(name: 'todayCases') this.todayCases,
      @JsonKey(name: 'deaths') this.deaths,
      @JsonKey(name: 'todayDeaths') this.todayDeaths,
      @JsonKey(name: 'recovered') this.recovered,
      @JsonKey(name: 'todayRecovered') this.todayRecovered,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'critical') this.critical,
      @JsonKey(name: 'casesPerOneMillion') this.casesPerOneMillion,
      @JsonKey(name: 'deathsPerOneMillion') this.deathsPerOneMillion,
      @JsonKey(name: 'tests') this.tests,
      @JsonKey(name: 'testsPerOneMillion') this.testsPerOneMillion,
      @JsonKey(name: 'population') this.population,
      @JsonKey(name: 'activePerOneMillion') this.activePerOneMillion,
      @JsonKey(name: 'recoveredPerOneMillion') this.recoveredPerOneMillion,
      @JsonKey(name: 'criticalPerOneMillion') this.criticalPerOneMillion,
      @JsonKey(name: 'affectedCountries') this.affectedCountries)
      : assert(update != null),
        assert(cases != null),
        assert(todayCases != null),
        assert(deaths != null),
        assert(todayDeaths != null),
        assert(recovered != null),
        assert(todayRecovered != null),
        assert(active != null),
        assert(critical != null),
        assert(casesPerOneMillion != null),
        assert(deathsPerOneMillion != null),
        assert(tests != null),
        assert(testsPerOneMillion != null),
        assert(population != null),
        assert(activePerOneMillion != null),
        assert(recoveredPerOneMillion != null),
        assert(criticalPerOneMillion != null),
        assert(affectedCountries != null);

  factory _$_CovidInfos.fromJson(Map<String, dynamic> json) =>
      _$_$_CovidInfosFromJson(json);

  @override
  @JsonKey(name: 'updated')
  final int update;
  @override
  @JsonKey(name: 'cases')
  final int cases;
  @override
  @JsonKey(name: 'todayCases')
  final int todayCases;
  @override
  @JsonKey(name: 'deaths')
  final int deaths;
  @override
  @JsonKey(name: 'todayDeaths')
  final int todayDeaths;
  @override
  @JsonKey(name: 'recovered')
  final int recovered;
  @override
  @JsonKey(name: 'todayRecovered')
  final int todayRecovered;
  @override
  @JsonKey(name: 'active')
  final int active;
  @override
  @JsonKey(name: 'critical')
  final int critical;
  @override
  @JsonKey(name: 'casesPerOneMillion')
  final double casesPerOneMillion;
  @override
  @JsonKey(name: 'deathsPerOneMillion')
  final double deathsPerOneMillion;
  @override
  @JsonKey(name: 'tests')
  final int tests;
  @override
  @JsonKey(name: 'testsPerOneMillion')
  final double testsPerOneMillion;
  @override
  @JsonKey(name: 'population')
  final int population;
  @override
  @JsonKey(name: 'activePerOneMillion')
  final double activePerOneMillion;
  @override
  @JsonKey(name: 'recoveredPerOneMillion')
  final double recoveredPerOneMillion;
  @override
  @JsonKey(name: 'criticalPerOneMillion')
  final double criticalPerOneMillion;
  @override
  @JsonKey(name: 'affectedCountries')
  final int affectedCountries;

  @override
  String toString() {
    return 'CovidInfos(update: $update, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, todayRecovered: $todayRecovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, population: $population, activePerOneMillion: $activePerOneMillion, recoveredPerOneMillion: $recoveredPerOneMillion, criticalPerOneMillion: $criticalPerOneMillion, affectedCountries: $affectedCountries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CovidInfos &&
            (identical(other.update, update) ||
                const DeepCollectionEquality().equals(other.update, update)) &&
            (identical(other.cases, cases) ||
                const DeepCollectionEquality().equals(other.cases, cases)) &&
            (identical(other.todayCases, todayCases) ||
                const DeepCollectionEquality()
                    .equals(other.todayCases, todayCases)) &&
            (identical(other.deaths, deaths) ||
                const DeepCollectionEquality().equals(other.deaths, deaths)) &&
            (identical(other.todayDeaths, todayDeaths) ||
                const DeepCollectionEquality()
                    .equals(other.todayDeaths, todayDeaths)) &&
            (identical(other.recovered, recovered) ||
                const DeepCollectionEquality()
                    .equals(other.recovered, recovered)) &&
            (identical(other.todayRecovered, todayRecovered) ||
                const DeepCollectionEquality()
                    .equals(other.todayRecovered, todayRecovered)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.critical, critical) ||
                const DeepCollectionEquality()
                    .equals(other.critical, critical)) &&
            (identical(other.casesPerOneMillion, casesPerOneMillion) ||
                const DeepCollectionEquality()
                    .equals(other.casesPerOneMillion, casesPerOneMillion)) &&
            (identical(other.deathsPerOneMillion, deathsPerOneMillion) ||
                const DeepCollectionEquality()
                    .equals(other.deathsPerOneMillion, deathsPerOneMillion)) &&
            (identical(other.tests, tests) ||
                const DeepCollectionEquality().equals(other.tests, tests)) &&
            (identical(other.testsPerOneMillion, testsPerOneMillion) ||
                const DeepCollectionEquality()
                    .equals(other.testsPerOneMillion, testsPerOneMillion)) &&
            (identical(other.population, population) ||
                const DeepCollectionEquality()
                    .equals(other.population, population)) &&
            (identical(other.activePerOneMillion, activePerOneMillion) ||
                const DeepCollectionEquality()
                    .equals(other.activePerOneMillion, activePerOneMillion)) &&
            (identical(other.recoveredPerOneMillion, recoveredPerOneMillion) ||
                const DeepCollectionEquality().equals(
                    other.recoveredPerOneMillion, recoveredPerOneMillion)) &&
            (identical(other.criticalPerOneMillion, criticalPerOneMillion) ||
                const DeepCollectionEquality().equals(
                    other.criticalPerOneMillion, criticalPerOneMillion)) &&
            (identical(other.affectedCountries, affectedCountries) ||
                const DeepCollectionEquality()
                    .equals(other.affectedCountries, affectedCountries)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(update) ^
      const DeepCollectionEquality().hash(cases) ^
      const DeepCollectionEquality().hash(todayCases) ^
      const DeepCollectionEquality().hash(deaths) ^
      const DeepCollectionEquality().hash(todayDeaths) ^
      const DeepCollectionEquality().hash(recovered) ^
      const DeepCollectionEquality().hash(todayRecovered) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(critical) ^
      const DeepCollectionEquality().hash(casesPerOneMillion) ^
      const DeepCollectionEquality().hash(deathsPerOneMillion) ^
      const DeepCollectionEquality().hash(tests) ^
      const DeepCollectionEquality().hash(testsPerOneMillion) ^
      const DeepCollectionEquality().hash(population) ^
      const DeepCollectionEquality().hash(activePerOneMillion) ^
      const DeepCollectionEquality().hash(recoveredPerOneMillion) ^
      const DeepCollectionEquality().hash(criticalPerOneMillion) ^
      const DeepCollectionEquality().hash(affectedCountries);

  @override
  _$CovidInfosCopyWith<_CovidInfos> get copyWith =>
      __$CovidInfosCopyWithImpl<_CovidInfos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CovidInfosToJson(this);
  }
}

abstract class _CovidInfos implements CovidInfos {
  const factory _CovidInfos(
      @JsonKey(name: 'updated')
          int update,
      @JsonKey(name: 'cases')
          int cases,
      @JsonKey(name: 'todayCases')
          int todayCases,
      @JsonKey(name: 'deaths')
          int deaths,
      @JsonKey(name: 'todayDeaths')
          int todayDeaths,
      @JsonKey(name: 'recovered')
          int recovered,
      @JsonKey(name: 'todayRecovered')
          int todayRecovered,
      @JsonKey(name: 'active')
          int active,
      @JsonKey(name: 'critical')
          int critical,
      @JsonKey(name: 'casesPerOneMillion')
          double casesPerOneMillion,
      @JsonKey(name: 'deathsPerOneMillion')
          double deathsPerOneMillion,
      @JsonKey(name: 'tests')
          int tests,
      @JsonKey(name: 'testsPerOneMillion')
          double testsPerOneMillion,
      @JsonKey(name: 'population')
          int population,
      @JsonKey(name: 'activePerOneMillion')
          double activePerOneMillion,
      @JsonKey(name: 'recoveredPerOneMillion')
          double recoveredPerOneMillion,
      @JsonKey(name: 'criticalPerOneMillion')
          double criticalPerOneMillion,
      @JsonKey(name: 'affectedCountries')
          int affectedCountries) = _$_CovidInfos;

  factory _CovidInfos.fromJson(Map<String, dynamic> json) =
      _$_CovidInfos.fromJson;

  @override
  @JsonKey(name: 'updated')
  int get update;
  @override
  @JsonKey(name: 'cases')
  int get cases;
  @override
  @JsonKey(name: 'todayCases')
  int get todayCases;
  @override
  @JsonKey(name: 'deaths')
  int get deaths;
  @override
  @JsonKey(name: 'todayDeaths')
  int get todayDeaths;
  @override
  @JsonKey(name: 'recovered')
  int get recovered;
  @override
  @JsonKey(name: 'todayRecovered')
  int get todayRecovered;
  @override
  @JsonKey(name: 'active')
  int get active;
  @override
  @JsonKey(name: 'critical')
  int get critical;
  @override
  @JsonKey(name: 'casesPerOneMillion')
  double get casesPerOneMillion;
  @override
  @JsonKey(name: 'deathsPerOneMillion')
  double get deathsPerOneMillion;
  @override
  @JsonKey(name: 'tests')
  int get tests;
  @override
  @JsonKey(name: 'testsPerOneMillion')
  double get testsPerOneMillion;
  @override
  @JsonKey(name: 'population')
  int get population;
  @override
  @JsonKey(name: 'activePerOneMillion')
  double get activePerOneMillion;
  @override
  @JsonKey(name: 'recoveredPerOneMillion')
  double get recoveredPerOneMillion;
  @override
  @JsonKey(name: 'criticalPerOneMillion')
  double get criticalPerOneMillion;
  @override
  @JsonKey(name: 'affectedCountries')
  int get affectedCountries;
  @override
  _$CovidInfosCopyWith<_CovidInfos> get copyWith;
}
