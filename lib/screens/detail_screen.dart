/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:flutter/material.dart';
import 'package:nmovie/bloc/blocs.dart';
import 'package:nmovie/model/models.dart';
import 'package:nmovie/style/theme.dart' as Style;
import 'package:sliver_fab/sliver_fab.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState(movie);
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final Movie movie;

  _MovieDetailScreenState(this.movie);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieVideosBloc..getMovieVideos(movie.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieVideosBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: new Builder(
        builder: (context) {
          return new SliverFab(
            floatingPosition: FloatingPosition(right: 20.0),
            floatingWidget: StreamBuilder<VideoResponse>(
              stream: movieVideosBloc.subject.stream,
              builder: (context, AsyncSnapshot<VideoResponse> snapshot) {

              },
            ),
            slivers: null,

          );
        },
      ),
    );
  }
}
