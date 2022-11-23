part of 'note_details_bloc.dart';

@immutable
abstract class NoteDetailsEvent extends Equatable {

  const NoteDetailsEvent();

  @override
  List<Object> get props => [];
}

class AddNoteEvent extends NoteDetailsEvent {
  final Note note;

  const AddNoteEvent({required this.note});

  @override
  List<Object> get props => [note];

}

class UpdateNoteEvent extends NoteDetailsEvent {
  final Note note;

  const UpdateNoteEvent({required this.note});

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NoteDetailsEvent {
  final int id;

  const DeleteNoteEvent({required this.id});

  @override
  List<Object> get props => [id];
}

