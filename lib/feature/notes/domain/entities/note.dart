import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String title;
  final String body;

  const Note({required this.id, required this.title, required this.body});


  @override
  List<Object> get props => [id, title, body];

}