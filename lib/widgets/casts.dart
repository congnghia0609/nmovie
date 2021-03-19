/*
 * @author nghiatc
 * @since Mar 19, 2021
 */

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nmovie/bloc/blocs.dart';
import 'package:nmovie/model/models.dart';
import 'package:nmovie/style/theme.dart' as Style;
import 'package:nmovie/widgets/widgets.dart';

class Casts extends StatefulWidget {
  final int id;

  const Casts({Key key, this.id}) : super(key: key);

  @override
  _CastsState createState() => _CastsState(id);
}

class _CastsState extends State<Casts> {
  final int id;

  _CastsState(this.id);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    castsBloc..getCasts(id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    castsBloc..drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "CASTS",
            style: TextStyle(color: Style.Colors.titleColor, fontWeight: FontWeight.w500, fontSize: 12.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<CastResponse>(
          stream: castsBloc.subject.stream,
          builder: (context, AsyncSnapshot<CastResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null && snapshot.data.error.length > 0) {
                return buildErrorWidget(snapshot.data.error);
              }
              return _buildCastWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return buildErrorWidget(snapshot.error);
            } else {
              return buildLoadingWidget();
            }
          },
        ),
      ],
    );
  }

  Widget _buildCastWidget(CastResponse data) {
    List<Cast> casts = data.casts;
    if (casts.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "No More Persions",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Container(
        height: 140.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: casts.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 8.0),
              width: 100.0,
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    casts[index].img == null
                        ? Hero(
                            tag: casts[index].id,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Style.Colors.secondColor,
                              ),
                              child: Icon(FontAwesomeIcons.userAlt, color: Colors.white),
                            ),
                          )
                        : Hero(
                            tag: casts[index].id,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("https://image.tmdb.org/t/p/w300/" + casts[index].img),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 10.0),
                    Text(
                      casts[index].name,
                      maxLines: 2,
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 9.0,
                      ),
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      casts[index].character,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.4,
                        color: Style.Colors.titleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 7.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
