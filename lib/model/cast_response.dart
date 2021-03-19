/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:nmovie/model/cast.dart';

class CastResponse {
  final List<Cast> casts;
  final String error;

  CastResponse(this.casts, this.error);

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts = (json["cast"] as List).map((i) => new Cast.fromJson(i)).toList(),
        error = "";

  CastResponse.withError(String errorValue)
      : casts = List(),
        error = errorValue;

  @override
  String toString() {
    return 'CastResponse{casts: $casts, error: $error}';
  }
}
