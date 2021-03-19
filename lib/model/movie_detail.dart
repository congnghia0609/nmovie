/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:nmovie/model/models.dart';

class MovieDetail {
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final List<Company> conpanies;
  final String releaseDate;
  final int runtime;

  MovieDetail(this.id, this.adult, this.budget, this.genres, this.conpanies, this.releaseDate, this.runtime);

  MovieDetail.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        adult = json["adult"],
        budget = json["budget"],
        genres = (json["genres"] as List).map((e) => new Genre.fromJson(e)).toList(),
        conpanies = (json["production_companies"] as List).map((e) => new Company.fromJson(e)).toList(),
        releaseDate = json["release_date"],
        runtime = json["runtime"];

  @override
  String toString() {
    return 'MovieDetail{id: $id, adult: $adult, budget: $budget, genres: $genres, conpanies: $conpanies, releaseDate: $releaseDate, runtime: $runtime}';
  }
}
