import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/failure.dart';
import 'package:noteapp/core/use_case/base_use_case.dart';
import 'package:noteapp/feature/notes/domain/repositories/note_repository.dart';

import '../entities/note.dart';

class GetAllNoteUseCase extends BaseUseCase<List<Note>, DefaultParams>{

  final NoteRepository noteRepository;
  GetAllNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, List<Note>>> call(DefaultParams param) async{
    return await noteRepository.getAllNotes();
  }

}