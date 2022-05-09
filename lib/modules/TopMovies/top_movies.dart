import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_list/modules/TopMovies/cubit/states.dart';
import 'cubit/cubit.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
class TopMovies extends StatelessWidget {
  const TopMovies({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopMoviesCubit, TopMoviesStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('Top 250 Movies')),
          ),
          body: ConditionalBuilder(
            condition: state is! TopMoviesDataLoadingState,
            builder: (BuildContext context) => ListView.separated(
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                         TopMoviesCubit.get(context).getTopMoviesVideo();
                        },
                        child: Card(
                          elevation: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 200,
                            child: Row(
                              children: [
                                Image.network(TopMoviesCubit.get(context)
                                    .movieModel
                                    .movie![index]
                                    .image),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${TopMoviesCubit.get(context).movieModel.movie![index].rank}. ${TopMoviesCubit.get(context).movieModel.movie![index].fullTitle}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                            const TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('IMDb Rating ',style: TextStyle(fontWeight: FontWeight.bold),),
                                          const Icon(Icons.star,color: Colors.yellow,),
                                          Text(
                                            TopMoviesCubit.get(context).movieModel.movie![index].iMDPRating,
                                            style: const TextStyle(fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 10,
                ),
                itemCount: TopMoviesCubit.get(context).movieModel.movie!.length),
            fallback: (BuildContext context) => Center(
              child: Scaffold(
                appBar: AppBar(),
                body: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
