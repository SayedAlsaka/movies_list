import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../TopMovies/cubit/cubit.dart';
import '../TopMovies/cubit/states.dart';
class VideoScreen extends StatelessWidget {
   VideoScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopMoviesCubit, TopMoviesStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
            future: TopMoviesCubit.get(context).initializeVideoPlayerFuture,
              builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return AspectRatio(
                  child: VideoPlayer(TopMoviesCubit.get(context).controller!),
                    aspectRatio: TopMoviesCubit.get(context).controller!.value.aspectRatio);
              }else
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              ),
        );
      },
    );
  }
}
