import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_latest.freezed.dart';
part 'covid_latest.g.dart';

/* 
/!\ Il faut rajouter le commentaire suivant sur covid_latest.g.dart /!\
/!\ si on le génère à nouveau. Ce commentaire fait en sorte d'ignorer /!\
/!\ une certaine règle qui fait planter l'analyse statique du code /!\
/!\ et par la même occasion fait arreter nos builds sur l'outil CI/CD /!\ */

// ignore_for_file: non_constant_identifier_names
@freezed
abstract class CovidLatest with _$CovidLatest {
  @JsonSerializable(explicitToJson: true)
  const factory CovidLatest(
    @JsonKey(name: 'latest') Map<String, int> apiResponse,
  ) = _CovidLatest;

  factory CovidLatest.fromJson(Map<String, dynamic> json) =>
      _$CovidLatestFromJson(json);
}
