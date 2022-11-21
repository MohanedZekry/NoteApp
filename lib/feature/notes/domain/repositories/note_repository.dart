import '../../../../core/error/failure.dart';
import '../entities/note.dart';
import 'package:dartz/dartz.dart';

abstract class NoteRepository {
  Future<Either<Failure,List<Note>>> getAllNotes();
  Future<Either<Failure, Unit>> deleteNote(int id);
  Future<Either<Failure, Unit>> updateNote(Note note);
  Future<Either<Failure, Unit>> addNote(Note note);
}