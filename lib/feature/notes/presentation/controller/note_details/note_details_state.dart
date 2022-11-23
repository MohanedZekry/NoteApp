part of 'note_details_bloc.dart';

@immutable
abstract class NoteDetailsState extends Equatable {
  const NoteDetailsState();

  @override
  List<Object> get props => [];
}

class NoteDetailsInitial extends NoteDetailsState {}

class LoadingNoteDetailsState extends NoteDetailsState {}

class ErrorNoteDetailsState extends NoteDetailsState {
  final String message;

  const ErrorNoteDetailsState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessfulNoteDetailsState extends NoteDetailsState {
  final String message;

  const SuccessfulNoteDetailsState({required this.message});

  @override
  List<Object> get props => [message];
}