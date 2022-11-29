import 'package:flutter/material.dart';
import 'package:noteapp/feature/notes/domain/entities/note.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note? note;
  final bool isUpdate;
  const NoteDetailsScreen({Key? key, this.note, required this.isUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            isUpdate ? 'Edit Note' : 'Add Note',
          ),
        ),
        body: buildForm(),
    );
  }

  Widget buildForm() =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        child: Column(
        ),
      );

}
