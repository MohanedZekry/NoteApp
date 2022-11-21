import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/failure.dart';
import 'package:noteapp/core/use_case/base_use_case.dart';
import 'package:noteapp/feature/notes/domain/repositories/note_repository.dart';

import '../entities/note.dart';

class UpdateNoteUseCase extends BaseUseCase<Unit, Note>{
  final NoteRepository noteRepository;

  UpdateNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, Unit>> call(Note param) async{
    return await noteRepository.updateNote(param);
  }

}