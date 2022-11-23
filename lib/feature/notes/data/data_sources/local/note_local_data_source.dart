import 'package:dartz/dartz.dart';
import 'package:noteapp/feature/notes/data/models/note_model.dart';

abstract class NoteLocalDataSource {

  Future<List<NoteModel>> getAllSavedNotes();
  Future<Unit> cacheNote(List<NoteModel> noteModel);

}