enum MovieSection {
  nowPlaying(
    'Now Playing',
    'now_playing',
  ),
  popular(
    'Popular',
    'popular',
  ),
  topRated(
    'Top Rated',
    'top_rated',
  ),
  upcoming(
    'Upcoming',
    'upcoming',
  );

  const MovieSection(this.title, this.path);
  final String title;
  final String path;
}
