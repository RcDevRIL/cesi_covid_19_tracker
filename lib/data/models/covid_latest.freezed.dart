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

  _CovidLatest call(
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
      @JsonKey(name: 'affectedCountries') int affectedCountries) {
    return _CovidLatest(
      update,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      active,
      critical,
      casesPerOneMillion,
      deathsPerOneMillion,
      tests,
      testsPerOneMillion,
      affectedCountries,
    );
  }
}

// ignore: unused_element
const $CovidLatest = _$CovidLatestTearOff();

mixin _$CovidLatest {
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
  int get testsPerOneMillion;
  @JsonKey(name: 'affectedCountries')
  int get affectedCountries;

  Map<String, dynamic> toJson();
  $CovidLatestCopyWith<CovidLatest> get copyWith;
}

abstract class $CovidLatestCopyWith<$Res> {
  factory $CovidLatestCopyWith(
          CovidLatest value, $Res Function(CovidLatest) then) =
      _$CovidLatestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'updated') int update,
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
      @JsonKey(name: 'affectedCountries') int affectedCountries});
}

class _$CovidLatestCopyWithImpl<$Res> implements $CovidLatestCopyWith<$Res> {
  _$CovidLatestCopyWithImpl(this._value, this._then);

  final CovidLatest _value;
  // ignore: unused_field
  final $Res Function(CovidLatest) _then;

  @override
  $Res call({
    Object update = freezed,
    Object cases = freezed,
    Object todayCases = freezed,
    Object deaths = freezed,
    Object todayDeaths = freezed,
    Object recovered = freezed,
    Object active = freezed,
    Object critical = freezed,
    Object casesPerOneMillion = freezed,
    Object deathsPerOneMillion = freezed,
    Object tests = freezed,
    Object testsPerOneMillion = freezed,
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
          : testsPerOneMillion as int,
      affectedCountries: affectedCountries == freezed
          ? _value.affectedCountries
          : affectedCountries as int,
    ));
  }
}

abstract class _$CovidLatestCopyWith<$Res>
    implements $CovidLatestCopyWith<$Res> {
  factory _$CovidLatestCopyWith(
          _CovidLatest value, $Res Function(_CovidLatest) then) =
      __$CovidLatestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'updated') int update,
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
      @JsonKey(name: 'affectedCountries') int affectedCountries});
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
    Object update = freezed,
    Object cases = freezed,
    Object todayCases = freezed,
    Object deaths = freezed,
    Object todayDeaths = freezed,
    Object recovered = freezed,
    Object active = freezed,
    Object critical = freezed,
    Object casesPerOneMillion = freezed,
    Object deathsPerOneMillion = freezed,
    Object tests = freezed,
    Object testsPerOneMillion = freezed,
    Object affectedCountries = freezed,
  }) {
    return _then(_CovidLatest(
      update == freezed ? _value.update : update as int,
      cases == freezed ? _value.cases : cases as int,
      todayCases == freezed ? _value.todayCases : todayCases as int,
      deaths == freezed ? _value.deaths : deaths as int,
      todayDeaths == freezed ? _value.todayDeaths : todayDeaths as int,
      recovered == freezed ? _value.recovered : recovered as int,
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
          : testsPerOneMillion as int,
      affectedCountries == freezed
          ? _value.affectedCountries
          : affectedCountries as int,
    ));
  }
}

@JsonSerializable(explicitToJson: true)
class _$_CovidLatest with DiagnosticableTreeMixin implements _CovidLatest {
  const _$_CovidLatest(
      @JsonKey(name: 'updated') this.update,
      @JsonKey(name: 'cases') this.cases,
      @JsonKey(name: 'todayCases') this.todayCases,
      @JsonKey(name: 'deaths') this.deaths,
      @JsonKey(name: 'todayDeaths') this.todayDeaths,
      @JsonKey(name: 'recovered') this.recovered,
      @JsonKey(name: 'active') this.active,
      @JsonKey(name: 'critical') this.critical,
      @JsonKey(name: 'casesPerOneMillion') this.casesPerOneMillion,
      @JsonKey(name: 'deathsPerOneMillion') this.deathsPerOneMillion,
      @JsonKey(name: 'tests') this.tests,
      @JsonKey(name: 'testsPerOneMillion') this.testsPerOneMillion,
      @JsonKey(name: 'affectedCountries') this.affectedCountries)
      : assert(update != null),
        assert(cases != null),
        assert(todayCases != null),
        assert(deaths != null),
        assert(todayDeaths != null),
        assert(recovered != null),
        assert(active != null),
        assert(critical != null),
        assert(casesPerOneMillion != null),
        assert(deathsPerOneMillion != null),
        assert(tests != null),
        assert(testsPerOneMillion != null),
        assert(affectedCountries != null);

  factory _$_CovidLatest.fromJson(Map<String, dynamic> json) =>
      _$_$_CovidLatestFromJson(json);

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
  final int testsPerOneMillion;
  @override
  @JsonKey(name: 'affectedCountries')
  final int affectedCountries;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CovidLatest(update: $update, cases: $cases, todayCases: $todayCases, deaths: $deaths, todayDeaths: $todayDeaths, recovered: $recovered, active: $active, critical: $critical, casesPerOneMillion: $casesPerOneMillion, deathsPerOneMillion: $deathsPerOneMillion, tests: $tests, testsPerOneMillion: $testsPerOneMillion, affectedCountries: $affectedCountries)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CovidLatest'))
      ..add(DiagnosticsProperty('update', update))
      ..add(DiagnosticsProperty('cases', cases))
      ..add(DiagnosticsProperty('todayCases', todayCases))
      ..add(DiagnosticsProperty('deaths', deaths))
      ..add(DiagnosticsProperty('todayDeaths', todayDeaths))
      ..add(DiagnosticsProperty('recovered', recovered))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('critical', critical))
      ..add(DiagnosticsProperty('casesPerOneMillion', casesPerOneMillion))
      ..add(DiagnosticsProperty('deathsPerOneMillion', deathsPerOneMillion))
      ..add(DiagnosticsProperty('tests', tests))
      ..add(DiagnosticsProperty('testsPerOneMillion', testsPerOneMillion))
      ..add(DiagnosticsProperty('affectedCountries', affectedCountries));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CovidLatest &&
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
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(critical) ^
      const DeepCollectionEquality().hash(casesPerOneMillion) ^
      const DeepCollectionEquality().hash(deathsPerOneMillion) ^
      const DeepCollectionEquality().hash(tests) ^
      const DeepCollectionEquality().hash(testsPerOneMillion) ^
      const DeepCollectionEquality().hash(affectedCountries);

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
          @JsonKey(name: 'affectedCountries') int affectedCountries) =
      _$_CovidLatest;

  factory _CovidLatest.fromJson(Map<String, dynamic> json) =
      _$_CovidLatest.fromJson;

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
  int get testsPerOneMillion;
  @override
  @JsonKey(name: 'affectedCountries')
  int get affectedCountries;
  @override
  _$CovidLatestCopyWith<_CovidLatest> get copyWith;
}
