/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:nmovie/model/models.dart';

class VideoResponse {
  final List<Video> videos;
  final String error;

  VideoResponse(this.videos, this.error);

  VideoResponse.fromJson(Map<String, dynamic> json)
      : videos = (json["results"] as List).map((i) => new Video.fromJson(i)).toList(),
        error = "";

  VideoResponse.withError(String errorValue)
      : videos = List(),
        error = errorValue;

  @override
  String toString() {
    return 'VideoResponse{videos: $videos, error: $error}';
  }
}
