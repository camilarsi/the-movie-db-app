import 'package:flutter/material.dart';

import '../../../config/route/routes_generator.dart';
import '../../../core/util/data_state.dart';
import '../../../domain/entity/genres_list_state.dart';
import '../../bloc/custom_drawer_bloc.dart';
import '../custom_inherited_widget.dart';
import 'custom_drawer_list_tile_text.dart';

class CustomDrawer extends StatefulWidget {
  final CustomDrawerBloc customDrawerBloc;

  const CustomDrawer({
    required this.customDrawerBloc,
    super.key,
  });
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    super.initState();
    widget.customDrawerBloc.getGenres();
  }

  static const Text header = Text(
    'filter by genres',
    style: TextStyle(fontSize: 20),
  );

  @override
  Widget build(BuildContext context) {
    return CustomInheritedWidget(
      child: StreamBuilder<GenresListState>(
        stream: widget.customDrawerBloc.dataStream,
        builder: (
          BuildContext context,
          AsyncSnapshot<GenresListState> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final dataState = snapshot.data;
            switch (dataState?.state) {
              case DataStateStates.success:
                return Drawer(
                  backgroundColor: Colors.black,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: header,
                      ),
                      ...?dataState?.data
                          ?.map(
                            (genre) => ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteGenerator.movieGridByGenre,
                                  arguments: genre,
                                );
                              },
                              title: CustomDrawerListTileText(genre: genre),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                );
              default:
                return Container();
            }
          }
        },
      ),
    );
  }
}
