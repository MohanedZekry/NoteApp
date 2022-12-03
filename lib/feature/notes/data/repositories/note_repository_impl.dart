import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/exceptions.dart';
import 'package:noteapp/core/error/failure.dart';
import 'package:noteapp/core/network/network_connection.dart';
import 'package:noteapp/feature/notes/data/data_sources/local/note_local_data_source.dart';
import 'package:noteapp/feature/notes/data/data_sources/remote/note_remote_data_source.dart';
import 'package:noteapp/feature/notes/data/models/note_model.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';
import 'package:noteapp/feature/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {

  final NoteRemoteDataSource noteRemoteDataSource;
  final NoteLocalDataSource noteLocalDataSource;
  final NetworkConnection networkConnection;

  const NoteRepositoryImpl({required this.noteRemoteDataSource, required this.noteLocalDataSource, required this.networkConnection});

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    if(await networkConnection.isConnected){
      try {
        final result = await noteRemoteDataSource.getAllNotes();
        await noteLocalDataSource.cacheNote(result);
        return right(result);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException{
        return Left(SocketFailure());
      }
    }else{
      try {
        final result = await noteLocalDataSource.getAllSavedNotes();
        return right(result);
      } on NoDataException{
        return left(NoDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addNote(Note note) async {
    final NoteModel noteModel = NoteModel(title: note.title, body: note.body);
    return await _responseCall(() => noteRemoteDataSource.addNote(noteModel));
  }

  @override
  Future<Either<Failure, Unit>> updateNote(Note note) async {
    final NoteModel noteModel = NoteModel(id: note.id, title: note.title, body: note.body);
    return await _responseCall(() => noteRemoteDataSource.updateNote(noteModel));
  }

  @override
  Future<Either<Failure, Unit>> deleteNote(int id) async {
    return await _responseCall(() => noteRemoteDataSource.deleteNote(id));
  }

  Future<Either<Failure, Unit>> _responseCall(
      Future<Unit> Function() deleteUpdateAddNote) async {
    if(await networkConnection.isConnected){
      try {
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(OfflineFailure());
    }
  }

}