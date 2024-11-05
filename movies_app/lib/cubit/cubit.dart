import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/states.dart';
import 'package:dio/dio.dart';
import '../movie_model.dart';

class MoviesCubit extends Cubit<MoviesStates>{
  MoviesCubit() : super(GetMoviesInitialState());

  List<MovieModel> list=[];
   
  var dio = Dio();

int pageNumber=1;
bool isLoading = false;

  getData()async{
    if (isLoading == true) {
      return;
    } else {
      isLoading=true;
      emit(GetMoviesLoadingState());
    }
    

  try {
     Response  response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?api_key=2d1a67eb34a08109f1144e4f095f4e4f&page=$pageNumber",

   );     
   // refactor
   var model = MoviesData.fromJson(response.data);
   if (model.list.isNotEmpty) {
      pageNumber++;
   list.addAll(model.list);
   }
  
   emit(GetMoviesSuccessState(list: list));

  } catch (e) {
     print('Error: $e');
       emit(GetMoviesErroeState());
  }finally{
     
      isLoading = false; // إنهاء حالة التحميل
   
  }
  }


     loadMore()async {
    if (!isLoading) { // إذا لم يكن في تحميل
    await  getData(); // استدعاء دالة جلب البيانات مرة تانية
    }
  }
  
}  

/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/states.dart';
import 'package:dio/dio.dart';
import '../movie_model.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(GetMoviesInitialState());

  List<MovieModel> list = [];
  late final Dio dio = Dio();
  
  int pageNumber = 1;
  bool isLoading = false;

  Future<void> getData() async {
    if (isLoading) {
      return;
    }

    isLoading = true;
    emit(GetMoviesLoadingState());

    try {
      Response response = await dio.get(
        "https://api.themoviedb.org/3/discover/movie?api_key=2d1a67eb34a08109f1144e4f095f4e4f&page=$pageNumber",
      );

      var model = MoviesData.fromJson(response.data);
      if (model.list.isNotEmpty) {
        pageNumber++;
        list.addAll(model.list);
      }

      emit(GetMoviesSuccessState(list: list));
    } catch (e) {
      print('Error: $e');
      emit(GetMoviesErroeState());
    } finally {
      isLoading = false; // إنهاء حالة التحميل
    }
  }

  Future<void> loadMore() async {
    if (!isLoading) { // إذا لم يكن في تحميل
      await getData(); // استدعاء دالة جلب البيانات مرة تانية
    }
  }
}*/