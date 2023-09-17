import '../../core/util/data_state.dart';
import 'movie.dart';

class MoviesListState {
  final DataStateStates state;
  List<Movie>? _moviesList;
  String? _error;

  MoviesListState({
    required this.state,
  });

  set error(String value) {
    _error = value;
  }

  set moviesList(List<Movie> value) {
    _moviesList = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesListState &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          _error == other._error;

  @override
  int get hashCode => state.hashCode ^ _moviesList.hashCode ^ _error.hashCode;

  List<Movie>? get data => _moviesList;
}
