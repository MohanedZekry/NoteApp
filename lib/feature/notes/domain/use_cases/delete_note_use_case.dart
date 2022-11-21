import 'package:dartz/dartz.dart';
import 'package:noteapp/core/error/failure.dart';
import 'package:noteapp/core/use_case/base_use_case.dart';
import 'package:noteapp/feature/notes/domain/repositories/note_repository.dart';

import '../entities/note.dart';

class DeleteNoteUseCase extends BaseUseCase<Unit, int>{
  final NoteRepository noteRepository;

  DeleteNoteUseCase({required this.noteRepository});

  @override
  Future<Either<Failure, Unit>> call(int param) async{
    return await noteRepository.deleteNote(param);
  }

}