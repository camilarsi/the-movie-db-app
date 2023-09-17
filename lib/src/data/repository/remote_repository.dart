import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../core/util/data_state.dart';
import '../../core/util/ui_constants.dart';

abstract class RemoteRepository<T> {
  final Client client;

  RemoteRepository(
    Client? client,
  ) : client = client ?? Client();

  Future<DataState<T>> fetch(
    Function parseData,
    Uri uri,
  ) async {
    try {
      final response = await client.get(uri);
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        return DataState(
          state: DataStateStates.success,
          data: parseData(json),
        );
      }
      return onError(response);
    } catch (exception) {
      rethrow;
    }
  }

  Future<DataState<T>> onError(Response response) async {
    return DataState(
      state: DataStateStates.error,
      error: switch (response.statusCode) {
        HttpStatus.badRequest => UiConstants.badRequestHttpStatusMessage,
        HttpStatus.notFound => UiConstants.notFoundHttpStatusMessage,
        HttpStatus.internalServerError =>
          UiConstants.internalServerErrorHttpStatusMessage,
        (_) => UiConstants.defaultFailMessage,
      },
    );
  }
}
