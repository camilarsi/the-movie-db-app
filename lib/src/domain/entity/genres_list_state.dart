import '../../core/util/data_state.dart';
import 'genre.dart';

class GenresListState {
  final DataStateStates state;
  List<Genre>? _genresList;
  String? _error;

  GenresListState({
    required this.state,
  });

  set genresList(List<Genre> value) {
    _genresList = value;
  }

  List<Genre>? get data => _genresList;

  set error(String value) {
    _error = value;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenresListState &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          _error == other._error;

  @override
  int get hashCode => state.hashCode ^ _error.hashCode;
}
