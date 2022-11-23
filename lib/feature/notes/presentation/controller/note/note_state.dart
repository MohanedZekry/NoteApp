part of 'note_bloc.dart';

@immutable
abstract class NoteState extends Equatable {

  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class LoadingNotesState extends NoteState {}

class LoadedNotesState extends NoteState {
  final List<Note> notes;

  const LoadedNotesState({required this.notes});

  @override
  List<Object> get props => [notes];
}

class ErrorNoteState extends NoteState {
  final String message;

  const ErrorNoteState({required this.message});

  @override
  List<Object> get props => [message];
}