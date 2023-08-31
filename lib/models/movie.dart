class Movie {
  late final String title;
  late final String originalTitle;
  late final String overview;
  late final String releaseDate;
  late final String voteAverage;
  late final List<String> genres;
  late final String imgURL;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genres,
    required this.imgURL,
  });

  factory Movie.mockMovie() {
    return Movie(
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      overview:
          ' While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      releaseDate: '2023-04-05',
      voteAverage: '7.8',
      genres: [
        'Animation',
        'Family',
        'Adventure',
        'Fantasy',
        'Comedy',
      ],
      imgURL: 'assets/images/super_mario_bros._movie_poster.jpg',
    );
  }
}
