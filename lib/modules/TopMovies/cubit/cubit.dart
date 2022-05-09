import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_list/models/movie_model.dart';
import 'package:movies_list/models/video_model.dart';
import 'package:movies_list/modules/TopMovies/cubit/states.dart';
import 'package:http/http.dart' as http;
import 'package:movies_list/shared/network/end_points.dart';
import 'package:video_player/video_player.dart';

class TopMoviesCubit extends Cubit<TopMoviesStates> {
  TopMoviesCubit() : super(TopMoviesInitialState());

  static TopMoviesCubit get(context) => BlocProvider.of(context);

  late MovieModel movieModel;
  late VideoModel videoModel;
  VideoPlayerController? controller;
  Future<void>? initializeVideoPlayerFuture;
  void getTopMovies() async {
    emit(TopMoviesDataLoadingState());
    await http.get(Uri.parse(URL)).then((value) {
      movieModel = MovieModel.fromJson(json.decode(value.body));
      emit(TopMoviesDataSuccessState());
    }).catchError((error) {
      emit(TopMoviesDataErrorState());
    });
  }

  void getTopMoviesVideo() async {
    emit(TopMoviesVideoLoadingState());
    await http.get(Uri.parse(videoUrl)).then((value) {
      videoModel = VideoModel.fromJson(json.decode(value.body));
      print(videoModel.videos![0].url);
      emit(TopMoviesVideoSuccessState());
    }).catchError((error) {
      emit(TopMoviesDataErrorState());
    });
  }
}
