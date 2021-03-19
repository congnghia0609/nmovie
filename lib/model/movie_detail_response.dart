/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:nmovie/model/models.dart';

class MovieDetailResponse {
  final MovieDetail movieDetail;
  final String error;

  MovieDetailResponse(this.movieDetail, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJson(json),
        error = "";

  MovieDetailResponse.withError(String errorValue)
      : movieDetail = MovieDetail(null, null, null, null, null, "", null),
        error = errorValue;

  @override
  String toString() {
    return 'MovieDetailResponse{movieDetail: $movieDetail, error: $error}';
  }
}
