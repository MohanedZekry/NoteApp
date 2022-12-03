import '../../domain/entities/note.dart';

class NoteModel extends Note {

  const NoteModel({super.id, required super.title, required super.body});

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      NoteModel(id: json['id'], title: json['title'], body: json['body']);

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body
  };

}