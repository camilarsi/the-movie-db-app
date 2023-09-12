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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
      backdropPath: json['backdrop_path'],
    );
  }

  factory Movie.mockMovie() {
    return Movie(
      id: -1,
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      overview:
          ' While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      releaseDate: '2023-04-05',
      voteAverage: 7.8,
      genreIds: [
        16,
        10751,
        12,
        14,
        35,
      ],
      posterPath: 'assets/images/super_mario_bros._movie_poster.jpg',
      backdropPath: '',
    );
  }

  String get backdropUrl => '${UiConstants.imageBaseUrl}$backdropPath';
  String get posterUrl => '${UiConstants.imageBaseUrl}$posterPath';
}
