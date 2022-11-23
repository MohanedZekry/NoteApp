import 'package:dartz/dartz.dart';
import '../../models/note_model.dart';

abstract class NoteRemoteDataSource {

  Future<List<NoteModel>> getAllNotes();
  Future<Unit> addNote(NoteModel noteModel);
  Future<Unit> deleteNote(int id);
  Future<Unit> updateNote(NoteModel noteModel);

}