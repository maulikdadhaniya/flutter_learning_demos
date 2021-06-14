class Movie {
  final String imbdId;
  final String poster;
  final String title;
  final String year;

  Movie(
      {required this.imbdId,
      required this.poster,
      required this.title,
      required this.year});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        imbdId: json["imdbID"],
        poster: json["Poster"],
        title: json["Title"],
        year: json["Year"]);
  }
}
