import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/cubit.dart';
import 'package:movies_app/cubit/states.dart';
import 'package:movies_app/movie_details_model.dart';
import '../movie_model.dart';
import 'details_screen.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: BlocBuilder<MoviesCubit, MoviesStates>(
          builder: (context, state) {
            MoviesCubit cubit = BlocProvider.of<MoviesCubit>(context);
            if (state is GetMoviesLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetMoviesErroeState) {
              return Center(child: Text('فشل في تحميل البيانات'));
            } else if (state is GetMoviesSuccessState) {
              return NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                    if (!(cubit.state is GetMoviesFromPaginationLoadingState)) {
                      cubit.loadMore();
                    }
                  }
                  return true;
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.list.length + (cubit.state is GetMoviesFromPaginationLoadingState ? 1 : 0),
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    if (index == state.list.length) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Item(movieModel: state.list[index]);
                  },
                ),
              );
            } else {
              return Center(child: Text('حدث خطأ'));
            }
          },
        ),
      ),
    );
  }
}

// movie item
class Item extends StatelessWidget {
  final MovieModel movieModel;
  const Item({Key? key, required this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsView(movieModel: movieModel,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.brown.withOpacity(0.1),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Image.network(movieModel.image)),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      movieModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      movieModel.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        SizedBox(width: 3),
                        Text(
                          movieModel.voteAverage.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}