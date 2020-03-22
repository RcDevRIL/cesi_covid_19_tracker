import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_latest.freezed.dart';
part 'covid_latest.g.dart';

@freezed
abstract class CovidLatest with _$CovidLatest {
  @JsonSerializable(explicitToJson: true)
  const factory CovidLatest(
    @JsonKey(name: 'latest') Map<String, int> apiResponse,
  ) = _CovidLatest;

  factory CovidLatest.fromJson(Map<String, dynamic> json) =>
      _$CovidLatestFromJson(json);
}
