import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/core/utils/messages.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/failures.dart';
import '../../../domain/entities/note.dart';
import '../../../domain/use_cases/add_note_use_case.dart';
import '../../../domain/use_cases/delete_note_use_case.dart';
import '../../../domain/use_cases/update_note_use_case.dart';
part 'note_details_event.dart';
part 'note_details_state.dart';

class NoteDetailsBloc extends Bloc<NoteDetailsEvent, NoteDetailsState> {
  final AddNoteUseCase addNoteUseCase;
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;

  NoteDetailsBloc({required this.addNoteUseCase,
    required this.updateNoteUseCase,required this.deleteNoteUseCase})
      : super(NoteDetailsInitial()) {

    on<NoteDetailsEvent>((event, emit) async {
      if(event is AddNoteEvent){
        emit(LoadingNoteDetailsState());
        final result = await addNoteUseCase.call(event.note);
        emit(_eitherSuccessOrFailed(result));
      }else if(event is UpdateNoteEvent){
        emit(LoadingNoteDetailsState());
        final result = await updateNoteUseCase.call(event.note);
        emit(_eitherSuccessOrFailed(result));
      }else if(event is DeleteNoteEvent){
        emit(LoadingNoteDetailsState());
        final result = await deleteNoteUseCase.call(event.id);
        emit(_eitherSuccessOrFailed(result));
      }
    });
  }

  NoteDetailsState _eitherSuccessOrFailed(Either<Failure, Unit> either){
    return either.fold(
            (l) => ErrorNoteDetailsState(message: _mapFailureToMessage(l)),
            (_) => const SuccessfulNoteDetailsState(message: SUCCESS_MESSAGE)
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure :
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure :
        return OFFLINE_FAILURE_MESSAGE;
      default :
        return "Unexpected error, Please try again later.";
    }
  }

}
