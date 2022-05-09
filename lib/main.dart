import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_list/modules/TopMovies/cubit/cubit.dart';
import 'package:movies_list/modules/TopMovies/cubit/states.dart';
import 'package:movies_list/shared/bloc_observer.dart';
import 'package:movies_list/shared/styles/themes.dart';
import 'modules/TopMovies/top_movies.dart';


void main() async {
  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TopMoviesCubit()..getTopMovies(),
      child: BlocConsumer<TopMoviesCubit,TopMoviesStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: TopMovies(),
          );
        },
      ),
    );
  }
}
