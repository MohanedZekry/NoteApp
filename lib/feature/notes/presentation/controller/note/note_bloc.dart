import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:noteapp/core/error/failure.dart';
import 'package:noteapp/core/use_case/base_use_case.dart';
import 'package:noteapp/core/utils/failures.dart';
import '../../../domain/entities/note.dart';
import '../../../domain/use_cases/get_all_notes_use_case.dart';
part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {

  final GetAllNoteUseCase getAllNotesUseCase;

  NoteBloc({required this.getAllNotesUseCase}) : super(NoteInitial()) {
    on<NoteEvent>((event, emit) async {
      if(event is GetAllNotesEvent){
        emit(LoadingNotesState());

        final result = await getAllNotesUseCase.call(const DefaultParams());
        emit(_mapResponseToState(result));
      }else if(event is RefreshNotesEvent){
        emit(LoadingNotesState());

        final result = await getAllNotesUseCase.call(const DefaultParams());
        emit(_mapResponseToState(result));
      }
    });
  }

  NoteState _mapResponseToState(Either<Failure, List<Note>> either){
    return either.fold(
            (l) => ErrorNoteState(message: _mapFailureToMessage(l)),
            (r) => LoadedNotesState(notes: r)
    );
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure :
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure :
        return OFFLINE_FAILURE_MESSAGE;
      case NoDataFailure :
        return NO_DATA_FAILURE_MESSAGE;
      default :
        return "Unexpected error, Please try again later.";
    }
  }

}
