import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../core/util/movie_section.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/remote_genre_list_repository.dart';
import '../../data/repository/remote_movies_list_repository.dart';
import '../../domain/entity/genre.dart';
import '../../domain/useCase/display_genres_list.dart';
import '../../domain/useCase/display_movies_list_from_section.dart';
import '../bloc/custom_drawer_bloc.dart';
import '../bloc/movies_grid_bloc.dart';
import '../widget/custom_drawer/custom_drawer.dart';
import '../widget/custom_inherited_widget.dart';
import '../widget/home_app_bar.dart';
import '../widget/movies_grid/movies_grid.dart';

class HomeScreen extends StatefulWidget {
  final Genre? genre;

  const HomeScreen({
    this.genre,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  final displayGenresList =
      DisplayGenresList(repository: RemoteGenresListRepository(Client()));
  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget(
      child: DefaultTabController(
        length: MovieSection.values.length,
        child: Scaffold(
          backgroundColor: Colors.black,
          drawer: CustomDrawer(
            customDrawerBloc: CustomDrawerBloc(
              displayGenresList: displayGenresList,
            ),
          ),
          appBar: HomeAppBar(
            avatarText: UiConstants.homeHomeAppBarAvatarText,
            title: widget.genre?.name != null
                ? '${UiConstants.homeAppBarBaseTittle} ${widget.genre!.name}'
                : UiConstants.homeAppBarBaseTittle,
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.white,
            tabs: MovieSection.values
                .map(
                  (section) => Tab(
                    text: section.title,
                  ),
                )
                .toList(),
            indicator: UiConstants.homeScreenTapBarIndicator,
          ),
          body: TabBarView(
            children: MovieSection.values
                .map(
                  (option) => MoviesGrid(
                    moviesBloc: MoviesGridBloc(
                      displayMoviesListFromSection:
                          DisplayMoviesListFromSection(
                        repository: RemoteMoviesListRepository(
                          Client(),
                        ),
                      ),
                      section: option,
                      genre: widget.genre,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
