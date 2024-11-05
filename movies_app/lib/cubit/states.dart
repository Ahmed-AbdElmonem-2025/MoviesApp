import '../movie_model.dart';

abstract class MoviesStates {}

class GetMoviesInitialState extends MoviesStates {}
class GetMoviesLoadingState extends MoviesStates {}
class GetMoviesSuccessState extends MoviesStates {
  List<MovieModel> list =[];
  GetMoviesSuccessState({required this.list });
}
class GetMoviesErroeState extends MoviesStates {}

class GetMoviesFromPaginationLoadingState extends MoviesStates {}
class GetMoviesFromPaginationErrorState extends MoviesStates {}

 