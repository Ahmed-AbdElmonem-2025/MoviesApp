 class MoviesData {
  late final int page, totalPages, totalResults;
  late final List<MovieModel> list;

  MoviesData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    list = List.from(json['results']).map((e) => MovieModel.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
 



class MovieModel {
  late final bool adult;
  late final String image;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;


 

  MovieModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false; // تعيين قيمة افتراضية إذا كانت null
    image = "http://image.tmdb.org/t/p/original${json['backdrop_path'] ?? ''}"; // تأكد من وجود back drop path
    genreIds = List<int>.from(json['genre_ids'] ?? []); // استخدم List<int>.from
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? ''; // تعيين قيمة افتراضية إذا كانت null
    originalTitle = json['original_title'] ?? ''; // تعيين قيمة افتراضية إذا كانت null
    overview = json['overview'] ?? ''; // تعيين قيمة افتراضية إذا كانت null
    popularity = (json['popularity'] ?? 0.0).toDouble(); // تأكد من أن القيمة هي double
    posterPath = json['poster_path'] ?? ''; // تعيين قيمة افتراضية إذا كانت null
    releaseDate = json['release_date'] ?? ''; // تعيين قيمة افتراضية إذا كانت null
    title = json['title'] ?? 'Unnamed Movie'; // تعيين قيمة افتراضية إذا كانت null
    video = json['video'] ?? false; // تعيين قيمة افتراضية إذا كانت null
    voteAverage = (json['vote_average'] ?? 0.0).toDouble(); // تأكد من أن القيمة هي double
    voteCount = json['vote_count'] ?? 0; // تعيين قيمة افتراضية إذا كانت null
  }

}