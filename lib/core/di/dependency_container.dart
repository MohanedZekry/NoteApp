import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:noteapp/core/network/network_connection.dart';
import 'package:noteapp/feature/notes/data/data_sources/local/note_local_data_source.dart';
import 'package:noteapp/feature/notes/data/data_sources/local/note_local_data_source_impl.dart';
import 'package:noteapp/feature/notes/data/data_sources/remote/note_remote_data_soruce_impl.dart';
import 'package:noteapp/feature/notes/data/data_sources/remote/note_remote_data_source.dart';
import 'package:noteapp/feature/notes/data/repositories/note_repository_impl.dart';
import 'package:noteapp/feature/notes/domain/repositories/note_repository.dart';
import 'package:noteapp/feature/notes/domain/use_cases/add_note_use_case.dart';
import 'package:noteapp/feature/notes/domain/use_cases/delete_note_use_case.dart';
import 'package:noteapp/feature/notes/domain/use_cases/get_all_notes_use_case.dart';
import 'package:noteapp/feature/notes/domain/use_cases/update_note_use_case.dart';
import 'package:noteapp/feature/notes/presentation/controller/note/note_bloc.dart';
import 'package:noteapp/feature/notes/presentation/controller/note_details/note_details_bloc.dart';

import '../../infrastructure/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  /// Data Source ///
  getIt.registerLazySingleton<NoteLocalDataSource>(
          () => NoteLocalDataSourceImpl());
  getIt.registerLazySingleton<NoteRemoteDataSource>(
          () => NoteRemoteDataSourceImpl());

  /// Core ///
  getIt.registerLazySingleton<NetworkConnection>(
          () => NetworkConnectionImpl(connectionChecker: getIt()));

  /// Repository ///
  getIt.registerLazySingleton<NoteRepository>(
          () => NoteRepositoryImpl(
          noteRemoteDataSource: getIt(),
          noteLocalDataSource: getIt(),
          networkConnection: getIt()));

  /// Usecases ///
  getIt.registerLazySingleton(
          () => AddNoteUseCase(noteRepository: getIt()));
  getIt.registerLazySingleton(
          () => UpdateNoteUseCase(noteRepository: getIt()));
  getIt.registerLazySingleton(
          () => DeleteNoteUseCase(noteRepository: getIt()));
  getIt.registerLazySingleton(
          () => GetAllNoteUseCase(noteRepository: getIt()));

  /// BLoC ///
  getIt.registerFactory(() => NoteBloc(getAllNotesUseCase: getIt()));
  getIt.registerFactory(
          () => NoteDetailsBloc(
              addNoteUseCase: getIt(),
              updateNoteUseCase: getIt(),
              deleteNoteUseCase: getIt()
          ));


  /// Externals ///
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  await SharedPreferencesHelper.init();

}