import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

@freezed
abstract class Country with _$Country {
  @JsonSerializable(explicitToJson: true)
  const factory Country(
    @JsonKey(name: 'flag') String flag,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'alpha2Code') String alpha2Code,
    @JsonKey(name: 'population') int population,
  ) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
