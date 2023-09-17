import 'dart:async';

import 'package:http/http.dart';

import '../../core/util/data_state.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/remote_genre_list_repository.dart';
import '../../domain/entity/genres_list_state.dart';
import '../../domain/useCase/display_genres_list.dart';

class CustomDrawerBloc {
  late final GenresListState _genresListDataState;
  final DisplayGenresList displayGenresList;
  final StreamController<GenresListState> dataController =
      StreamController.broadcast();

  Stream<GenresListState> get dataStream => dataController.stream;

  CustomDrawerBloc({DisplayGenresList? displayGenresList})
      : displayGenresList = displayGenresList ??
            DisplayGenresList(
              repository: RemoteGenresListRepository(
                Client(),
              ),
            );

  Future<void> getGenres() async {
    var genresListDataState = await displayGenresList.fetchGenres();
    GenresListState genresListState = GenresListState(
      state: genresListDataState.state,
    );
    switch (genresListState.state) {
      case DataStateStates.success:
        genresListState.genresList = genresListDataState.data!;
      case DataStateStates.error:
        genresListState.error =
            '${UiConstants.defaultFailMessage}: ${genresListDataState.error!}';
      default:
        genresListState.error = UiConstants.emptyResponseMessage;
    }
    dataController.sink.add(genresListState);
  }

  GenresListState get currentGenres => _genresListDataState;
}
