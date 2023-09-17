import '../../core/util/ui_constants.dart';

class Movie {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;
  final String posterPath;
  final String backdropPath;

  Movie({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genreIds,
    required this.posterPath,
    required this.backdropPath,
  });

  static List<Movie> fromJsonList(List<dynamic> json) {
    return json
        .map(
          (movie) => Movie.fromMoviesListBySectionJsonResult(
            movie,
          ),
        )
        .toList();
  }

  factory Movie.fromMoviesListBySectionJsonResult(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids']).toList(),
      backdropPath: json['backdrop_path'],
    );
  }

  factory Movie.fromMovieByIdJsonResult(Map<String, dynamic> json) {
    final genresData = json['genres'];
    final genresIds = List<int>.from(
      genresData
          .map(
            (genre) => genre['id'],
          )
          .toList(),
    );
    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: genresIds,
      backdropPath: json['backdrop_path'],
    );
  }

  factory Movie.mockMovie() {
    return Movie(
      id: 926393,
      originalTitle: "The Equalizer 3",
      overview:
          "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
      posterPath: "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
      releaseDate: "2023-08-30",
      title: "The Equalizer 3",
      voteAverage: 7.357,
      genreIds: [28, 53, 80],
      backdropPath: "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
    );
  }

  String get backdropUrl => '${UiConstants.imageBaseUrl}$backdropPath';
  String get posterUrl => '${UiConstants.imageBaseUrl}$posterPath';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
